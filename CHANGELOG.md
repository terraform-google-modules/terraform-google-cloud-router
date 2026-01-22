# Changelog

All notable changes to this project will be documented in this file.

The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to
[Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [8.3.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v8.2.0...v8.3.0) (2026-01-21)


### Features

* update metadata.yaml to include address module connection ([#189](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/189)) ([51c36f1](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/51c36f1a570f5313350d44f53e40000aa8280665))

## [8.2.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v8.1.0...v8.2.0) (2026-01-06)


### Features

* Add VISIBILITY_ROOT to router and nat outputs ([#186](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/186)) ([e85af08](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/e85af08ead06fc80bc2a88a1b4f4929b26627f2c))

## [8.1.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v8.0.0...v8.1.0) (2025-12-19)


### Features

* Add 'stack_type' variable for IPv6 Interconnect Attachment ([#184](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/184)) ([5434638](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/54346388b68ab9b9f0664c141cd2af84242cbd8d))
* Add interface connection validation and update metadata ([#183](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/183)) ([757f9de](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/757f9debb243822dcd5a593584350dcda52ab261))

## [8.0.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v7.4.0...v8.0.0) (2025-11-05)


### ⚠ BREAKING CHANGES

* rename project input variable to project_id for consistency ([#173](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/173))

### Features

* rename project input variable to project_id for consistency ([#173](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/173)) ([8862c88](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/8862c88a8b468d3f8d6d24c521acc911171f9d8e))


### Bug Fixes

* Remove duplicate title in metadata.yaml ([#176](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/176)) ([4e9b72f](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/4e9b72f17d60ddb3d6336321363aae97ef40f4c6))

## [7.4.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v7.3.0...v7.4.0) (2025-10-27)


### Features

* Make cloud-router module ADC compliant ([#171](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/171)) ([8f29a17](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/8f29a1756e1b909d2207222cb5f3009a7f8e043e))

## [7.3.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v7.2.0...v7.3.0) (2025-08-28)


### Features

* **deps:** Update Terraform Google Provider to v7 (major) ([#166](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/166)) ([87cee24](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/87cee2422d811c65b436880ee929c95941683081))

## [7.2.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v7.1.0...v7.2.0) (2025-08-08)


### Features

* Added zero_advertised_route_priority in interconnect_attachment sub-module ([#162](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/162)) ([f6423e0](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/f6423e0d73dab6807c6c69cd62cf46e5fba6e58e))

## [7.1.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v7.0.0...v7.1.0) (2025-06-25)


### Features

* add zero_advertised_route_priority to the interface module ([#157](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/157)) ([82ccc35](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/82ccc35b48f394e93a43920948c5f6c0080989a3))

## [7.0.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v6.3.0...v7.0.0) (2025-04-28)


### ⚠ BREAKING CHANGES

* **TPG >= 5.12:** update interface module min provider version >= 5.12 ([#153](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/153))
* MD5 authentication for BGP support

### Features

* MD5 authentication for BGP support ([e6f8b6c](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/e6f8b6c73f564faea90b90b468757e5e35b244a6))
* partner interconnect ([#147](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/147)) ([0cff190](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/0cff1905735f4de59b65e12793adec7d3d6fa777))


### Bug Fixes

* **TPG >= 5.12:** update interface module min provider version &gt;= 5.12 ([#153](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/153)) ([532c95d](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/532c95d348055bc8d8eac198837f83352409c3a5))

## [6.3.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v6.2.0...v6.3.0) (2025-03-05)


### Features

* add HA VPN over interconnect support ([#142](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/142)) ([2b4b255](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/2b4b2555e9bbab2f849fe8c633568a92f30a806b))

## [6.2.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v6.1.0...v6.2.0) (2024-11-05)


### Features

* add drain IPs option to NAT resource ([#135](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/135)) ([d8ec351](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/d8ec351bf5e0d6aef9127ff924fc48f3f7902f91))

## [6.1.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v6.0.2...v6.1.0) (2024-08-29)


### Features

* **deps:** Update Terraform Google Provider to v6 (major) ([#129](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/129)) ([a4da4f0](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/a4da4f06fbae664e8e6ac8d060d785defac964ae))

## [6.0.2](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v6.0.1...v6.0.2) (2023-10-20)


### Bug Fixes

* upgraded versions.tf to include minor bumps from tpg v5 ([#92](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/92)) ([87f489d](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/87f489d35b7411145a33088c7c6b4b8df6982028))

## [6.0.1](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v6.0.0...v6.0.1) (2023-08-31)


### Bug Fixes

* Fix type for NAT subnetwork attributes ([#85](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/85)) ([1498a8c](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/1498a8cc6b5e1cda592398a7103e8d795887f6c3))

## [6.0.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v5.1.0...v6.0.0) (2023-08-23)


### ⚠ BREAKING CHANGES

* **TF>1.3:** Min terraform version 1.3. Changed variables type object with optional parameters ([#79](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/79))

### Features

* **TF>1.3:** Min terraform version 1.3. Changed variables type object with optional parameters ([#79](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/79)) ([adcf807](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/adcf8079a273da166d0c06d421aefc2ae4be9c06))

## [5.1.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v5.0.1...v5.1.0) (2023-07-10)


### Features

* Allow cloud nat logging to be disabled completely ([#76](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/76)) ([7e49b67](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/7e49b67043c164be501ef7077674cd964019bce6))

## [5.0.1](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v5.0.0...v5.0.1) (2023-04-06)


### Bug Fixes

* **deps:** update for tflint and cft/developer-tools v1.10 ([#66](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/66)) ([e9b4e18](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/e9b4e1807bd5dbc7ac1061711bf9d9d16427c751))

## [5.0.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v4.0.0...v5.0.0) (2023-03-07)


### ⚠ BREAKING CHANGES

* **TPG >=4.51:** add support for NAT tcp wait timeout ([#64](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/64))

### Features

* **TPG >=4.51:** add support for NAT tcp wait timeout ([#64](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/64)) ([fdd1250](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/fdd1250ba39f4dc7ed15d3c862276972c6a6fed7))

## [4.0.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v3.0.0...v4.0.0) (2022-11-08)


### ⚠ BREAKING CHANGES

* Add BFD support for interconnect attachments.  (#51)

* `interconnect_attachment` submodule increased Google Provider minimum version to 4.27 (#51)

### Features

* Add BFD support for interconnect attachments.  ([#51](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/51)) ([c5c5704](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/c5c57040fbadb2430c1442a2a0f540a2e8136f1e))

## [3.0.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v2.0.0...v3.0.0) (2022-07-08)


### ⚠ BREAKING CHANGES

* Increased Google Provider minimum version to 4.27 (#48)

### Features

* Implemented dynamic port allocation support ([#46](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/46)) ([345ddb5](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/345ddb533b55a8da85fc7c94b4b18d30d6ffa5d2))
* support max_ports_per_vm in NAT config ([#48](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/48)) ([270fe4f](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/270fe4f29916004b81734b82a76736e6cecfc1a5))

## [2.0.0](https://github.com/terraform-google-modules/terraform-google-cloud-router/compare/v1.3.0...v2.0.0) (2022-05-24)


### ⚠ BREAKING CHANGES

* use provider default values when specific settings omitted (#43)
* add support for BGP keepalive_interval (#42)

### Features

* add support for BGP keepalive_interval ([#42](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/42)) ([380d763](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/380d7632a6a28ab6277f47c4eada3293102a7788))


### Bug Fixes

* use provider default values when specific settings omitted ([#43](https://github.com/terraform-google-modules/terraform-google-cloud-router/issues/43)) ([5b4f46f](https://github.com/terraform-google-modules/terraform-google-cloud-router/commit/5b4f46f9d2280426bdce9d8ec1a35268de2ba5ca))

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
