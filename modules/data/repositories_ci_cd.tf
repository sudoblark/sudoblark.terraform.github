locals {
  repositories_ci_cd = [
    {
      name : "github-actions.library"
      description : "Template library of re-usable components for usage in GitHub Actions.",
      topics : ["yaml", "github-actions", "library"]
      visibility : "public"
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
