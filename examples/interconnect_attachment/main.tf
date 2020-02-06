/**
 * Copyright 2018 Google LLC
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

provider "google" {
  version = "~> 3.0"
}

module "cloud_router" {
  source = "../../"

  name    = "example-router"
  project = "example-project"
  network = "default"
  region  = "us-central1"

  bgp = {
    asn               = 65000
    advertised_groups = ["ALL_SUBNETS"]
  }
}

module "interconnect_attachment" {
  source  = "../../modules/interconnect_attachment"
  name    = "example-attachment"
  project = "example-project"
  region  = "us-central1"
  router  = module.cloud_router.router.name

  interconnect = "https://googleapis.com/interconnects/example-interconnect"

  interface = {
    name = "example-interface"
  }

  peer = {
    name            = "example-peer"
    peer_ip_address = "169.254.1.2"
    peer_asn        = 65001
  }
}
