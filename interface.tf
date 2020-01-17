resource "google_compute_router_interface" "interfaces" {
  for_each = {
    for i in var.interfaces :
    i.name => i
  }

  name                    = each.value.name
  project                 = google_compute_router.router.project
  router                  = google_compute_router.router.name
  region                  = google_compute_router.router.region
  ip_range                = lookup(each.value, "ip_range", null)
  vpn_tunnel              = lookup(each.value, "vpn_tunnel", null)
  interconnect_attachment = lookup(each.value, "interconnect_attachment", null)
}

resource "google_compute_router_peer" "peers" {
  for_each = {
    for fp in flatten([
      for i in var.interfaces : [
        for p in lookup(i, "peers", []) : {
          interface_name = i.name
          peer         = p
        }
      ]
    ]) :
    fp.peer.name => fp
  }

  name                      = each.value.peer.name
  project                   = google_compute_router_interface.interfaces[each.value.interface_name].project
  router                    = google_compute_router_interface.interfaces[each.value.interface_name].router
  region                    = google_compute_router_interface.interfaces[each.value.interface_name].region
  interface                 = each.value.interface_name
  peer_ip_address           = each.value.peer.peer_ip_address
  peer_asn                  = each.value.peer.peer_asn
  advertised_route_priority = lookup(each.value.peer, "advertised_route_priority", null)

  advertise_mode    = "CUSTOM"
  advertised_groups = lookup(each.value.peer, "advertised_groups", null)
  dynamic "advertised_ip_ranges" {
    for_each = lookup(each.value.peer, "advertised_ip_ranges", [])
    content {
      range       = advertised_ip_ranges.value.range
      description = lookup(advertised_ip_ranges.value, "description", null)
    }
  }
}
