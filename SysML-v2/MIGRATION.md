# Eclipse Arrowhead 5.3 model migration

The active v2 model set replaces the earlier 5.2.2 snapshot. Existing package and system names are retained. Four additional support systems are covered: GraphDBManager, LocalCloudConfigurator, SoLocalCloudConfigurator and legacy SoSConfigurator.

The generator now reads release source registrations and controllers, fresh core extraction and v5.3.0 documentation. It no longer requires historical implementation checkouts, packaged 5.2.2 JARs, or the original translated DSL at its former location. A retained DSL seed preserves the public metadata vocabulary and compatibility aliases.

HTTP operation parameter types follow a matching Java controller; registration descriptors and documentation remain separately traceable. Source records and documented MQTT schemas are included in the data model. Core data contains the union of the five systems' source/documented schemas. Runtime-dispatched console endpoints and controller aliases remain explicitly unregistered endpoints.

Native monitoring and MQTT ports are optional, reflecting runtime configuration. Other service/interface names remain compatible, but regenerated operation indexes and DTO typing can differ. Designs that reference an action by its full generated name should check it against the new operation inventory.

For Papyrus, use the new `EclipseArrowhead-5.3/Arrowhead-5.3.di` and the defined 5.3 profile. Current content is in `Release_5_3_0`; earlier diagrams and model IDs are retained as a legacy reference. The original 5.0 entry point remains available.

The 15 November DSL revision selects MQTT 5.0, changes `SysD.FunctionalProperties` to `String[1..*]`, requires one `IDD.Port` integer, and requires one or more protocol status codes. The active profile/v2 DSL no longer defines ProxyPort or the MQTT 3.1.1 datatype. ProxyPort applications in the 5.3 model have been migrated to FullPort, and generated service/protocol port usages apply FullPort explicitly. Custom designs importing the active DSL must likewise replace ProxyPort and update any MQTT datatype references. Retained 5.0 files are historical and are not rewritten.

See [coverage](COVERAGE.md), [source inventory](sources.json), [validation](../VALIDATION.md), and [implementation differences](../CROSS-LANGUAGE-DIFFERENCES.md).
