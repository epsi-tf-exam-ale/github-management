terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "EPSI-ADRIEN"

    workspaces {
      name = "github-management"
    }
  }
}

module "Team_Creation" {
  source = "./module/"
  
  repository = "Test_BIUS"
  description = "Repository de test"
  visibility = "public"
  
  wiki = true
  gitignore = "Terraform"
  
  vulnerability_alerts = true

  //Collaborateurs à attribuer au projet
  collaborators = [
    {
        username = "skhedim", 
        permission = "pull" // admin | push | pull
    },
    {
        username = "Salombo", 
        permission = "admin" // admin | push | pull
    }
  ]
  
  //Utilisateurs à ajouter à l'organisation avec leur rôle
  users = [
    {
      username = "skhedim",
      role = "member" // owner | member
    }
  ]
  
  
  // Teams à créer dans l'organisation
  teams_creation = [
    {
        name = "TEAM334",
        description = "La team 3"
        permission = "push"
        privacy = "closed" // closed | secret
        members = ["skhedim","Salombo"]
    }
  ]
}
