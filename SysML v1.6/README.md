# Eclipse Arrowhead 5.3 Papyrus models

Open `EclipseArrowhead-5.3/Arrowhead-5.3.di` with Papyrus and SysML 1.6 support. The model uses the sibling `Metamodel and Profile/ArrowheadProfile_v5.3.profile.uml` through a relative reference; it does not require a private Arrowhead profile pathmap.

`Release_5_3_0` is the current library: five core variants and twenty support systems. Each system has SysD, SysDD and implementation Blocks, Arrowhead design stereotypes, typed service/protocol classifiers and composite ports. Protocol operations retain their method/address, source path and extracted parameter/status information in comments. DTOs/enums are under each system's `Data` package. `ArrowheadLocalCloud` and `ArrowheadSystemOfLocalClouds` supply optional composition.

The **Release 5.3 Core and Support Systems** overview shows all 25 implementation Blocks. The copied earlier diagrams and semantic elements retain their original IDs for reference. Their legacy content is not a substitute for the new release package. `EclipseArrowhead-5.0`, the 5.0 profile and ArrowheadPrinciples remain separate compatibility/reference assets.

The active 5.3 profile uses MQTT 5.0, `SysD.FunctionalProperties: String[1..*]`, `IDD.Port: Integer[1]` and protocol `StatusCode[1..*]`. FullPort is the only port stereotype exposed by this DSL. Existing DSL and standard SysML ProxyPort applications in the 5.3 model were migrated to FullPort; all 572 ports, including those in the retained semantic content, have an Arrowhead FullPort application. The 245 ports in `Release_5_3_0` are included in that total.

The 5.3 profile also provides HTTPS/MQTTS/AMQP/AMQPS, PATCH and certificate-role enum values, and one current defined Ecore package. Its diagram omits the retired ProxyPort and MQTT 3.1.1 definition views. The profile is validated using the installed Papyrus UML/SysML libraries. The separate 5.0 profile remains a historical reference.

See [validation](../VALIDATION.md), [source inventory](../sources.json), and [Go/Rust differences](../CROSS-LANGUAGE-DIFFERENCES.md). No visual editor round-trip or rendering of every retained legacy diagram is claimed.
