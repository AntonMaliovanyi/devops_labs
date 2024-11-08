# main.tf
# main.tf

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = ">= 2.0.0"
    }
  }
}

provider "docker" {
  host   = "tcp://localhost:2375"
  registry_auth {
    address  = "https://index.docker.io"

  }
}


resource "docker_image" "backend_image" {
  name         = "deaviann/backend:latest"
  build {
    context    = "D:/qweasd/for_docker_plus_terraform/backend" # Шлях до Dockerfile для backend
    dockerfile = "Dockerfile" 
  }
}


resource "docker_image" "frontend_image" {
  name         = "deaviann/frontend:latest"
  build {
    context    = "D:/qweasd/for_docker_plus_terraform/frontend" 
    dockerfile = "Dockerfile" 
  }
}


resource "docker_registry_image" "backend_registry" {
  name = docker_image.backend_image.name
 
}


resource "docker_registry_image" "frontend_registry" {
  name = docker_image.frontend_image.name
 
}
