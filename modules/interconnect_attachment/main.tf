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
  name                     = var.name
  router                   = var.router
  project                  = var.project
  region                   = var.region
  interconnect             = var.interconnect
  admin_enabled            = var.admin_enabled
  type                     = var.type
  edge_availability_domain = var.edge_availability_domain
  description              = var.description
  bandwidth                = var.type == "DEDICATED" ? var.bandwidth : null
  mtu                      = var.mtu
  candidate_subnets        = var.candidate_subnets
  vlan_tag8021q            = var.vlan_tag8021q
  encryption               = var.encryption
  ipsec_internal_addresses = var.ipsec_internal_addresses
}

module "interface" {
  count = var.create_interface ? 1 : 0

  source                  = "../interface"
  name                    = try(var.interface.name, null)
  project                 = var.project
  router                  = var.router
  region                  = var.region
  ip_range                = google_compute_interconnect_attachment.attachment.cloud_router_ip_address
  interconnect_attachment = google_compute_interconnect_attachment.attachment.self_link
  peers = [{
    name = try(var.peer.name, null)

    # Peer IP Address must not contain the subnet mask, else will throw an invalid IP address error.
    peer_ip_address           = element(split("/", google_compute_interconnect_attachment.attachment.customer_router_ip_address), 0)
    peer_asn                  = try(var.peer.peer_asn, null)
    advertised_route_priority = try(var.peer.advertised_route_priority, null)
    bfd                       = try(var.peer.bfd, null)
  }]
}

moved {
  from = module.interface
  to   = module.interface[0]
}
