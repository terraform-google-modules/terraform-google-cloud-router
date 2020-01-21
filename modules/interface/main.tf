resource "google_compute_router_interface" "interface" {
  name                    = var.name
  project                 = var.project
  router                  = var.router
  region                  = var.region
  ip_range                = var.ip_range
  vpn_tunnel              = var.vpn_tunnel
  interconnect_attachment = var.interconnect_attachment
}

resource "google_compute_router_peer" "peers" {
  for_each = {
    for p in var.peers :
    p.name => p
  }

  name                      = each.value.name
  project                   = google_compute_router_interface.interface.project
  router                    = google_compute_router_interface.interface.router
  region                    = google_compute_router_interface.interface.region
  interface                 = google_compute_router_interface.interface.name
  peer_ip_address           = each.value.peer_ip_address
  peer_asn                  = each.value.peer_asn
  advertised_route_priority = lookup(each.value, "advertised_route_priority", null)

  advertise_mode    = "CUSTOM"
  advertised_groups = lookup(each.value, "advertised_groups", null)
  dynamic "advertised_ip_ranges" {
    for_each = lookup(each.value, "advertised_ip_ranges", [])
    content {
      range       = advertised_ip_ranges.value.range
      description = lookup(advertised_ip_ranges.value, "description", null)
    }
  }
}
