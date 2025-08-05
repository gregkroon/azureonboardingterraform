output "repository_url" {
  description = "URL of the newly created Azure DevOps repository"
  value       = "https://${var.azure_devops_url}/${var.project_name}/_git/${var.repo_name}"
}

output "project_name" {
  description = "Azure DevOps project name"
  value       = var.project_name
}

output "template_type" {
  description = "Application template type to use for initializing the repo"
  value       = var.template_type
}

output "azure_devops_url" {
  description = "Azure DevOps organization URL segment"
  value       = var.azure_devops_url
}
