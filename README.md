# [terraform-google-cloud-router](https://registry.terraform.io/modules/terraform-google-modules/cloud-router/google)

This module handles opinionated Google Cloud Platform routing.

## Usage

Basic usage of this module is as follows:

```hcl
module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 4.0"

  name    = "example-router"
  project = "<PROJECT ID>"
  region  = "us-central1"
  network = "default"
}
```

Functional examples are included in the
[examples](./examples/) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bgp | BGP information specific to this router. | `any` | `null` | no |
| description | An optional description of this resource | `string` | `null` | no |
| name | Name of the router | `string` | n/a | yes |
| nats | NATs to deploy on this router. | `any` | `[]` | no |
| network | A reference to the network to which this router belongs | `string` | n/a | yes |
| project | The project ID to deploy to | `string` | n/a | yes |
| region | Region where the router resides | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| router | The created router |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v0.12 and above
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v2.0

### Service Account

A service account with the following roles must be used to provision
the resources of this module:

- Network Admin: `roles/compute.networkAdmin`

The [Project Factory module][project-factory-module] and the
[IAM module][iam-module] may be used in combination to provision a
service account with the necessary roles applied.

### APIs

A project with the following APIs enabled must be used to host the
resources of this module:

- Google Cloud Compute Engine API: `compute.googleapis.com`

The [Project Factory module][project-factory-module] can be used to
provision a project with the necessary APIs enabled.

## Contributing

Refer to the [contribution guidelines](./CONTRIBUTING.md) for
information on contributing to this module.

[project-factory-module]: https://registry.terraform.io/modules/terraform-google-modules/project-factory/google
[terraform-provider-gcp]: https://www.terraform.io/docs/providers/google/index.html
[terraform]: https://www.terraform.io/downloads.html
