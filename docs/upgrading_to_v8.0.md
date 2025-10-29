# Upgrading to v8.0

The v8.0 release contains backwards-incompatible changes.

### [`project` variable](https://github.com/terraform-google-modules/terraform-google-cloud-router/blob/v7.4.0/variables.tf#L25) renamed to `project_id`

To align with the standard naming conventions, the `project` input variable has been renamed to `project_id`. This change applies to the main module and submodule (`interface`).

To upgrade, module calls must be updated to use the `project_id` argument and the version constraint must be updated to `~> 8.0`.
