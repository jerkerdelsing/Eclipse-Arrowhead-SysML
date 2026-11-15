# Eclipse Arrowhead 5.3 SysML v2 library

The Java `release/5.3` reference library contains **49 model files**, covering 25 systems, 106 services, 139 protocol interfaces and 480 operations. The exact source commits, inputs and operations are in [sources.json](sources.json); the Go/Rust findings are in [the comparison report](../CROSS-LANGUAGE-DIFFERENCES.md).

## Import

Import every top-level `.sysml` file in this directory into one project with the standard SysML/KerML libraries. Do not import another copy of the older Arrowhead DSL namespaces alongside these files. Files under `tools/` are generator and validator inputs, not additional model libraries.

```sysml
package MyArrowheadDesign {
    private import ArrowheadServiceRegistry::*;
    private import ArrowheadSoLocalCloudConfigurator::*;
    part registry : ServiceRegistry;
    part configurator : SoLocalCloudConfigurator;
}
```

Each system has `_SysD`, `_SysDD` and implementation definitions. Service `_SD` ports describe the abstract contract; protocol `_HTTP_IDD`, `_MQTT_IDD` and `_AMQP_IDD` ports describe wire interfaces. Implementations specialize SysDD. The separate abstraction-level ports are not automatically bound.

The active DSL uses MQTT 5.0 exclusively, `SysD.FunctionalProperties: String[1..*]`, `IDD.Port: Integer[1]` and protocol `StatusCode[1..*]`. FullPort is its only port annotation, and all 245 system service/protocol port usages explicitly apply `@FullPort`. MQTT 3.1.1 and ProxyPort definitions and aliases have been removed from the active DSL.

Requests enter provider ports and responses/publications leave them. `WireOperation` metadata retains method, address, source request/response types and extracted query/path/status information. Unsupported or open data shapes remain `JSONValue`/`JSONMessage`; source type strings are retained. Lists/arrays are multivalued; field multiplicities are permissive and are not a JSON validation schema.

Native `sysMonitor` depends on `sysmonitor.enabled=true`. MQTT and AMQP protocol ports are optional. Application models must choose transports, connections, deployment multiplicities and security settings. The optional members of `ArrowheadLocalCloudLibrary::ArrowheadLocalCloud` form a catalogue, not a required deployment. SoSConfigurator is explicitly legacy.

## Regenerate

Use an unchanged checkout or exported source snapshot of the intended release commit. The generator does not build, deploy, or modify implementation sources.

```sh
python3 tools/generate_library.py \
  --source-root /path/to/Eclipse-Arrowhead-java \
  --provenance /path/to/provenance.json \
  --output /path/to/review-distribution
```

`--provenance` is optional and accepts the language-keyed repository/ref/commit metadata structure in the delivered root `sources.json`. For the recorded run the Java, Go and Rust release branches were exported independently and pinned by commit. The generator re-extracts the core source catalogue rather than trusting an older `documentation-tools/model.json`; it reads the current support service builders/controllers and the `documentation/v5.3.0` IDDs. Inline registrations, path aliases, source-only configurator APIs and Java record DTOs are included. The original profile's retained nested release-branch location is handled automatically.

Regenerate native HTTP catalogues offline, without starting systems:

```sh
python3 tools/compare_implementations.py \
  --go-root /path/to/Eclipse-Arrowhead-go \
  --rust-root /path/to/Eclipse-Arrowhead-rust \
  --java-inventory /path/to/review-distribution/sources.json \
  --output /path/to/review-comparison
```

This needs Go, Rust and cached dependencies. It compiles temporary catalogue harnesses; it does not alter the native source trees. Java-only/native-only route lists normalize path-parameter names and omit query parameters. Matching paths do not prove matching behavior.

## Validate

```sh
ECLIPSE_HOME=/path/to/sysml-v2-eclipse \
SYSML_STANDARD_LIBRARY=/path/to/sysml.library \
sh tools/validate.sh
```

The launcher checks the 49 delivered models with Xtext `CheckMode.ALL`, including linking and semantic checks. `SYNTAX_ONLY=1` selects a separate parser pass. `ValidateUML.java` checks the Papyrus release package using installed UML/SysML profiles; see [the validation record](../VALIDATION.md) for its command and scope.

Run `python3 tools/verify_dsl_contract.py /path/to/distribution` to check the five requested DSL rules in the editable UML profile, its generated Ecore package, the v2 definitions and the model port annotations. These targeted checks complement model validation; they do not certify all aspects of v1/v2 DSL equivalence.
