resource "google_storage_bucket" "default" {
    project = var.project_id
    for_each = var.buckets
    name = "${var.project_id}-${each.value.purpose}-${each.value.bucket_name}"
    location = each.value.region
    force_destroy = false
    uniform_bucket_level_access = true

    versioning {
      enabled = true
    }
  
}