# Eclipse Arrowhead 5.3 HTTP route differences

This catalogue compares the Java model’s registered HTTP contracts with the current native route declarations at the commits in sources.json. Path parameter names and trailing slashes are normalized; query parameters are excluded. A matching route does not establish matching DTOs, authorization, status codes or behavior. A Java-only entry means that the exact method and normalized path is absent from the evaluated native catalogue; a differently routed equivalent may exist.

| System | Java HTTP | Go matching | Rust matching |
|---|---:|---:|---:|
| ServiceRegistry | 29 | 29 | 29 |
| Authentication | 12 | 12 | 12 |
| ConsumerAuthorization | 20 | 20 | 20 |
| DynamicServiceOrchestration | 15 | 15 | 15 |
| SimpleStoreServiceOrchestration | 14 | 14 | 14 |
| AIGym | 4 | 4 | 4 |
| Blacklist | 7 | 7 | 7 |
| CertificateAuthority | 10 | 10 | 10 |
| Choreographer | 21 | 21 | 21 |
| Configuration | 9 | 9 | 9 |
| DataManager | 9 | 8 | 8 |
| DeviceQoSEvaluator | 6 | 6 | 6 |
| EventHandler | 8 | 8 | 8 |
| GateTunnel | 9 | 9 | 9 |
| Gatekeeper | 6 | 6 | 6 |
| GraphDBManager | 8 | no system folder | no system folder |
| LocalCloudConfigurator | 12 | separate API review | no system folder |
| LocalCloudManager | 20 | separate API review | separate API review |
| Onboarding | 12 | 12 | 12 |
| PlantDescriptionEngine | 13 | 13 | 13 |
| SoLocalCloudConfigurator | 14 | no system folder | no system folder |
| SoSConfigurator | 8 | no system folder | no system folder |
| SysMonitor | 12 | 9 | 9 |
| TimeManager | 3 | 3 | 3 |
| TranslationManager | 10 | 10 | 10 |

Go’s sixteen shared support implementations were compared after normalizing only their module import paths; their production core files match. The support runtime constructors were evaluated without opening listeners. The four newer Go core roles were evaluated through their shared constructor. Go ServiceRegistry paths were extracted from its direct route declarations. Rust core/support route functions were compiled and evaluated in a small offline catalogue harness. LocalCloudManager and the Go LocalCloudConfigurator have separate console/operations APIs and are covered in the narrative report.

Full normalized Java-only and native-only lists, and explicit Rust unsupported flags: [route-differences.json](route-differences.json). Native source hashes: [source-hashes.json](source-hashes.json).
