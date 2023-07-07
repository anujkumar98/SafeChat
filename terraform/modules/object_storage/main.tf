resource "google_storage_bucket" "safechat_gcs" {
  name          = "safechat-gcs"
  location      = "US"
  force_destroy = true
}
resource "google_storage_bucket_object" "safechat_data" {
  name   = "safechat_data.parquet"
  source = "../data/cleaned/safechat_data.parquet"
  bucket = google_storage_bucket.safechat_gcs.name
  content_type = "application/octet-stream"
}

resource "google_storage_object_access_control" "public_rule_data" {
  object = google_storage_bucket_object.safechat_data.output_name
  bucket = google_storage_bucket.safechat_gcs.name
  role   = "READER"
  entity = "allUsers"
}