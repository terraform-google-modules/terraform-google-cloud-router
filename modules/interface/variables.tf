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
  description = "The name of the interface"
}

variable "project" {
  type        = string
  description = "The project ID to deploy to"
}

variable "router" {
  type        = string
  description = "Name of the router the interface resides"
}

variable "region" {
  type        = string
  description = "Region where the interface resides"
}

variable "ip_range" {
  type        = string
  description = "IP address and range of the interface"
  default     = null
}

variable "vpn_tunnel" {
  type        = string
  description = "The name or resource link to the VPN tunnel this interface will be linked to"
  default     = null
}

variable "interconnect_attachment" {
  type        = string
  description = "The name or resource link to the VLAN interconnect for this interface"
  default     = null
}


# TODO(https://github.com/hashicorp/terraform/issues/19898): Convert these
# to objects once optional variables are supported.

# Type: list(object), with fields:
# - peer_ip_address (string, required): IP address of the BGP interface outside Google Cloud Platform.
# - peer_asn (string, required): Peer BGP Autonomous System Number (ASN).
# - advertised_route_priority (number, optional): The priority of routes advertised to this BGP peer.
variable "peers" {
  type        = any
  description = "BGP peers for this interface."
  default     = []
}
