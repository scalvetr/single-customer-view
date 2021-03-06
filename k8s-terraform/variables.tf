# Variable declaration

variable "k8s_host" {
  type = string
  default = "https://locahost:443"
}

variable "k8s_client_certificate" {
  type = string
  sensitive = true
}

variable "k8s_client_key" {
  type = string
  sensitive = true
}

variable "k8s_cluster_ca_certificate" {
  type = string
  sensitive = true
}

variable "k8s_project_label" {
  type = string
  default = "single-customer-view"
}

variable "k8s_namespace" {
  type = string
  default = "single-customer-view"
}

variable "confluent_platform_version" {
  type = string
  default = "7.0.1"
}

variable "postgresql_username" {
  type = string
  default = "user"
}
variable "postgresql_password" {
  type = string
  default = "password"
}
variable "postgresql_replication_username" {
  type = string
  default = "replication-user"
}
variable "postgresql_replication_password" {
  type = string
  default = "password"
}

variable "mongodb_database" {
  type = string
  default = "contact_center"
}
variable "mongodb_username" {
  type = string
  default = "user"
}
variable "mongodb_password" {
  type = string
  default = "password"
}