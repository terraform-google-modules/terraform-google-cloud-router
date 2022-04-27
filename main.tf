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

resource "google_compute_router" "router" {
  name        = var.name
  network     = var.network
  region      = var.region
  project     = var.project
  description = var.description
  dynamic "bgp" {
    for_each = var.bgp != null ? [var.bgp] : []
    content {
      asn = var.bgp.asn

      # advertise_mode is intentionally set to CUSTOM to not allow "DEFAULT".
      # This forces the config to explicitly state what subnets and ip ranges
      # to advertise. To advertise the same range as DEFAULT, set
      # `advertise_groups = ["ALL_SUBNETS"]`.
      advertise_mode     = "CUSTOM"
      advertised_groups  = lookup(var.bgp, "advertised_groups", null)
      keepalive_interval = lookup(var.bgp, "keepalive_interval", null)

      dynamic "advertised_ip_ranges" {
        for_each = lookup(var.bgp, "advertised_ip_ranges", [])
        content {
          range       = advertised_ip_ranges.value.range
          description = lookup(advertised_ip_ranges.value, "description", null)
        }
      }
    }
  }
}
