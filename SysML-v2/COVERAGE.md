# Eclipse Arrowhead 5.3 model coverage

Java reference release/5.3, snapshot 2026-11-14. Five core variants and twenty support systems, including the legacy SoSConfigurator.

| System | Role | Services | Interfaces | Operations |
|---|---|---:|---:|---:|
| ServiceRegistry | Core | 6 | 11 | 61 |
| Authentication | Core | 4 | 7 | 27 |
| ConsumerAuthorization | Core | 6 | 11 | 43 |
| DynamicServiceOrchestration | Core | 7 | 12 | 31 |
| SimpleStoreServiceOrchestration | Core | 6 | 11 | 31 |
| AIGym | Support | 2 | 2 | 9 |
| Blacklist | Support | 4 | 7 | 17 |
| CertificateAuthority | Support | 4 | 4 | 13 |
| Choreographer | Support | 5 | 5 | 24 |
| Configuration | Support | 5 | 5 | 12 |
| DataManager | Support | 4 | 4 | 12 |
| DeviceQoSEvaluator | Support | 4 | 7 | 15 |
| EventHandler | Support | 5 | 5 | 11 |
| GateTunnel | Support | 4 | 4 | 12 |
| Gatekeeper | Support | 4 | 4 | 9 |
| GraphDBManager | Support | 3 | 3 | 11 |
| LocalCloudConfigurator | Support | 3 | 3 | 15 |
| LocalCloudManager | Support | 3 | 3 | 23 |
| Onboarding | Support | 4 | 4 | 15 |
| PlantDescriptionEngine | Support | 4 | 4 | 16 |
| SoLocalCloudConfigurator | Support | 3 | 3 | 17 |
| SoSConfigurator | Support | 3 | 3 | 11 |
| SysMonitor | Support | 5 | 5 | 16 |
| TimeManager | Support | 3 | 3 | 6 |
| TranslationManager | Support | 5 | 9 | 23 |

Totals: 25 systems, 106 services, 139 protocol interfaces, 480 protocol operations.

Operations are counted once per transport. Native sysMonitor entries describe conditional publication. Console and diagnostic routes are listed separately in sources.json and UnregisteredEndpoints. Route presence and permissive DTO cardinalities do not establish runtime interchangeability.
