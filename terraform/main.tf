provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "kind-desafio-app"
  }
}

resource "helm_release" "desafio_app" {
  name       = "desafio-app"
  chart      = "../Chart/app"
  namespace  = "default"

  set {
    name  = "image.repository"
    value = "desafio-app"
  }

  set {
    name  = "image.tag"
    value = "latest"
  }

  set {
    name  = "image.pullPolicy"
    value = "Never"
  }

  set {
    name  = "service.port"
    value = 8080
  }
}
