# Eclipse Arrowhead 5.3 SysML models

Java reference models for `release/5.3`, updated 14 November 2026: **25 systems, 106 services, 139 protocol interfaces and 480 protocol operations**. Coverage includes the five core variants and all twenty support systems, including legacy SoSConfigurator.

The active Arrowhead DSL was revised on 15 November 2026 in both formats: MQTT 5.0, `SysD.FunctionalProperties: String[1..*]`, `IDD.Port: Integer[1]`, protocol `StatusCode[1..*]`, and FullPort as the only port annotation. Generated system ports carry FullPort explicitly. The retained 5.0 files remain historical references.

* **SysML v1.6 / Papyrus:** open [Arrowhead-5.3.di](SysML%20v1.6/EclipseArrowhead-5.3/Arrowhead-5.3.di). Current definitions are in `Release_5_3_0`; the overview diagram is **Release 5.3 Core and Support Systems**. The defined [5.3 Arrowhead profile](SysML%20v1.6/Metamodel%20and%20Profile/ArrowheadProfile_v5.3.profile.uml) accompanies the model. Earlier semantic elements and diagrams remain as a legacy reference, and the original 5.0 entry point remains separate.
* **SysML v2:** import all 49 top-level `.sysml` files from [SysML-v2](SysML-v2/README.md) together, with the standard SysML/KerML libraries.
* **Coverage:** [system counts](SysML-v2/COVERAGE.md), [complete source and operation inventory](sources.json), and [validation](VALIDATION.md).
* **Go and Rust:** [implementation differences](CROSS-LANGUAGE-DIFFERENCES.md), [per-system HTTP comparison](comparison/README.md), and [machine-readable route differences](comparison/route-differences.json).

Both formats are generated from the same Java code/documentation inventory. They include SysD, SysDD and implementation classifiers, service and protocol contracts, typed DTOs and enums, operation signatures, native monitoring, and optional local-cloud composition. Unregistered controller/console endpoints are identified separately. MQTT and native AMQP monitoring ports have optional multiplicity to reflect runtime enablement. DTO field cardinalities remain permissive where required/nullability information was not extracted.

The models describe the local 5.3 release candidate; they do not announce an official upstream release. Java sources take precedence for matching controller signatures and registered operation tables. Documentation supplies design intent, source schemas and conditional interfaces. `sources.json` records the exact three release commits and input hashes. Live deployment behavior and exhaustive cross-language semantic equivalence are outside this validation.

Regeneration and comparison commands are in [the SysML v2 guide](SysML-v2/README.md).

## License

This repository is made available under the [Eclipse Public License 2.0](LICENSE) (SPDX: `EPL-2.0`).
