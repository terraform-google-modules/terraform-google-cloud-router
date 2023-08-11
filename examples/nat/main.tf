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
  version = "~> 7.0"

  project_id   = var.project_id
  network_name = "test-network"
  routing_mode = "GLOBAL"
  subnets      = []
}


# [START cloudnat_simple_create]
module "cloud_router" {
  source  = "../.."
  name    = "my-cloud-router"
  project = var.project_id
  network = module.vpc.network_name
  region  = "us-central1"

  nats = [{
    name = "my-nat-gateway"
  }]
}
# [END cloudnat_simple_create]
