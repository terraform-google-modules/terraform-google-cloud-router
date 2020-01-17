resource "google_compute_router_nat" "nats" {
  for_each = {
    for n in var.nats :
    n.name => n
  }

  name                               = each.value.name
  project                            = google_compute_router.router.project
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = lookup(each.value, "nat_ip_allocate_option", length(lookup(each.value, "nat_ips", [])) > 0 ? "MANUAL_ONLY" : "AUTO_ONLY")
  source_subnetwork_ip_ranges_to_nat = lookup(each.value, "source_subnetwork_ip_ranges_to_nat", "ALL_SUBNETWORKS_ALL_IP_RANGES")

  nat_ips                          = lookup(each.value, "nat_ips", [])
  min_ports_per_vm                 = lookup(each.value, "min_ports_per_vm", 0)
  udp_idle_timeout_sec             = lookup(each.value, "udp_idle_timeout_sec", null)
  icmp_idle_timeout_sec            = lookup(each.value, "icmp_idle_timeout_sec", null)
  tcp_established_idle_timeout_sec = lookup(each.value, "tcp_established_idle_timeout_sec", null)
  tcp_transitory_idle_timeout_sec  = lookup(each.value, "tcp_transitory_idle_timeout_sec", null)

  dynamic "subnetwork" {
    for_each = lookup(each.value, "subnetworks", [])
    content {
      name                     = subnetwork.value.name
      source_ip_ranges_to_nat  = subnetwork.value.source_ip_ranges_to_nat
      secondary_ip_range_names = subnetwork.value.secondary_ip_range_names
    }
  }
}
