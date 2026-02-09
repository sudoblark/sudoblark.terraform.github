locals {
  repositories_python = [
    {
      name : "python.github-cli"
      description : "A CLI application created to manage BitBucket resources.",
      topics : ["python", "bitbucket", "cli"],
      open_source : true
    },
    {
      name : "python.core"
      description : "Core Python library for Sudoblark."
      topics : ["python", "library"]
      open_source : true
      visibility : "public"

    }
  ]
}
