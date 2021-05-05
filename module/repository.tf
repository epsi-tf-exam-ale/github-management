resource "github_repository" "REPO" {
  name                  = var.repository
  description           = var.description

  visibility            = var.visibility
  
  has_wiki              = var.wiki
  gitignore_template    = var.gitignore
  vulnerability_alerts  = var.vulnerability_alerts
}

resource "github_branch_protection_v3" "example" {
  repository     = github_repository.REPO.name
  branch         = "main"

  restrictions {
    users = []
  }
}