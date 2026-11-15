# Eclipse Arrowhead 5.3 implementation differences

The Java reference models cover all five core variants and twenty support systems, including legacy SoSConfigurator: 106 services, 139 protocol interfaces and 480 protocol operations. Go and Rust cover the core HTTP paths well, but they are not interchangeable implementations of the full modeled system catalogue. The largest differences concern the available systems, MQTT APIs, configuration and storage, and several service behaviors.

## Source baseline

The comparison uses the local primary repositories' `release/5.3` branches as captured on 14 November 2026. Active working branches were not changed.

| Implementation | Commit |
|---|---|
| Java | `7a741f9baa4a01fd97a99f982ee62b0f0da54aae` |
| Go | `3a16f850c81ac78babf404782c42679a191c350f` |
| Rust | `b2cb8f36fa08dabcb5e38a56f27b859bfc0cd359` |

The complete authoritative commit strings are in [sources.json](sources.json). Java's framework constant and core dependency version are 5.3.0. Several Go registration responses and Rust crate/telemetry versions on these release branches still say 5.2.2. Independent service and monitoring contract versions must not be inferred from the branch name. Evidence: [Java constant](../../ah5-common-java-spring/common-utils/src/main/java/eu/arrowhead/common/Constants.java), [Go registration](../../../Eclipse-Arrowhead-go/ah5-TimeManager-go/internal/core/registration.go), [Rust messaging crate](../../../Eclipse-Arrowhead-rust/ah5-messaging-rust/Cargo.toml), [Rust telemetry](../../../Eclipse-Arrowhead-rust/ah5-core-rust/src/telemetry.rs).

## Systems and listening ports

| Java system | Go difference | Rust difference |
|---|---|---|
| GraphDBManager | No corresponding implementation folder | No corresponding implementation folder |
| LocalCloudConfigurator | Separate ColonyOS operations tool at port 8095; its README explicitly says it has no Arrowhead identity or ServiceRegistry registration. Java is an Arrowhead support system at 8492, with `localCloudConfiguration`, saved designs and management services. | No corresponding implementation folder |
| SoLocalCloudConfigurator | No corresponding implementation folder | No corresponding implementation folder |
| SoSConfigurator | No corresponding implementation folder | No corresponding implementation folder |
| LocalCloudManager | Separate native console; system API defaults to 8480, compared with Java 8491 | Separate native console; system API defaults to 8480, compared with Java 8491 |

Java SoLocalCloudConfigurator supplies the policy-constrained System of LocalClouds design and package workflow. SoSConfigurator remains modeled as a legacy system. Go TestTranslation and the native demonstration producers are extra test/application systems and are outside the Java core/support baseline.

Evidence: the release inventories, [Go configurator README](../../../Eclipse-Arrowhead-go/ah5-LocalCloudConfigurator-go/README.md), [Java SoLocalCloudConfigurator README](../../ah5-SoLocalCloudConfigurator-java/README.md), and each implementation's `LISTENING-PORTS.md`. The remaining shared core/support defaults agree in the inspected port tables. Listening ports remain configurable and are distinct from advertised ports and console connectors.

## HTTP contracts

All **90 distinct registered Java core HTTP method/path pairs** have corresponding Go and Rust route declarations after normalizing path parameter names and trailing slashes. This includes the DSO plant-management extension. This is a route comparison, not a successful/failing request replay or proof of identical DTOs, status codes and authorization.

Two shared support systems have exact path differences:

| Java endpoint absent at that exact path in both evaluated native catalogues | Native distinction |
|---|---|
| `GET /datamanager/mgmt/general/status` | Native general-management routes use their own catalogue; the Java registered status endpoint is absent. |
| `GET /sysmonitor/mgmt/general/status` | Native monitoring status is exposed through its management API. |
| `GET /sysmonitor/mgmt/general/get-config` | Native common configuration route is under `/sysmonitor/general/mgmt/get-config`. |
| `POST /sysmonitor/mgmt/general/logs` | Native common log route is under `/sysmonitor/general/mgmt/logs`. |

The per-system counts and every normalized Java-only and native-only path are in [the route comparison](comparison/README.md) and [route-differences.json](comparison/route-differences.json). LocalCloudManager's runtime dispatcher and the Go configurator's separate API are outside this route-count comparison. Java console/diagnostic endpoints and controller aliases are retained separately in the models and source inventory, without presenting them as additional registered services.

The Go shared support production files match across their sixteen modules after normalizing module import paths. Their route constructors were evaluated without listeners. The newer Go core roles were evaluated through their shared route constructor; Go ServiceRegistry was checked through its direct route declarations. Rust route functions were compiled and evaluated from the pinned release sources. The historical native `contracts.json` files were not treated as a current runtime catalogue.

## Transport contracts

* Java exposes MQTT request/reply interfaces for the core catalogue and for Blacklist, DeviceQoSEvaluator and TranslationManager. These optional interfaces are retained in the reference models.
* Go's newer core MQTT adapter restricts response topics to `arrowhead/response/<requester>/`, sends no response for an invalid identity token, and keeps certificate-bound identity login/logout/change on HTTPS. These are explicit implementation choices in [the adapter](../../../Eclipse-Arrowhead-go/ah5-core-go/authentication/internal/core/mqtt.go).
* The shared Go support runtime registers HTTP business-service interfaces; its broker runtime supplies native AMQP telemetry, SysMonitor MQTT output and AIGym subscription, plus TestTranslation-specific transport code. It does not expose the Java Blacklist, DeviceQoSEvaluator or TranslationManager MQTT request/reply service interfaces. See [registration](../../../Eclipse-Arrowhead-go/ah5-TimeManager-go/internal/core/registration.go) and [broker runtime](../../../Eclipse-Arrowhead-go/ah5-TimeManager-go/internal/core/messaging.go).
* Rust's core runtime does not expose the Java core MQTT request/reply APIs. Its shared support runtime likewise lacks the Java Blacklist, DeviceQoSEvaluator and TranslationManager MQTT request/reply adapters. Native AMQP monitoring, SysMonitor MQTT output, AIGym observation subscription and federation broker traffic are separate implemented capabilities. See the Rust [core runtime](../../../Eclipse-Arrowhead-rust/ah5-core-rust/src/runner.rs), [support runtime](../../../Eclipse-Arrowhead-rust/ah5-support-runtime-rust/src/runner.rs) and [monitor](../../../Eclipse-Arrowhead-rust/ah5-support-runtime-rust/src/monitor.rs).
* Go's SysMonitor MQTT output uses Paho MQTT 3.1.1; Java and Rust use MQTT 5 client libraries. Thus matching observation topics do not establish identical MQTT-version behavior. Evidence: [Go MQTT dependency](../../../Eclipse-Arrowhead-go/ah5-SysMonitor-go/go.mod), [Rust MQTT dependency](../../../Eclipse-Arrowhead-rust/ah5-messaging-rust/Cargo.toml), and the Java SysMonitor Maven dependencies.

## Service behavior and runtime differences

| Area | Confirmed difference in the pinned code |
|---|---|
| Persistence and configuration | Java's core uses Spring configuration and JPA/SQL entities. The newer Go core and Rust core use native JSON configuration and private snapshot stores. Shared native support storage is also primarily JSON, while native SysMonitor has its own history/outbox storage. These are different persistence and configuration contracts, even where HTTP paths match. See Java core `jpa/`, Go core `store.go`/`config.go`, and Rust core `store.rs`/`config.rs`. |
| TimeManager in Go | The native implementation queries one configured NTP server during the request, uses a one-second timeout and a fixed absolute offset threshold of 1000 ms. Java schedules checks against a configured server list with fallback, configurable timeout/threshold and cached trust state. [Go implementation](../../../Eclipse-Arrowhead-go/ah5-TimeManager-go/internal/core/ntp.go), [Java trust service](../../ah5-TimeManager-java-spring/src/main/java/eu/arrowhead/timemanager/service/TimeTrustService.java). |
| TimeManager in Rust | SNTP trust evaluation is implemented. The response nevertheless fixes `tz` to `UTC` and `dst` to `false`, while Java accepts a configured time zone and derives DST. [Rust time response and trust service](../../../Eclipse-Arrowhead-rust/ah5-support-runtime-rust/src/basic.rs), [Java time response](../../ah5-TimeManager-java-spring/src/main/java/eu/arrowhead/timemanager/service/TimeService.java). |
| Choreographer in Rust | Requests with `allowInterCloud=true` explicitly return 501. Go passes this option into its executor orchestration request. [Rust rejection](../../../Eclipse-Arrowhead-rust/ah5-support-runtime-rust/src/choreography.rs), [Go proxy orchestration](../../../Eclipse-Arrowhead-go/ah5-Choreographer-go/internal/core/choreography_proxy.go). |
| TranslationManager in Go | Registry-based interface/data-model translator and factory discovery is implemented. The code excludes interface translators whose management policy ends in `TOKEN_AUTH` and chooses the first acceptable translator. [Go translation engine](../../../Eclipse-Arrowhead-go/ah5-TranslationManager-go/internal/core/translation.go). |
| TranslationManager in Rust | The native bridge workflow calls a pinned logical `InterfaceTranslator` upstream at `/translation/discovery` and negotiation endpoints. It is not the Java engine's complete registry-driven translator/factory selection pipeline. [Rust translation workflow](../../../Eclipse-Arrowhead-rust/ah5-support-runtime-rust/src/translation.rs), Java `TranslatorBridgeEngine` and translator drivers. |
| DeviceQoSEvaluator | The native evaluators calculate weighted means over measurement windows through their measurement-adapter profile. Java has scheduled device/system measurement organization, RTT and augmented-measurement drivers, and persisted statistics. The matching filter/sort routes therefore do not establish equivalent measurement collection and scoring. [Go evaluator](../../../Eclipse-Arrowhead-go/ah5-DeviceQoSEvaluator-go/internal/core/qos.go), [Rust evaluator](../../../Eclipse-Arrowhead-rust/ah5-support-runtime-rust/src/qos.rs), Java `engine/` and `driver/` sources. |

For the other shared systems, the exact HTTP route findings and common transport/storage differences above apply. No further per-system behavioral equivalence conclusion is drawn from route presence. Field validation, pagination, error payloads, authorization edge cases, retries, and crash recovery require differential execution against the exact candidates.

## Superseded gap statements

Several retained compatibility documents describe an earlier candidate. The current source demonstrates Go and Rust dynamic orchestration translation/QoS integration, Rust bootstrap/onboarding/device/system certificate stages, and Rust scheduled SNTP trust checks. The Go federation engine also supports an explicitly selected `ah-gt-1` profile as well as `legacy-mtls`; a claim that Go has no AH-GT-1 implementation would be stale. These implemented paths were not reported as absent.

Evidence: Go and Rust core `orchestration` sources; [Rust onboarding](../../../Eclipse-Arrowhead-rust/ah5-support-runtime-rust/src/onboarding.rs); Rust `basic.rs::time`; and [Go federation](../../../Eclipse-Arrowhead-go/ah5-GateTunnel-go/internal/relay/federation.go). Source presence establishes implementation scope; this update does not rerun the historical deployment or interoperability trials.

## Scope of verification

This is a source-based model and interface comparison with model-tool validation and offline native route extraction. It does not establish live deployment behavior or exhaustive Go/Rust semantic parity. [VALIDATION.md](VALIDATION.md) records the actual checks. Source commits, Java input hashes, native source hashes, operation inventories and route differences make the assessment reproducible against these release snapshots.
