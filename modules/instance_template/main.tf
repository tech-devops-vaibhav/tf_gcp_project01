resource "google_compute_instance_template" "default" {
    name_prefix = var.name_prefix
    project = var.project_id
    machine_type = var.machine_type
    tags = var.instance_tags

    lifecycle {
      create_before_destroy = true
    }

    disk {
      source_image = var.source_image
      boot = true
      auto_delete = true
    }

    network_interface {
      network = var.network
    }

    scheduling {
      automatic_restart = true
      on_host_maintenance = "MIGRATE"

    }

    service_account {
      scopes = ["cloud-platform"]
    }

    metadata_startup_script = var.startup_script


  
}