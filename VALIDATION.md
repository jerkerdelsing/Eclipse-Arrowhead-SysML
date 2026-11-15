# Eclipse Arrowhead 5.3 model validation

The active DSL and models were revalidated on 15 November 2026 after the requested DSL changes. Implementation coverage remains based on the three pinned 14 November `release/5.3` snapshots in `sources.json`.

| Check | Result |
|---|---|
| SysML v2 Xtext linking and semantic validation, `CheckMode.ALL` | **0 errors, 0 warnings** across all 49 current model files |
| Separate SysML v2 parser pass | **0 syntax errors** |
| Papyrus UML validation of `Release_5_3_0` | **0 errors, 0 warnings** |
| Unresolved references in the Papyrus release package | **0** |
| Requested DSL rules in v1.6 UML, defined Ecore and v2 | **Pass**: MQTT 5.0; String functional properties `[1..*]`; integer port `[1]`; status codes `[1..*]`; FullPort only |
| FullPort application coverage | **245/245** generated v2 system ports; **572/572** v1.6 model ports, including retained semantic content; **0 ProxyPort applications** |
| XMI identifier uniqueness | Pass; package and classifier IDs are disjoint |
| Cross-format coverage | 25 systems and 480 protocol operations in each format |
| Source traceability | 1,675 Java code/configuration/documentation/legacy-model input hashes, plus generator seed hashes |
| Independent model regeneration | All 49 v2 models, the generated 5.3 UML/notation/DI/properties files and the source inventory match byte for byte |
| Independent native catalogue regeneration | Go/Rust routes and normalized route-difference JSON match the delivered comparison |
| Go source-copy consistency | All sixteen shared support production-core copies match after import-path normalization; all four newer core production-core copies also match |

## Tool versions and evidence

* SysML v2 reference tooling: `0.52.1.202510201816` from `/Applications/Eclipse-2503.app/Contents/Eclipse/plugins`.
* Standard library: `/Users/jerkerdelsing/Work/lule/EISLAB/Project/Eclipse/OLD/SysON/SysMLv2-dev/sysml.library`.
* Papyrus: installed `/Applications/Papyrus-2506.app/Contents/Eclipse`; SysML 1.6 plugin `2.4.0`, UML2 library `5.5.0`.
* Java: Zulu OpenJDK 25.0.2.
* Raw final results: [SysML v2](validation/sysml-v2.log), [Papyrus](validation/sysml-v1.6.log), [separate parser pass](validation/sysml-v2-syntax.log), [requested DSL rules](validation/dsl-contract.json), and [native regeneration](validation/native-catalogues.log). Native comparison evidence is retained from the unchanged 14 November implementation snapshot.

The v2 validator loaded 143 resources: 49 Arrowhead files and standard-library dependencies. Xtext performs linking and semantic checks during `CheckMode.ALL`. The Java/Guice `Unsafe` deprecation notice in its output is a runtime notice, not a model diagnostic.

The Papyrus validator loads the actual UML and SysML profiles and the defined 5.3 Arrowhead profile, resolves release-package references and runs the UML diagnostician. The retained legacy semantic elements and diagrams are outside the new release package's semantic result. Diagram XML, semantic targets and generated IDs are checked, but a visual-editor round trip or rendering of every legacy diagram is not claimed.

## Repeat the checks

From `SysML-v2/`:

```sh
ECLIPSE_HOME=/Applications/Eclipse-2503.app/Contents/Eclipse \
SYSML_STANDARD_LIBRARY=/path/to/sysml.library \
sh tools/validate.sh
```

For the Papyrus semantic check, with `PAPYRUS_HOME` pointing to its Eclipse folder:

```sh
mkdir -p /tmp/arrowhead-uml-check
javac -cp "$PAPYRUS_HOME/plugins/*" -d /tmp/arrowhead-uml-check tools/ValidateUML.java
java -Xmx3g -cp "/tmp/arrowhead-uml-check:$PAPYRUS_HOME/plugins/*" \
  ValidateUML "$PAPYRUS_HOME" '../SysML v1.6/EclipseArrowhead-5.3/Arrowhead-5.3.uml'
```

The model and native catalogue regeneration commands are in [the library guide](SysML-v2/README.md). Native extraction uses temporary offline Go/Rust harnesses and opens no service listeners. The recorded source hashes and release commits are the baseline for comparison.

Run `python3 SysML-v2/tools/verify_dsl_contract.py /path/to/distribution` to repeat the requested DSL rule and port-annotation checks. The 5.3 profile contains a single rebuilt Ecore definition, and the profile diagram has no views pointing to the removed ProxyPort or MQTT 3.1.1 definitions. The retained 5.0 profile and entry point are outside this active-DSL migration.

These checks establish model well-formedness, reference/type consistency, coverage and reproducibility. They do not establish deployment correctness, exhaustive DTO/nullability constraints or behavioral equivalence between the language implementations.
