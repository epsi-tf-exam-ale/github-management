module "skhedim" {
  source = "./module/"
  
  repository = "skhedim_test"
  description = "toto"
  visibility = "public"
  
  wiki = true
  gitignore = "Terraform"
  
  vulnerability_alerts = true

  //Collaborateurs à attribuer au projet
  collaborators = [
    {
        username = "skhedim", 
        permission = "admin" // admin | push | pull
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
        name = "test-skhedim",
        description = "La team 4"
        permission = "push"
        privacy = "closed" // closed | secret
        members = ["skhedim","Salombo"]
    }
  ]
}
