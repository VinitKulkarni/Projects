resource "github_repository" "repo_creation_1" {
  name        = "from-terraform_1"
  description = "This is a repository created with Terraform"
  visibility  = "public"
  auto_init   = true
}

resource "github_repository" "repo_creation_2" {
  name        = "from-terraform_2"
  description = "This is a repository created with Terraform"
  visibility  = "private"
  auto_init   = true
}
