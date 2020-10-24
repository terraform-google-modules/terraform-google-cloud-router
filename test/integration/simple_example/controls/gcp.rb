# Copyright 2018 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

project_id = attribute("project_id")
region = attribute("region")
cloud_router_name = attribute("cloud_router_name")

control "gcp" do
  title "GCP Resources"

  describe google_compute_router(project: project_id, region: region, name: cloud_router_name) do
    it { should exist }
    its("name") { should eq cloud_router_name }
    its("region") { should match /\/#{region}$/ }
  end

  describe google_compute_router(project: project_id, region: region, name: "dupe") do
    it { should_not exist }
  end
end
