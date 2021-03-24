variable app_disk_image {
  description = "Disk image for Reddit App"
  default     = "reddit-app-base"
}
variable subnet_id {
  description = "Subnet"
}
variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable app_connection_private_key {
  description = "private key .json for VM app connection"
}
