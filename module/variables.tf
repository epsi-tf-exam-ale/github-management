variable "repository" {
    type = string
    default = "Default"
}

variable "description" {
    type = string
    default = "Default repository"
}

variable "visibility" {
    type = string
    default = "private"
}

variable "wiki" {
    default = true
}


variable "vulnerability_alerts" {
    default = true
}

variable "gitignore" {
    type = string
    default = ""
}

variable "collaborators" {
  type = list(object({
    username        = string
    permission      = string
  }))
  description = "Collaborators list with perms"
  
  default = [
      {username = "skhedim", permission = "push"}
  ]
}

variable "teams_creation" {
  type = list(object({
    name            = string
    description     = string
    permission      = string
    privacy         = string
    members         = list(string)
  }))
  description = "Teams list with perms"
  
  default = []
}

variable "users" {
  type = list(object({
    username        = string
    role            = string
  }))
  description = "Users list with perms"
  
  default = []
}