locals {
    collab = [for i, n in var.collaborators : {
        username        = n.username
        permission      = n.permission
      }]
      
    
    users = [for i, n in var.users : {
        username        = n.username
        role            = n.role
      }]
}

resource "github_membership" "membership_for_some_user" {
  count     = length(local.users)
  
  username  = local.users[count.index].username
  role      = local.users[count.index].role
}

resource "github_repository_collaborator" "repo_collaborators" {
  count         = length(local.collab)
  
  repository    = github_repository.REPO.id
  username      = local.collab[count.index].username
  permission    = local.collab[count.index].permission
}