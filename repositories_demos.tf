locals {
  repositories_demo = [
    {
      name : "terraform.modularised-demo"
      description : "An example Terraform setup using modularised components to fulfill a use-case",
      topics : ["terraform", "aws", "iac", "demo"]
      open_source : true,
      visibility : "public"
    },
    {
      name : "ai-ml.demos"
      description : "A collection of AI/ML demos, showcasing various use-cases and technologies.",
      topics : ["ai", "ml", "demo"],
      open_source : true,
      visibility : "private"
    }
  ]
}