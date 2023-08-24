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

variable "name" {
  type        = string
  description = "Name of the router"
}

variable "network" {
  type        = string
  description = "A reference to the network to which this router belongs"
}

variable "project" {
  type        = string
  description = "The project ID to deploy to"
}

variable "region" {
  type        = string
  description = "Region where the router resides"
}

variable "description" {
  type        = string
  description = "An optional description of this resource"
  default     = null
}

# Type: object, with fields:
# - asn (string, required): Local BGP Autonomous System Number (ASN).
# - advertised_groups (list(string), optional): User-specified list of prefix groups to advertise.
# - advertised_ip_ranges (list(object), optional): User-specified list of individual IP ranges to advertise.
#   - range (string, required): The IP range to advertise.
#   - description (string, optional): User-specified description for the IP range.
# - keepalive_interval (integer, optional): Period of time in seconds to wait before sending a new BGP keepalive message to the peer.
variable "bgp" {
  description = "BGP information specific to this router."
  type = object({
    asn               = string
    advertise_mode    = optional(string, "CUSTOM")
    advertised_groups = optional(list(string))
    advertised_ip_ranges = optional(list(object({
      range       = string
      description = optional(string)
    })), [])
    keepalive_interval = optional(number)
  })
  default = null
}

# Type: list(object), with fields:
# - name (string, required): Name of the NAT.
# - nat_ip_allocate_option (string, optional): How external IPs should be allocated for this NAT. Defaults to MANUAL_ONLY if nat_ips are set, else AUTO_ONLY.
# - source_subnetwork_ip_ranges_to_nat (string, optional): How NAT should be configured per Subnetwork. Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES.
# - nat_ips (list(number), optional): Self-links of NAT IPs.
# - min_ports_per_vm (number, optional): Minimum number of ports allocated to a VM from this NAT.
# - max_ports_per_vm (number, optional): Maximum number of ports allocated to a VM from this NAT. This field can only be set when enableDynamicPortAllocation is enabled.
# - udp_idle_timeout_sec (number, optional): Timeout (in seconds) for UDP connections. Defaults to 30s if not set.
# - icmp_idle_timeout_sec (number, optional): Timeout (in seconds) for ICMP connections. Defaults to 30s if not set.
# - tcp_established_idle_timeout_sec (number, optional): Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set.
# - tcp_transitory_idle_timeout_sec (number, optional): Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set.
# - tcp_time_wait_timeout_sec (number, optional): Timeout (in seconds) for TCP connections that are in TIME_WAIT state. Defaults to 120s if not set.
# - log_config (object, optional):
#    - filter: Specifies the desired filtering of logs on this NAT. Defaults to "ALL".
# - subnetworks (list(objects), optional):
#   - name (string, required): Self-link of subnetwork to NAT.
#   - source_ip_ranges_to_nat (string, required): List of options for which source IPs in the subnetwork should have NAT enabled.
#   - secondary_ip_range_names (string, optional): List of the secondary ranges of the subnetwork that are allowed to use NAT.
variable "nats" {
  description = "NATs to deploy on this router."
  type = list(object({
    name                                = string
    nat_ip_allocate_option              = optional(string)
    source_subnetwork_ip_ranges_to_nat  = optional(string)
    nat_ips                             = optional(list(string), [])
    min_ports_per_vm                    = optional(number)
    max_ports_per_vm                    = optional(number)
    udp_idle_timeout_sec                = optional(number)
    icmp_idle_timeout_sec               = optional(number)
    tcp_established_idle_timeout_sec    = optional(number)
    tcp_transitory_idle_timeout_sec     = optional(number)
    tcp_time_wait_timeout_sec           = optional(number)
    enable_endpoint_independent_mapping = optional(bool)
    enable_dynamic_port_allocation      = optional(bool)

    log_config = optional(object({
      enable = optional(bool, true)
      filter = optional(string, "ALL")
    }), {})

    subnetworks = optional(list(object({
      name                     = string
      source_ip_ranges_to_nat  = list(string)
      secondary_ip_range_names = optional(list(string))
    })), [])

  }))
  default = []
}
