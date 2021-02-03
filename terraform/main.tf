terraform {
  required_version = "~> 0.12.0"
}

provider "yandex" {
  version = "~> 0.35.0"
  service_account_key_file = "/Users/evgeny/yc/iam/key.json"
  zone = "ru-central1-a"
}

resource "yandex_compute_instance" "app" {
  name = "reddit-app"
  resources {
    cores  = 1
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd81n997u4jihug42j14"
    }
  }
  network_interface {
    subnet_id = "e9bu7e6cg1bggn4rqlh9"
    nat       = true
  }
}
