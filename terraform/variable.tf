variable "namespace" {
  default = "desafio-app"
}

variable "image_repository" {
  default = "desafio-app"
}

variable "image_tag" {
  default = "latest"
}

variable "image_pull_policy" {
  default = "Never"
}

variable "service_port" {
  default = 8080
}
