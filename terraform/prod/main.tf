terraform {
  required_version = "~> 0.12.0"
}

provider "yandex" {
  version                  = "~> 0.35.0"
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
module "app" {
  source                     = "../modules/app"
  public_key_path            = var.public_key_path
  app_disk_image             = var.app_disk_image
  subnet_id                  = var.subnet_id
  app_connection_private_key = var.app_connection_private_key
}
module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
}
