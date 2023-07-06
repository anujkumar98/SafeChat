resource "google_storage_bucket" "safechat_gcs" {
  name          = "safechat-gcs"
  location      = "US"
  force_destroy = true
}
resource "google_storage_bucket_object" "train_data" {
  name   = "reddit_200k_train.csv"
  source = "../data/reddit_200k_train.csv"
  bucket = google_storage_bucket.safechat_gcs.name
  content_type = "text/csv"
}
resource "google_storage_bucket_object" "test_data" {
  name   = "reddit_200k_test.csv"
  source = "../data/reddit_200k_test.csv"
  bucket = google_storage_bucket.safechat_gcs.name
  content_type = "text/csv"
}

resource "google_storage_object_access_control" "public_rule_train_data" {
  object = google_storage_bucket_object.train_data.output_name
  bucket = google_storage_bucket.safechat_gcs.name
  role   = "READER"
  entity = "allUsers"
}
resource "google_storage_object_access_control" "public_rule_test_data" {
  object = google_storage_bucket_object.test_data.output_name
  bucket = google_storage_bucket.safechat_gcs.name
  role   = "READER"
  entity = "allUsers"
}