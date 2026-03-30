resource "google_compute_region_instance_group_manager" "default" {
    project = var.project_id
    for_each = var.region
    name = "mig-${each.key}"
    region = each.value
    base_instance_name = "${each.value}-instance"
    
    version {
      instance_template = var.instance_template_self_link
    }

    named_port {
      name = "hhtp"
      port = 80
    }

    target_size = var.target_size

    auto_healing_policies {
      health_check = var.health_check_self_link
      initial_delay_sec = var.auto_healing_initial_delay_sec
    }

    update_policy {
      type = "PROACTIVE"
      minimal_action = "REFRESH"
      max_surge_fixed = 2
      max_unavailable_fixed = 1
      replacement_method = "RECREATE"
    }
  
}

data "google_compute_region_instance_group_manager" "default" {

    provider = google
    project = var.project_id
    for_each = var.region
    region = each.value
    name = google_compute_region_instance_group_manager.default[each.key].name
}

resource "google_compute_region_autoscaler" "default" {
    project = var.project_id
    name = var.autoscaler_name
    target = google_compute_region_instance_group_manager.default.id
    for_each = var.region
    region = each.value

    autoscaling_policy {
      min_replicas = var.min_replicas
      max_replicas = var.max_replicas
      cooldown_period = var.cooldown_period

      cpu_utilization {
        target = var.target_cpu_utilization
        predictive_method = "STANDARD_AUTOSCALING"
        
      }
      load_balancing_utilization {
        target = var.target_lb_utilization
      }

    }

  
}