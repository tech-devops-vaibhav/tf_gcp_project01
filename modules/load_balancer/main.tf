resource "google_compute_health_check" "http" {

    project = var.project_id
    name = var.http_health_check_name
    description = "http health check"
    timeout_sec = var.health_check_timeout
    check_interval_sec = var.health_check_interval
    healthy_threshold = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold

    http2_health_check {
      port = 80
    }
  
}

resource "google_compute_backend_service" "default" {

    project = var.project_id
    name = var.backend_service_name
    protocol = "HTTP"
    load_balancing_scheme = "EXTERNAL"

    health_checks = [google_compute_health_check.http.id]
    session_affinity = "NONE"

    backend {
        group = var.us_mig_self_link
        balancing_mode = "UTILIZATION"
        max_utilization = 0.7
        capacity_scaler = 1
    }

    backend {
        group = var.eu_mig_self_link
        balancing_mode = "UTILIZATION"
        max_utilization = 0.7
        capacity_scaler = 1


    }

    backend {
        group = var.asia_mig_self_link
        balancing_mode = "UTILIZATION"
        max_utilization = 0.7
        capacity_scaler = 1
    }

 }

 resource "google_compute_url_map" "default" {
    name = var.url_map_name
    project = var.project_id
    default_service = google_compute_backend_service.default.id

   
 }


  
