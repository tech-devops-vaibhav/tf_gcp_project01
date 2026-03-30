variable "project_id" {
    description = "The id of the project in which resources will be created"
    type = string
  
}

variable "http_health_check_name" {
    description = "the name of http health check of lb"
    type = string
}

variable "health_check_interval" {
    description = "the interval in which health check should be performed on backend"
    type = number
    default = 5
}

variable "health_check_healthy_threshold" {
    description = "number of successful response healthcheck should get to declare instance healthy"
    type = number
    default = 3
}

variable "health_check_unhealthy_threshold" {
    description = "number of unsuccessful response healthcheck should get to declare instance unhealthy"
    type = number
    default = 3
  
}

variable "health_check_timeout" {
    description = "number of sec health check should wait to declare instance timedout"
}

variable "backend_service_name" {
    description = "name of backend service"
    type = string
}

variable "region" {
    description = "region in which backedn will be created"
    type = map(string)
    default = {
        "us-central" = "us-central1"
        "eu-central" = "europe-central2"
        "asia-south" = "asia-south1"

    }
  
}


variable "us_mig_self_link" {
    description = "self link of the MIG to attach to the backend of lb"
    type = string
  
}

variable "eu_mig_self_link" {
    description = "self link of the MIG to attach to the backend of lb"
    type = string
  
}

variable "asia_mig_self_link" {
    description = "self link of the MIG to attach to the backend of lb"
    type = string
  
}


variable "multi_region_mig_self_link" {
  description = "Map of MIG self-links for all regions to attach to the backend service"
  type        = map(string)
}

variable "url_map_name" {
    description = "name of url mapping"
    type = string
  
}

variable "forwarding_rule_name" {
    description = "name of the forwarding rule"
    type = string
  
}

variable "global_address_ip" {
    description = "global static ip address for user"
  
}

variable "us_mig_self_link" {
    description = "self link of mig in us-central1 region to attach to backend"
    type = string
  
}

variable "eu_mig_self_link" {
    description = "self link of mig in eu-central2 region to attach to backend"
    type = string
  
}

variable "asia_mig_self_link" {
    description = "self link of mig in asia-south1 region to attach to backend"
    type = string
  
}
