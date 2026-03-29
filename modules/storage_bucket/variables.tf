variable "project_id" {
    description = "The project in which resource will be created"
    type = string
}



variable "buckets" {
    description = "regions in which bucket is created and bucket name"
    type = map(object({
      region = string
      purpose = string
      bucket_name = string
    }))

    default = {
      "us-bucket" = {
        region = "US"
        purpose = "tf_state"
        bucket_name = "terraform-state"
      }
      "eu-bucket" = {
        region = "EU"
        purpose = "log_storage"
        bucket_name ="log_storage"
      }
      "asia-bucket" = {
        region = "ASIA"
        purpose = "backup"
        bucket_name = "backup"
      }
    }
  
}

