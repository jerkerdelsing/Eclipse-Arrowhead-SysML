library package ArrowheadAIGym {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def AIGym_aiGym_SD :> ArrowheadService {
        @SD { MicroserviceName = "aiGym"; }
        doc /* Service version 1.0.0. Source: ah5-AIGym-java-spring/documentation/v5.3.0/AIGym-v5.3.0-SysD.tex */
    }
    port def AIGym_aiGym_HTTP_IDD :> AIGym_aiGym_SD {
        @IDD { MicroserviceName = "aiGym"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-AIGym-java-spring/documentation/v5.3.0/AIGym-v5.3.0-aiGym-HTTP-IDD.tex"; }
        attribute basePath : String = "/aigym";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address aigym, port 8478 and base path /aigym. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
status & GET & /status \\ \hline
add-sample & POST & /samples \\ \hline
predict & POST & /predict \\ \hline
observations & GET & /observations \\ \hline
\end{longtable}

\newpage */
        doc /* status: GET /aigym/status. Input: None; output: None.  */
        doc /* add-sample: POST /aigym/samples. Input: None; output: None.  */
        doc /* predict: POST /aigym/predict. Input: None; output: None.  */
        doc /* observations: GET /aigym/observations. Input: None; output: None.  */
    }
    port def AIGym_aiGym_HTTP_IDD_Implementation :> AIGym_aiGym_HTTP_IDD { @IDD_Implementation; }
    action def 'AIGym_aiGym_http_status_0' {
        doc /* Operation status. Wire method: GET; address: /aigym/status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/aigym/status"; requestType = "unspecified"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
    }
    action def 'AIGym_aiGym_http_add-sample_1' {
        doc /* Operation add-sample. Wire method: POST; address: /aigym/samples. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/aigym/samples"; requestType = "unspecified"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
    }
    action def 'AIGym_aiGym_http_predict_2' {
        doc /* Operation predict. Wire method: POST; address: /aigym/predict. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/aigym/predict"; requestType = "unspecified"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
    }
    action def 'AIGym_aiGym_http_observations_3' {
        doc /* Operation observations. Wire method: GET; address: /aigym/observations. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/aigym/observations"; requestType = "unspecified"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
    }
    port def AIGym_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-AIGym-java-spring/documentation/v5.3.0/AIGym-v5.3.0-SysD.tex */
    }
    port def AIGym_sysMonitor_AMQP_IDD :> AIGym_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-AIGym-java-spring/documentation/v5.3.0/AIGym-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.AIGym.AIGym";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, AIGym registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

\begin{lstlisting}[caption={Registered service instance (TestCloud).}]
{
  "serviceDefinitionName": "sysMonitor",
  "version": "1.0.0",
  "metadata": {
    "contract": "SysMonitor-AMQP-IDD-5.2.2",
    "schemaVersion": "1.0",
    "publisherMode": "native",
    "observationTypes": [
      "echo",
      "power",
      "status",
      "trainingSample",
      "inference"
    ],
    "delivery": "persistent, publisher-confirmed"
  },
  "interfaces": [
    {
      "templateName": "generic_amqps",
      "protocol": "amqps",
      "policy": "CERT_AUTH",
      "properties": {
        "accessAddresses": [
          "amqp-broker"
        ],
        "accessPort": 5671,
        "exchange": "arrowhead",
        "baseRoutingKey": "TestCloud.sysmonitor.AIGym.AIGym",
        "operations": [
          "echo",
          "power",
          "status",
          "trainingSample",
          "inference"
        ]
      }
    }
  ]
}
\end{lstlisting} */
        doc /* echo: PUBLISH <Cloud>.sysmonitor.AIGym.AIGym.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadAIGymData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.AIGym.AIGym.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadAIGymData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.AIGym.AIGym.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadAIGymData::'Observation'[0..1];
        doc /* trainingSample: PUBLISH <Cloud>.sysmonitor.AIGym.AIGym.trainingSample. Input: None; output: Observation.  */
        out item 'trainingSampleResponse' : ArrowheadAIGymData::'Observation'[0..1];
        doc /* inference: PUBLISH <Cloud>.sysmonitor.AIGym.AIGym.inference. Input: None; output: Observation.  */
        out item 'inferenceResponse' : ArrowheadAIGymData::'Observation'[0..1];
    }
    port def AIGym_sysMonitor_AMQP_IDD_Implementation :> AIGym_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'AIGym_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.AIGym.AIGym.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.AIGym.AIGym.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadAIGymData::'Observation'[0..1];
    }
    action def 'AIGym_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.AIGym.AIGym.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.AIGym.AIGym.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadAIGymData::'Observation'[0..1];
    }
    action def 'AIGym_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.AIGym.AIGym.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.AIGym.AIGym.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadAIGymData::'Observation'[0..1];
    }
    action def 'AIGym_sysMonitor_amqp_trainingSample_3' {
        doc /* Operation trainingSample. Wire method: PUBLISH; address: <Cloud>.sysmonitor.AIGym.AIGym.trainingSample. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.AIGym.AIGym.trainingSample"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadAIGymData::'Observation'[0..1];
    }
    action def 'AIGym_sysMonitor_amqp_inference_4' {
        doc /* Operation inference. Wire method: PUBLISH; address: <Cloud>.sysmonitor.AIGym.AIGym.inference. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.AIGym.AIGym.inference"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadAIGymData::'Observation'[0..1];
    }
    part def AIGym_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "AIGym"; FunctionalProperties = "This document describes the AIGym support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-AIGym-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-AIGym-java-spring/documentation/v5.3.0/AIGym-v5.3.0-SysD.tex"; }
        doc /* This document describes the AIGym support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-AIGym-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.
  \end{abstract} */
        port 'aiGym_SD' : AIGym_aiGym_SD { @FullPort; }
        port 'sysMonitor_SD' : AIGym_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, ConsumerAuthorization, DynamicServiceOrchestration, ServiceRegistry, SysMonitor. These are external requirements, not assumed co-deployments. */
    }
    part def AIGym_SysDD :> AIGym_SysD {
        @SysDD;
        port 'aiGym_http' : AIGym_aiGym_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : AIGym_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def AIGym :> AIGym_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8478;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'AIGym_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /health; source ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/AiGymController.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/health"; } }
    action def 'AIGym_Unregistered_1' { doc /* Unregistered HTTP endpoint; GET /aigym/mgmt/general/status; source ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/AiGymController.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/aigym/mgmt/general/status"; } }
}
