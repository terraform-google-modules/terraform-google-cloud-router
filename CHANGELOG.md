# Changelog

All notable changes to this project will be documented in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.3.0](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/compare/v1.2.0...v1.3.0) (2021-11-18)


### Features

* update TPG version constraints to allow 4.0 ([#36](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/issues/36)) ([245a2a5](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/commit/245a2a56537e071e0d0bb6c8b37a5e6499801557))

## [1.2.0](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/compare/v1.1.0...v1.2.0) (2021-07-15)


### Features

* add Description field to cloud router ([#32](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/issues/32)) ([28b3006](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/commit/28b3006a6cff02eb40848be5c8ac34fe52a52258))

## [1.1.0](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/compare/v1.0.0...v1.1.0) (2021-06-01)


### Features

* Add ability to specify MTU for vlan_attachment submodule. ([#29](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/issues/29)) ([2234ff3](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/commit/2234ff33dbd4cb5b1b0434c3d0929cb1f32cbdae))
* Pass through enable_endpoint_independent_mapping ([#31](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/issues/31)) ([4a850cc](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/commit/4a850cc8b456adc5d6a7f62296f5e56faa3b4a08))

## [1.0.0](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/compare/v0.4.0...v1.0.0) (2021-04-08)


### ⚠ BREAKING CHANGES

* add Terraform 0.13 constraint and module attribution (#22)

### Features

* add Terraform 0.13 constraint and module attribution ([#22](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/issues/22)) ([2154aee](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/commit/2154aee587cf302cb583b1334f52f923b1801477))

## [0.4.0](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/compare/v0.3.0...v0.4.0) (2020-12-08)


### Features

* add integration tests ([#11](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/issues/11)) ([071d0d4](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/commit/071d0d4be4d0a417329ae6e60512440a43286f66))

## [0.3.0](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/compare/v0.2.0...v0.3.0) (2020-10-08)


### Features

* pin devtools to 0.12.0 ([#13](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/issues/13)) ([b8fd4c9](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/commit/b8fd4c94c26b9209ba4463ea27a3522dd423a1da))
* Support for Terraform 0.13 ([#12](https://github.com/terraform-google-modules/terraform-google-cloud-router/pull/12))

## [0.2.0](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/compare/v0.1.0...v0.2.0) (2020-06-30)


### Features

* Add candidate subnets field in interconnect attachment ([#5](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/issues/5)) ([96c62c7](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/commit/96c62c7b3332a88f1ab82efd7df1b6463a6275d4))
* make secondary_ip_range_names field optional ([#8](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/issues/8)) ([d420730](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/commit/d420730e068110658deef8df99075e40c4ed6357))


### Bug Fixes

* Automate filling peer ip address ([#6](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/issues/6)) ([2635e4e](https://www.github.com/terraform-google-modules/terraform-google-cloud-router/commit/2635e4e92d375217ab90148c8b4b5c88bed23155))

## [0.1.0] - 2020-02-07

### Added

- Initial release

[Unreleased]: https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/terraform-google-modules/terraform-google-cloud-router/releases/tag/v0.1.0
