# Upgrading to v9.0

The v9.0 release contains backwards-incompatible changes.

### ['export_policies','import_policies'](https://github.com/terraform-google-modules/terraform-google-cloud-router/blob/7b2c5685146f8d9b5e26328ead6154956ca9d33c/modules/interface/variables.tf#L55) added to interface submodule

Added the 'export_policies' and 'import_polcies' field to 'peer' variable in interface submodule and bubbled up to interconnect_attachment submodule.
