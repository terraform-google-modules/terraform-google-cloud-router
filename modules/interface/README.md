# Interface

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| interconnect\_attachment | The name or resource link to the VLAN interconnect for this interface | `string` | `null` | no |
| ip\_range | IP address and range of the interface | `string` | `null` | no |
| name | The name of the interface | `string` | n/a | yes |
| peers | BGP peers for this interface. | <pre>list(object({<br>    name                           = string<br>    peer_ip_address                = string<br>    peer_asn                       = string<br>    advertised_route_priority      = optional(number)<br>    zero_advertised_route_priority = optional(bool)<br>    bfd = object({<br>      session_initialization_mode = string<br>      min_transmit_interval       = optional(number)<br>      min_receive_interval        = optional(number)<br>      multiplier                  = optional(number)<br>    })<br>    md5_authentication_key = optional(object({<br>      name = string<br>      key  = string<br>    }))<br>  }))</pre> | `[]` | no |
| project | The project ID to deploy to | `string` | n/a | yes |
| region | Region where the interface resides | `string` | n/a | yes |
| router | Name of the router the interface resides | `string` | n/a | yes |
| vpn\_tunnel | The name or resource link to the VPN tunnel this interface will be linked to | `string` | `null` | no |

## Outputs

No outputs.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
