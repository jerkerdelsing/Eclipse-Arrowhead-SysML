# Eclipse Arrowhead 5.3 source and modeling notes

The current model inventory follows the pinned Java release sources. Documentation provides design intent and wire schemas; a matching Java controller supplies the implemented method/path, request/response types and extracted parameters. `sources.json` distinguishes Java-controller, Java-registration and documentation evidence for operations.

## Source reconciliation

* The generator re-extracts the core catalogue from Java; the checked-in older `documentation-tools/model.json` is not assumed current.
* Support services are read from their source builders, including inline builders and operation tables. This captures general-management services and configurator operations that the older generator skipped.
* SoLocalCloudConfigurator has no per-service `documentation/v5.3.0` IDD set at this Java commit. Its fourteen HTTP operations come directly from its service registration and controllers; its design description comes from its README. Its three conditional monitoring publications follow the common publisher contract.
* LocalCloudManager advertises a selected operation table and dispatches a wider console API through `/api/**`. The registered table, documented console endpoints and runtime dispatcher are retained as distinct evidence. Some registered descriptor paths are less specific than the runtime path, such as subscription operations whose runtime route carries an identifier. The model does not silently rewrite the descriptor or assert that its route alone is sufficient to make a call.
* HTTP aliases implemented by controllers, echo/health endpoints and other endpoints outside the registered service catalogue are retained in `unregisteredEndpoints`, v2 `Unregistered` actions and the Papyrus `UnregisteredEndpoints` classifiers.
* Forty-five matching documentation/controller entries differ in their extracted input type spelling or shape. They are listed in `documentationDifferences`. This includes documentation schema names versus Java DTO names or generic map wrappers; the count is not a count of demonstrated incompatible APIs.

## Model interpretation

The models contain SysD, SysDD and implementation structure, service/protocol ports, wire operations, DTOs/enums and optional cloud composition. They do not synthesize executable service workflows or assume that all systems are deployed together. The two orchestrators remain separate variants.

Native AMQP `sysMonitor` publication is conditional. Optional MQTT interfaces remain available as reference contracts; native implementations' missing or restricted MQTT APIs are described in the cross-language report. Broker names, deployment addresses and routing examples retained from source IDDs are examples, not framework-wide constants.

DTO cardinalities are deliberately permissive. Required-field annotations and every JSON serialization rule are not exhaustively translated. Open maps and unknown data shapes retain their source type strings and use `JSONValue` or `JSONMessage`. A model-tool pass establishes well-formedness and reference/type consistency; it does not establish complete wire compatibility.

## Papyrus compatibility

The new 5.3 entry point uses the defined 5.3 profile through a relative reference. Its `Release_5_3_0` package is the current library. Earlier semantic elements and diagrams are retained for reference and keep their IDs. The original 5.0 entry point and profile are preserved separately.

The release branch stores its original 5.0 profile in a retained nested folder. The generator locates it, records its actual source path, and places the new 5.3 profile in the canonical `Metamodel and Profile` destination. It uses deterministic IDs for generated model elements and disjoint IDs for system packages and system classifiers.

The active DSL revision of 15 November applies the requested MQTT 5.0, String functional-properties, mandatory integer port, one-or-more status-code and FullPort-only rules. These rules override the corresponding older DSL definitions, without changing the pinned Java implementation source snapshot. `sources.json` records them under `dslRules` and `dslRevisionDate`. The generated v1.6 profile has one rebuilt Ecore definition; generation preserves the new rules and annotates all model ports with FullPort.
