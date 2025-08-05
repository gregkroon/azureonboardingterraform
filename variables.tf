variable "azure_devops_url" {
  description = "Azure DevOps organization domain only (e.g., dev.azure.com/myorg)"
  type        = string
  default     = "${env("AZURE_DEVOPS_URL")}"  # Accept from env var
}

variable "azure_pat" {
  description = "Azure DevOps Personal Access Token"
  type        = string
  sensitive   = true
  default     = "${env("AZURE_DEVOPS_PAT")}"  # Accept from env var
}

variable "project_name" {
  description = "Azure DevOps project name"
  type        = string
  default     = "${env("AZURE_PROJECT_NAME")}"  # Accept from env var
}

variable "repo_name" {
  description = "Name of the new repository to create"
  type        = string
  default     = "${env("TARGET_REPO_NAME")}"  # Accept from env var
}

variable "template_type" {
  description = "(Optional) Template type - ignored by Terraform but useful in external scripts."
  type        = string
  default     = "${env("TEMPLATE_REPO_NAME")}"  # Accept from env var
}
