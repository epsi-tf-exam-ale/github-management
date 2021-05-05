module "Team_Creation" {
  source = "./module/"
  
  repository = "Test123"
  description = "Repository de test"
  visibility = "public"
  
  wiki = true
  gitignore = "Terraform"
  
  vulnerability_alerts = true

  //Collaborateurs à attribuer au projet
  collaborators = [
    {
        username = "skhedim", 
        permission = "push" // admin | push | pull
    },
    {
        username = "Salombo", 
        permission = "admin" // admin | push | pull
    }
  ]
  
  //Utilisateurs à ajouter à l'organisation avec leur rôle
  users = []
  
  
  // Teams à créer dans l'organisation
  teams_creation = [
    {
        name = "TEAM34",
        description = "La team 34"
        permission = "push"
        privacy = "closed" // closed | secret
        members = ["skhedim","Salombo"]
    }
  ]
}
