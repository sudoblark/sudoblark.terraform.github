locals {
  repositories_bookshelf = [
    {
      name : "bookshelf.data-lake"
      description : "Terraform module to manage the Bookshelf data lake, including infrastructure for storing and processing data related to the Bookshelf project."
      open_source : false
      visibility : "private"
    },
    {
      name : "bookshelf.frontend"
      description : "Frontend application for the Bookshelf project, built with Flutter, providing a user interface for browsing and managing the bookshelf data."
      topics : ["flutter", "frontend", "bookshelf"]
      open_source : false
      visibility : "private"
    },
    {
      name : "bookshelf.backend"
      description : "Backend application for the Bookshelf project, built with Python and FastAPI, providing APIs for managing bookshelf data and integrating with the data lake."
      topics : ["python", "fastapi", "backend", "bookshelf"]
      open_source : false
      visibility : "private"
    },
    {
      name : "bookshelf.cognito",
      description : "Terraform module to manage AWS Cognito resources for the Bookshelf project, including user pools and identity pools for authentication and authorization.",
      topics : ["terraform", "aws", "cognito", "bookshelf"]
      open_source : false
      visibility : "private"
    }
  ]
}
