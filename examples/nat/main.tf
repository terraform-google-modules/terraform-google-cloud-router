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

module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 9.0"

  project_id   = var.project_id
  network_name = "test-network"
  routing_mode = "GLOBAL"
  subnets = [
    {
      subnet_name   = "test-subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-central1"
    }
  ]
  secondary_ranges = {
    test-subnet-01 = [
      {
        range_name    = "test-subnet-01-secondary-01"
        ip_cidr_range = "192.168.64.0/24"
      },
    ]
  }
}


# [START cloudnat_simple_create]
module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 6.0"
  name    = "my-cloud-router"
  project = var.project_id
  network = module.vpc.network_name
  region  = "us-central1"

  nats = [{
    name                               = "my-nat-gateway"
    source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
    subnetworks = [
      {
        name                     = module.vpc.subnets["us-central1/test-subnet-01"].id
        source_ip_ranges_to_nat  = ["PRIMARY_IP_RANGE", "LIST_OF_SECONDARY_IP_RANGES"]
        secondary_ip_range_names = module.vpc.subnets["us-central1/test-subnet-01"].secondary_ip_range[*].range_name
      }
    ]
  }]
}
# [END cloudnat_simple_create]
