# outputs.tf

output "backend_image_name" {
  value = docker_image.backend_image.name
}

output "frontend_image_name" {
  value = docker_image.frontend_image.name
}
