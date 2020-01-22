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

resource "google_compute_interconnect_attachment" "attachment" {
  name          = var.name
  router        = var.router
  project       = var.project
  region        = var.region
  interconnect  = var.interconnect
  admin_enabled = var.admin_enabled
  type          = var.type
  description   = var.description
  bandwidth     = var.bandwidth
  vlan_tag8021q = var.vlan_tag8021q
}

module "interface" {
  source                  = "../interface"
  name                    = var.interface.name
  project                 = var.project
  router                  = var.router
  region                  = var.region
  ip_range                = google_compute_interconnect_attachment.attachment.cloud_router_ip_address
  interconnect_attachment = google_compute_interconnect_attachment.attachment.self_link
  peers = [{
    name                      = var.peer.name
    peer_ip_address           = var.peer.peer_ip_address
    peer_asn                  = var.peer.peer_asn
    advertised_route_priority = lookup(var.peer, "advertised_route_priority", null)
    advertised_groups         = var.peer.advertised_groups
  }]
}
