output "health_check_id" {
    value = google_compute_health_check.http.id 
}

output "backend_servie_id" {
    value = google_compute_backend_service.default.id
}

output "url_map_id" {
    value = google_compute_url_map.default.id
  
}