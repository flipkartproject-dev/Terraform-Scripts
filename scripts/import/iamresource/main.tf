resource "google_project_iam_policy" "project" {
    policy_data = jsonencode(
        {
            bindings = [
                {
                    members = [
                        "user:tendulkar.muppiri@gmail.com",
                    ]
                    role    = "roles/bigquery.admin"
                },
                {
                    members = [
                        "serviceAccount:service-454457785264@gcp-sa-cloudbuild.iam.gserviceaccount.com",
                    ]
                    role    = "roles/cloudbuild.serviceAgent"
                },
                {
                    members = [
                        "serviceAccount:service-454457785264@gcf-admin-robot.iam.gserviceaccount.com",
                    ]
                    role    = "roles/cloudfunctions.serviceAgent"
                },
                {
                    members = [
                        "serviceAccount:service-454457785264@compute-system.iam.gserviceaccount.com",
                    ]
                    role    = "roles/compute.serviceAgent"
                },
                {
                    members = [
                        "serviceAccount:myworld@helm-istio-302110.iam.gserviceaccount.com",
                        "serviceAccount:service-454457785264@container-engine-robot.iam.gserviceaccount.com",
                    ]
                    role    = "roles/container.serviceAgent"
                },
                {
                    members = [
                        "serviceAccount:service-454457785264@containerregistry.iam.gserviceaccount.com",
                    ]
                    role    = "roles/containerregistry.ServiceAgent"
                },
                {
                    members = [
                        "user:deviprasadspl@gmail.com",
                    ]
                    role    = "roles/owner"
                },
                {
                    members = [
                        "serviceAccount:myworld@helm-istio-302110.iam.gserviceaccount.com",
                    ]
                    role    = "roles/privateca.admin"
                },
                {
                    members = [
                        "serviceAccount:service-454457785264@cloud-redis.iam.gserviceaccount.com",
                    ]
                    role    = "roles/redis.serviceAgent"
                },
            ]
        }
    )
    project     = "helm-istio-302110"
}
