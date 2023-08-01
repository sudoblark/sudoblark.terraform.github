# Repository variables

variable "name" {
  description = "Name of the repository to be created."
  type = string
}

variable "description" {
  description = "Description we should give to the repository"
  type = string
}

variable "archived" {
  description = "If the repository is archived or not."
  type = bool
  default = false
}

variable "topics" {
  default     = null
  description = "An array of topic names to be added to the repository"
  type        = list(string)
}

variable "visibility" {
  default = "private"
  description = "Determines repository visibility"
  type = string
  validation {
    condition = anytrue([
      var.visibility == "private",
      var.visibility == "public"
    ])
    error_message = "Visibility must be either 'private' or 'public'"
  }
}