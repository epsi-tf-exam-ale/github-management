locals{

    teams = [for i, n in var.teams_creation : {
        name            = n.name
        description     = n.description
        permission      = n.permission
        privacy         = n.privacy
        members         = n.members
      }]
      
    licorne = flatten([
    for team_key, team in var.teams_creation : [
      for member_key, member in team.members : {
        team_key    = team_key
        member_key  = member_key
        team_id  = github_team.main[team_key].id
        username    = member
      }
     ]
    ])
    
}

resource "github_team" "main" {
  count         =  length(local.teams)

  name          = local.teams[count.index].name
  description   = local.teams[count.index].description
  privacy       = local.teams[count.index].privacy
}

resource "github_team_membership" "some_team_membership" {
  for_each = {
      for member in local.licorne : "${member.team_key}.${member.member_key}" => member
  }
  
  team_id = each.value.team_id
  username = each.value.username
}
/*
resource "github_team" "toAssign" {
  count         =  length(local.teams_assign)

  name          = local.teams_assign[count.index].name
}
*/

resource "github_team_repository" "some_team_repo" {
  count      =  length(local.teams)
  
  team_id    = github_team.main[count.index].id
  repository = github_repository.REPO.name
  permission = local.teams[count.index].permission
}