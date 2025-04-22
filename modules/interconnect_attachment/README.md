# Interconnect Attachment

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_enabled | Whether the VLAN attachment is enabled or disabled | `bool` | `true` | no |
| bandwidth | Provisioned bandwidth capacity for the interconnect attachment | `string` | `null` | no |
| candidate\_subnets | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). | `list(string)` | `null` | no |
| create\_interface | Whether to create router interface (and peer) for this attachment. Set this to false for PARTNER type. | `bool` | `true` | no |
| description | An optional description of this resource | `string` | `null` | no |
| edge\_availability\_domain | Desired availability domain for the attachment. Only available for type PARTNER, at creation time. | `string` | `null` | no |
| encryption | Indicates the user-supplied encryption option of this interconnect attachment. | `string` | `"NONE"` | no |
| interconnect | URL of the underlying Interconnect object that this attachment's traffic will traverse through. | `string` | `""` | no |
| interface | Interface to deploy for this attachment. | <pre>object({<br/>    name = string<br/>  })</pre> | `null` | no |
| ipsec\_internal\_addresses | URL of addresses that have been reserved for the interconnect attachment, Used only for interconnect attachment that has the encryption option as IPSEC. | `list(string)` | `[]` | no |
| mtu | Maximum Transmission Unit (MTU), in bytes, of packets passing through this interconnect attachment. Currently, only 1440 and 1500 are allowed. If not specified, the value will default to 1440. | `string` | `null` | no |
| name | The name of the interconnect attachment | `string` | n/a | yes |
| peer | BGP Peer for this attachment. | <pre>object({<br/>    name                      = string<br/>    peer_asn                  = string<br/>    advertised_route_priority = optional(number)<br/>    bfd = optional(object({<br/>      session_initialization_mode = string<br/>      min_transmit_interval       = optional(number)<br/>      min_receive_interval        = optional(number)<br/>      multiplier                  = optional(number)<br/>    }))<br/>  })</pre> | `null` | no |
| project | The project ID to deploy to | `string` | n/a | yes |
| region | Region where the attachment resides | `string` | n/a | yes |
| router | Name of the router the attachment resides | `string` | n/a | yes |
| type | The type of InterconnectAttachment you wish to create | `string` | `"DEDICATED"` | no |
| vlan\_tag8021q | The IEEE 802.1Q VLAN tag for this attachment, in the range 2-4094. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| attachment | The created attachment |
| customer\_router\_ip\_address | IPv4 address + prefix length to be configured on the customer router subinterface for this interconnect attachment. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
