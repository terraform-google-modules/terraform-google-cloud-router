/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

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

  dynamic "bfd" {
    for_each = lookup(each.value, "bfd", null) == null ? [] : [""]
    content {
      session_initialization_mode = try(each.value.bfd.session_initialization_mode, null)
      min_receive_interval        = try(each.value.bfd.min_receive_interval, null)
      min_transmit_interval       = try(each.value.bfd.min_transmit_interval, null)
      multiplier                  = try(each.value.bfd.multiplier, null)
    }
  }
}
