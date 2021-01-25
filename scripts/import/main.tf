resource "google_bigquery_dataset" "datasetone" {
dataset_id = "bot"

access {
        role          = "OWNER"
        user_by_email = "tendul@gmail.com"
    }
access {
        role          = "WRITER"
        user_by_email = "tendulkarnaidu999@gmail.com"
    }
access {
        role          = "roles/bigquery.admin"
        user_by_email = "tendulkarnaidu999@gmail.com"
    }

}
resource "google_bigquery_dataset" "datasettwo" {
dataset_id = "hello"
}
