locals {
  repositories_python = [
    {
      name : "python.bitbucket-cli"
      description : "A CLI application created to manage BitBucket resources.",
      topics : ["python", "bitbucket", "cli"],
      open_source : true,
    },
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

    },
    {
      name : "python.scripts"
      description : "A collection of Python scripts for various tasks.",
      topics : ["python", "scripts"]
    }
  ]
}