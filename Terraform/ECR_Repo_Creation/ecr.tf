resource "aws_ecr_repository" "flask_repo" {
  name                 = "flask-backend" #This name you see in ECR
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "express_repo" {
  name                 = "express-frontend" #This name you see in ECR
  image_tag_mutability = "MUTABLE"
}
