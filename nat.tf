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
  udp_idle_timeout_sec             = lookup(each.value, "udp_idle_timeout_sec", 30)
  icmp_idle_timeout_sec            = lookup(each.value, "icmp_idle_timeout_sec", 30)
  tcp_established_idle_timeout_sec = lookup(each.value, "tcp_established_idle_timeout_sec", 1200)
  tcp_transitory_idle_timeout_sec  = lookup(each.value, "tcp_transitory_idle_timeout_sec", 30)

  log_config {
    enable = true
    filter = lookup(lookup(each.value, "log_config", {}), "filter", "ALL")
  }

  dynamic "subnetwork" {
    for_each = lookup(each.value, "subnetworks", [])
    content {
      name                     = subnetwork.value.name
      source_ip_ranges_to_nat  = subnetwork.value.source_ip_ranges_to_nat
      secondary_ip_range_names = lookup(subnetwork.value, "secondary_ip_range_names", [])
    }
  }
}
