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

# TODO(https://github.com/hashicorp/terraform/issues/19898): Convert these
# to objects once optional variables are supported.


# Type: object, with fields:
# - asn (string, required): Local BGP Autonomous System Number (ASN).
# - advertised_groups (list(string), optional): User-specified list of prefix groups to advertise.
# - advertised_ip_ranges (list(object), optional): User-specified list of individual IP ranges to advertise.
#   - range (string, required): The IP range to advertise.
#   - description (string, optional): User-specified description for the IP range.
variable "bgp" {
  description = "BGP information specific to this router."
  type        = any
  default     = null
}

# Type: list(object), with fields:
# - name (string, required): The name of the interface
# - ip_range (string, optional): IP address and range of the interface.
# - interconnect_attachment (string, optional): The name or resource link to the VLAN interconnect for this interface.
# - vpn_tunnel (string, optional): The name or resource link to the VPN tunnel this interface will be linked to.
# - peers (list(object), optional):
#   - peer_ip_address (string, required): IP address of the BGP interface outside Google Cloud Platform.
#   - peer_asn (string, required): Peer BGP Autonomous System Number (ASN).
#   - advertised_route_priority (number, optional): The priority of routes advertised to this BGP peer.
#   - advertised_groups (string, optional): User-specified list of prefix groups to advertise in custom mode
#   - advertised_ip_ranges (list(object), optional): User-specified list of individual IP ranges to advertise.
#     - range (string, required):  The IP range to advertise.
#     - description (string, optional): User-specified description for the IP range.
variable "interfaces" {
  description = "Interfaces to deploy on this router."
  type        = any
  default     = []
}

# Type: list(object), with fields:
# - name (string, required): Name of the NAT.
# - nat_ip_allocate_option (string, optional): How external IPs should be allocated for this NAT. Defaults to MANUAL_ONLY if nat_ips are set, else AUTO_ONLY.
# - source_subnetwork_ip_ranges_to_nat (string, optional): How NAT should be configured per Subnetwork. Defaults to ALL_SUBNETWORKS_ALL_IP_RANGES.
# - nat_ips (list(number), optional): Self-links of NAT IPs.
# - min_ports_per_vm (number, optional): Minimum number of ports allocated to a VM from this NAT.
# - udp_idle_timeout_sec (number, optional): Timeout (in seconds) for UDP connections. Defaults to 30s if not set.
# - icmp_idle_timeout_sec (number, optional): Timeout (in seconds) for ICMP connections. Defaults to 30s if not set.
# - tcp_established_idle_timeout_sec (number, optional): Timeout (in seconds) for TCP established connections. Defaults to 1200s if not set.
# - tcp_transitory_idle_timeout_sec (number, optional): Timeout (in seconds) for TCP transitory connections. Defaults to 30s if not set.
# - subnetworks (list(objects), optional):
#   - name (string, required): Self-link of subnetwork to NAT.
#   - source_ip_ranges_to_nat (string, required): List of options for which source IPs in the subnetwork should have NAT enabled.
#   - secondary_ip_range_names (string, required): List of the secondary ranges of the subnetwork that are allowed to use NAT.
variable "nats" {
  description = "NATs to deploy on this router."
  type        = any
  default     = []
}
