resource "google_compute_firewall" "http_server" {
    name = var.http_firewall_name
    project = var.project_id
    network = var.network
    description = "firewall rule to allow http traffic on port 80"

    allow {
      protocol = "tcp"
      ports = [ "80", "443" ]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = var.target_tags
    direction = "INGRESS"
  
}

resource "google_compute_firewall" "ssh" {
    name = var.ssh_firewall_name
    project = var.project_id
    network = var.network
    description = "firewall rule to allow ssh traffic on port 22"

    allow {
      protocol = "tcp"
      ports = ["22"]
    }

    source_ranges = var.ssh_source_ranges
    target_tags = var.target_tags 
    direction = "INGRESS"
}

resource "google_compute_firewall" "internal" {
    project = var.project_id
    name = var.internal_firewall_name
    network = var.network

    allow {
      protocol = "tcp"
      ports = ["0-65535"]

    }

    allow {
      protocol = "udp"
      ports = ["0-65535"]
    }

    allow {
      protocol = "icmp"
    }

    source_tags = var.target_tags
}

resource "google_compute_firewall" "allow_egress" {
    project = var.project_id
    name = "allow-egress"
    network = var.network

    allow {
      protocol = "tcp"
      ports = ["0-65535"]

    }

    allow {
      protocol = "udp"
      ports = ["0-65535"]
    }

    allow {
      protocol = "icmp"
    }

    direction = "EGRESS"
    destination_ranges = [ "0.0.0.0/0" ]
    target_tags = var.target_tags
}