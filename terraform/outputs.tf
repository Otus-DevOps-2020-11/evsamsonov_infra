output "external_ip_address_app" {
  value = [
    for app in yandex_compute_instance.app:
      app.network_interface.0.nat_ip_address
  ]
}

output "external_ip_address_app_lb" {
  value = yandex_lb_network_load_balancer.app.listener.*.external_address_spec.0.address
}
