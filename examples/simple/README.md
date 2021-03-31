#  Simple Cloud Router

This example configures a single simple Cloud Router inside of a project.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| network | A reference to the network to which this router belongs | `string` | n/a | yes |
| project | The GCP project ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| router\_name | The name of the created router |
| router\_region | The region of the created router |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


