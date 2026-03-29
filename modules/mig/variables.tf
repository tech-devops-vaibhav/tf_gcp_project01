variable "project_id" {
    description = "The id of proeject where resources will be created"
    type = string
}

variable "mig_name" {
    description = "name of managed instance group"
    type = string
}

variable "base_instance_name" {
    description = "name of instanes in MIG"
    type = string
}

variable "region" {
    description = "region in which mig will be created"
    type = map(string)
    default = {
        "us" = "us-central1"
        "eu" = "europe-central2"
        "asia" = "asia-south1"

    }
  
}

variable "instance_template_self_link" {
    description = "self link of the instance template"
    type = string
}

variable "target_size" {
    description = "initial target size of mig"
    type = number
    default = 2
}

variable "auto_healing_initial_delay_sec" {
    description = "duration for which auto healing should wait for vm to start"
    type = number
    default = 90
  
}

variable "health_check_self_link" {
    description = "self link of http health check"
    type = string
}

variable "max_surge_fixed" {
    description = "number of instances that should be created above target_size during update"
    type = number
    default = 1
  
}

variable "max_unavailable" {
    description = "max vm that can be unavailable during update"
    type = number
    default = 1
}

variable "autoscaler_name" {
    description = "name of autoscaler"
    type = string
}

variable "max_replicas" {
    description = "max number of instances autoscaler can create"
    type = number
}

variable "min_replicas" {
    description = "min number of instances autoscaler can create"
    type = number
}

variable "cooldown_period" {
    description = "tiime autoscaler made before re-accessing scaling action"
    type = number
    default = 60
}

variable "target_rps" {
    description = "target request per sec for scaling"
    type = number
    default = 30
  
}

variable "target_cpu_utilization" {
    description = "target cpu utilization for scaling"
    type = number
    default = 0.6
  
}