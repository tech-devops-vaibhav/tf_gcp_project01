variable "project_id" {
    description = "id of project where resource will be created"
    type = string
}

variable "network" {
    description = "name of VPC in which firewall rules will be created"
    type = string
  
}

variable "http_firewall_name" {
    description = "name of http firewall rule"
    type = string
}

variable "ssh_firewall_name" {
    description = "name of ssh firewall rule"
    type = string
}

variable "internal_firewall_name" {
    description = "name of ssh internal rule"
    type = string
}

variable "target_tags" {
    description = "tags assigned to resources for firewall rules"
    type = list(string)
}

variable "ssh_source_ranges" {
    description = "source ip ranges allowed for ssh access"
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "http_source_ranges" {
    description = "source ip ranges allowed for http access"
    type = list(string)
    default = ["0.0.0.0/0"]

}





