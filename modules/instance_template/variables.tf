variable "project_id" {
    description = "id of project where resource will be created"
    type = string
}

variable "network" {
    description = "name of VPC in which firewall rules will be created"
    type = string
  
}

variable "machine_type" {
    description = "machine type for instances"
    type = string
    default = "e2-medium"  
}

variable "source_image" {
    description = "base image for virtual machines"
    type = string
    default = "debian-cloud/debian-11"
}

variable "instance_tags" {
    description = "instance tags to apply to the template"
    type = list(string)
    default = []    
}

variable "name_prefix" {
    description = "instance template prevfix to identify version"
    type = string
}

variable "startup_script" {
    description = "script to run on startup of vm"
    type = string
    default = <<-EOF
        apt-get update -y
        apt-get install -y apache2 
        echo "Apache is successfully installed on machine $(hostname) ip $(hostname -i)" >> /var/www/html/index.html
    EOF
    #grafana download script can be added in the above EOF block. 
    #For grafana we need to enable firewall rule on port 3000
  
}
