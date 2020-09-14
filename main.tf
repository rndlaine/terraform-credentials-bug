variable "project_name" {
  type    = string
  default = "test"
}

variable "region" {
  type    = string
  default = "us-east1"
}

variable "billing_account" {
  type = string
}

variable "org_id" {
  type = string
}

provider "google" {
  region      = var.region
  credentials = file("tfadmin-service-key.json")
}

resource "random_id" "id" {
  byte_length = 2
  prefix      = var.project_name
}

resource "google_project" "project" {
  provider        = google-beta
  project_id      = random_id.id.hex
  name            = var.project_name
  billing_account = var.billing_account
  org_id          = var.org_id
}
