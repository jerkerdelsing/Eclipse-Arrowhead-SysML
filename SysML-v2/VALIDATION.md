# Eclipse Arrowhead 5.3 SysML v2 validation

All 49 current model files pass the installed SysML v2 Xtext reference tooling with **0 errors and 0 warnings**. A separate parser pass reports **0 syntax errors**. Independent regeneration matches the models and source inventory byte for byte.

See [the complete validation record](../VALIDATION.md) for tools, commands, Papyrus checks, native catalogue comparison and the scope of these results. The raw Xtext result is [sysml-v2.log](../validation/sysml-v2.log).

The 15 November DSL revision also passes the targeted five-rule check: MQTT 5.0, functional-properties and port types/multiplicities, one-or-more status codes, and FullPort-only usage. All 245 generated system ports apply FullPort. These checks cover the requested rules rather than certifying full equivalence of the v1.6 and v2 DSLs.
