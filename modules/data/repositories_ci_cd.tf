locals {
  repositories_ci_cd = [
    {
      name : "terraform.ci-cd-observability-monitoring"
      description : "Terraform, and application code, showcasing an event-driven architecture for monitoring of: GitLab, GitHub, Azure DevOps, CircleCI.",
      topics : ["terraform", "aws", "iac", "python"]
    },
    {
      name : "azure-devops.library"
      description : "Template library of re-usable components for usage in Azure DevOps Pipelines.",
      topics : ["yaml", "azure-devops-pipelines", "library"]
      open_source : true
    },
    {
      name : "azure-devops.workflows"
      description : "Template library of re-usable, end-to-end, workflows for Azure DevOps Pipelines.",
      topics : ["yaml", "azure-devops-pipelines"]
      open_source : true
    },
    {
      name : "github-actions.library"
      description : "Template library of re-usable components for usage in GitHub Actions.",
      topics : ["yaml", "github-actions", "library"]
      visibility : "public"
      open_source : true
    },
    {
      name : "github-actions.agent"
      description : "An example custom CI/CD agent for GitHub Actions, complete with localised kubernetes deployment.",
      topics : ["github-actions", "docker", "kubernetes"]
      open_source : true
    },
    {
      name : "github-actions.workflows"
      description : "Template library of re-usable, end-to-end, workflows for GitHub Actions.",
      topics : ["yaml", "github-actions", "workflows"]
      open_source : true
    },
    {
      name : "python.ci-cli"
      description : "CLI application intended to be used in CI/CD operations within Sudoblark."
      topics : ["python", "cli"]
      open_source : true
      visibility : "private"
    }
  ]
}
