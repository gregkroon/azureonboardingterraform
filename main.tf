terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "~> 1.0"
    }
  }
}

provider "azuredevops" {
  org_service_url       = "https://${var.azure_devops_url}"
  personal_access_token = var.azure_pat
}

# Try to fetch the project. If it doesn't exist, fallback to creating it.
data "azuredevops_project" "existing" {
  name = var.project_name
  # If this fails, terraform will fall back to creating the project using the resource block below.
}

# Only create the project if it doesn't already exist.
resource "azuredevops_project" "project" {
  count       = can(data.azuredevops_project.existing.id) ? 0 : 1
  name        = var.project_name
  visibility  = "private"
  version_control = "Git"
  work_item_template = "Agile"
  description = "Project created by Terraform if not present"
}

resource "azuredevops_git_repository" "new_repo" {
  project_id   = can(data.azuredevops_project.existing.id) ? data.azuredevops_project.existing.id : azuredevops_project.project[0].id
  name         = var.repo_name
  initialization {
    init_type = "Clean"
  }
}
