resource "random_pet" "this" {}

module "foo" {
  source = "../modules/instance-with-ssecurity-group"

  providers = {
    aws = aws.foo
  }

  name = random_pet.this.id
}

module "bar" {
  source = "../modules/instance-with-ssecurity-group"

  providers = {
    aws = aws.bar
  }

  name = random_pet.this.id
}