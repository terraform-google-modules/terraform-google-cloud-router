<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| admin\_enabled | Whether the VLAN attachment is enabled or disabled | `bool` | `true` | no |
| bandwidth | Provisioned bandwidth capacity for the interconnect attachment | `string` | `"BPS_10G"` | no |
| candidate\_subnets | Up to 16 candidate prefixes that can be used to restrict the allocation of cloudRouterIpAddress and customerRouterIpAddress for this attachment. All prefixes must be within link-local address space (169.254.0.0/16) and must be /29 or shorter (/28, /27, etc). | `list(string)` | `null` | no |
| description | An optional description of this resource | `string` | `null` | no |
| interconnect | URL of the underlying Interconnect object that this attachment's traffic will traverse through. | `string` | n/a | yes |
| interface | Interface to deploy for this attachment. | `any` | n/a | yes |
| name | The name of the interconnect attachment | `string` | n/a | yes |
| peer | BGP Peer for this attachment. | `any` | n/a | yes |
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
