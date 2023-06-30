resource "null_resource" "this" {
  triggers = {
    trigger = var.name 
  }
}

variable "name" {
  type    = string
  default = "hello world"
}