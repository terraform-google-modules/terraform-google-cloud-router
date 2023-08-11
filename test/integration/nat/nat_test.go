// Copyright 2022 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package primary_instance_adb_cluster

import (
	"fmt"
	"testing"

	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/gcloud"
	"github.com/GoogleCloudPlatform/cloud-foundation-toolkit/infra/blueprint-test/pkg/tft"
	"github.com/stretchr/testify/assert"
)

func TestNat(t *testing.T) {
	nat := tft.NewTFBlueprintTest(t)

	nat.DefineVerify(func(assert *assert.Assertions) {
		// Getting the expected Project ID from the outputs
		projectId := nat.GetStringOutput("project_id")
		// Router Information
		routerName := nat.GetStringOutput("router_name")
		routerRegion := nat.GetStringOutput("router_region")
		fmt.Printf("%s, %s, %s", projectId, routerName, routerRegion)

		getRouterName := gcloud.Run(t, fmt.Sprintf("compute routers describe %s  --project %s  --region %s ", routerName, projectId, routerRegion))

		// check for Cluster
		assert.Equal(routerName, getRouterName.Get("name").String(), "Router name matches")

	})

	nat.Test()
}
