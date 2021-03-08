variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  default     = "ru-central1-a"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key .json"
}
variable app_zone {
  description = "Zone VM app"
  default     = "ru-central1-a"
}
variable app_connection_private_key {
  description = "private key .json for VM app connection"
}
variable app_instance_count {
  description = "reddit-app instance count"
  default     = 1
}
variable app_disk_image {
  description = "Disk image for Reddit App"
  default     = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for Reddit DB"
  default     = "reddit-db-base"
}
