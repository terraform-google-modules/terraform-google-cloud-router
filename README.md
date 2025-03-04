# [Cloud Router Terraform Module](https://registry.terraform.io/modules/terraform-google-modules/cloud-router/google)

This module handles opinionated Google Cloud Platform [cloud router](https://cloud.google.com/network-connectivity/docs/router/concepts/overview). Optionally it can also create [cloud nat](https://cloud.google.com/nat/docs/overview)

## Compatibility

This module is meant for use with Terraform 1.3+ and tested using Terraform 1.3+. If you find incompatibilities using Terraform >=1.3, please open an issue.

## Version

Upgrade guides:

- [5.X -> 6.0.](/docs/upgrading_to_v6.0.md)

## Usage

Basic usage of this module is as follows:

```hcl
module "cloud_router" {
  source  = "terraform-google-modules/cloud-router/google"
  version = "~> 6.2"

  name    = "example-router"
  region  = "us-central1"

  bgp = {
    # The ASN (16550, 64512 - 65534, 4200000000 - 4294967294) can be any private ASN
    # not already used as a peer ASN in the same region and network or 16550 for Partner Interconnect.
    asn = "65001"
  }

  project = "<PROJECT ID>"
  network = "default"
}
```

Functional examples are included in the [examples](./examples/) directory. By default logging will be enabled for `Cloud NAT` with `filter` set to `All`. You can disable cloud nat logging by setting parameters in `nats.log_config`

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bgp | BGP information specific to this router. | <pre>object({<br>    asn               = string<br>    advertise_mode    = optional(string, "CUSTOM")<br>    advertised_groups = optional(list(string))<br>    advertised_ip_ranges = optional(list(object({<br>      range       = string<br>      description = optional(string)<br>    })), [])<br>    keepalive_interval = optional(number)<br>  })</pre> | `null` | no |
| description | An optional description of this resource | `string` | `null` | no |
| encrypted\_interconnect\_router | An optional field to indicate if a router is dedicated to use with encrypted Interconnect Attachment | `bool` | `false` | no |
| name | Name of the router | `string` | n/a | yes |
| nats | NATs to deploy on this router. | <pre>list(object({<br>    name                                = string<br>    nat_ip_allocate_option              = optional(string)<br>    source_subnetwork_ip_ranges_to_nat  = optional(string)<br>    nat_ips                             = optional(list(string), [])<br>    drain_nat_ips                       = optional(list(string), [])<br>    min_ports_per_vm                    = optional(number)<br>    max_ports_per_vm                    = optional(number)<br>    udp_idle_timeout_sec                = optional(number)<br>    icmp_idle_timeout_sec               = optional(number)<br>    tcp_established_idle_timeout_sec    = optional(number)<br>    tcp_transitory_idle_timeout_sec     = optional(number)<br>    tcp_time_wait_timeout_sec           = optional(number)<br>    enable_endpoint_independent_mapping = optional(bool)<br>    enable_dynamic_port_allocation      = optional(bool)<br><br>    log_config = optional(object({<br>      enable = optional(bool, true)<br>      filter = optional(string, "ALL")<br>    }), {})<br><br>    subnetworks = optional(list(object({<br>      name                     = string<br>      source_ip_ranges_to_nat  = list(string)<br>      secondary_ip_range_names = optional(list(string))<br>    })), [])<br><br>  }))</pre> | `[]` | no |
| network | A reference to the network to which this router belongs | `string` | n/a | yes |
| project | The project ID to deploy to | `string` | n/a | yes |
| region | Region where the router resides | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| nat | Created NATs |
| router | Created Router |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## nats


## Requirements

These sections describe requirements for using this module.

### Software

The following dependencies must be available:

- [Terraform][terraform] v1.3 and above
- [Terraform Provider for GCP][terraform-provider-gcp] plugin v4.51 and above

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
