library package ArrowheadGateTunnel {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def GateTunnel_gateTunnelConnection_SD :> ArrowheadService {
        @SD { MicroserviceName = "gateTunnelConnection"; }
        doc /* Service version 1.0.0. Source: ah5-GateTunnel-java-spring/documentation/v5.3.0/GateTunnel-v5.3.0-SysD.tex */
    }
    port def GateTunnel_gateTunnelConnection_HTTP_IDD :> GateTunnel_gateTunnelConnection_SD {
        @IDD { MicroserviceName = "gateTunnelConnection"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-GateTunnel-java-spring/documentation/v5.3.0/GateTunnel-v5.3.0-gateTunnelConnection-HTTP-IDD.tex"; }
        attribute basePath : String = "/gatetunnel";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address gatetunnel, port 8453 and base path /gatetunnel. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
connect-provider & POST & /connect_provider \\ \hline
connect-consumer & POST & /connect_consumer \\ \hline
close-sessions & POST & /close_sessions \\ \hline
open-provider-session & POST & /intercloud/provider \\ \hline
open-consumer-session & POST & /intercloud/consumer \\ \hline
\end{longtable}

\newpage */
        doc /* connect-provider: POST /gatetunnel/connect_provider. Input: final; output: ResponseEntity<Map<String, Object>>.  */
        in item 'connect-providerRequest' : JSONMessage[0..1];
        out item 'connect-providerResponse' : JSONMessage[0..1];
        doc /* connect-consumer: POST /gatetunnel/connect_consumer. Input: final; output: ResponseEntity<Map<String, Object>>.  */
        in item 'connect-consumerRequest' : JSONMessage[0..1];
        out item 'connect-consumerResponse' : JSONMessage[0..1];
        doc /* close-sessions: POST /gatetunnel/close_sessions. Input: final; output: ResponseEntity<List<Object>>.  */
        in item 'close-sessionsRequest' : JSONMessage[0..1];
        out item 'close-sessionsResponse' : JSONMessage[0..*];
        doc /* open-provider-session: POST /gatetunnel/intercloud/provider. Input: final; output: ResponseEntity<Map<String, Object>>.  */
        in item 'open-provider-sessionRequest' : JSONMessage[0..1];
        out item 'open-provider-sessionResponse' : JSONMessage[0..1];
        doc /* open-consumer-session: POST /gatetunnel/intercloud/consumer. Input: final; output: ResponseEntity<Map<String, Object>>.  */
        in item 'open-consumer-sessionRequest' : JSONMessage[0..1];
        out item 'open-consumer-sessionResponse' : JSONMessage[0..1];
    }
    port def GateTunnel_gateTunnelConnection_HTTP_IDD_Implementation :> GateTunnel_gateTunnelConnection_HTTP_IDD { @IDD_Implementation; }
    action def 'GateTunnel_gateTunnelConnection_http_connect-provider_0' {
        doc /* Operation connect-provider. Wire method: POST; address: /gatetunnel/connect_provider. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/gatetunnel/connect_provider"; requestType = "final"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'GateTunnel_gateTunnelConnection_http_connect-consumer_1' {
        doc /* Operation connect-consumer. Wire method: POST; address: /gatetunnel/connect_consumer. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/gatetunnel/connect_consumer"; requestType = "final"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'GateTunnel_gateTunnelConnection_http_close-sessions_2' {
        doc /* Operation close-sessions. Wire method: POST; address: /gatetunnel/close_sessions. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/gatetunnel/close_sessions"; requestType = "final"; responseType = "ResponseEntity<List<Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : JSONMessage[0..*];
    }
    action def 'GateTunnel_gateTunnelConnection_http_open-provider-session_3' {
        doc /* Operation open-provider-session. Wire method: POST; address: /gatetunnel/intercloud/provider. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/gatetunnel/intercloud/provider"; requestType = "final"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'GateTunnel_gateTunnelConnection_http_open-consumer-session_4' {
        doc /* Operation open-consumer-session. Wire method: POST; address: /gatetunnel/intercloud/consumer. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/gatetunnel/intercloud/consumer"; requestType = "final"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    port def GateTunnel_gateTunnelKey_SD :> ArrowheadService {
        @SD { MicroserviceName = "gateTunnelKey"; }
        doc /* Service version 1.0.0. Source: ah5-GateTunnel-java-spring/documentation/v5.3.0/GateTunnel-v5.3.0-SysD.tex */
    }
    port def GateTunnel_gateTunnelKey_HTTP_IDD :> GateTunnel_gateTunnelKey_SD {
        @IDD { MicroserviceName = "gateTunnelKey"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-GateTunnel-java-spring/documentation/v5.3.0/GateTunnel-v5.3.0-gateTunnelKey-HTTP-IDD.tex"; }
        attribute basePath : String = "/gatetunnel";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address gatetunnel, port 8453 and base path /gatetunnel. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
public-key & GET & /publickey \\ \hline
\end{longtable}

\newpage */
        doc /* public-key: GET /gatetunnel/publickey. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'public-keyResponse' : JSONMessage[0..1];
    }
    port def GateTunnel_gateTunnelKey_HTTP_IDD_Implementation :> GateTunnel_gateTunnelKey_HTTP_IDD { @IDD_Implementation; }
    action def 'GateTunnel_gateTunnelKey_http_public-key_0' {
        doc /* Operation public-key. Wire method: GET; address: /gatetunnel/publickey. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/gatetunnel/publickey"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    port def GateTunnel_gateTunnelManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "gateTunnelManagement"; }
        doc /* Service version 1.0.0. Source: ah5-GateTunnel-java-spring/documentation/v5.3.0/GateTunnel-v5.3.0-SysD.tex */
    }
    port def GateTunnel_gateTunnelManagement_HTTP_IDD :> GateTunnel_gateTunnelManagement_SD {
        @IDD { MicroserviceName = "gateTunnelManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-GateTunnel-java-spring/documentation/v5.3.0/GateTunnel-v5.3.0-gateTunnelManagement-HTTP-IDD.tex"; }
        attribute basePath : String = "/gatetunnel";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address gatetunnel, port 8453 and base path /gatetunnel. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
sessions & GET & /mgmt/sessions \\ \hline
close & POST & /mgmt/sessions/close \\ \hline
status & GET & /mgmt/status \\ \hline
\end{longtable}

\newpage */
        doc /* sessions: GET /gatetunnel/mgmt/sessions. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'sessionsResponse' : JSONMessage[0..1];
        doc /* close: POST /gatetunnel/mgmt/sessions/close. Input: final; output: ResponseEntity<Map<String, Object>>.  */
        in item 'closeRequest' : JSONMessage[0..1];
        out item 'closeResponse' : JSONMessage[0..1];
        doc /* status: GET /gatetunnel/mgmt/status. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'statusResponse' : JSONMessage[0..1];
    }
    port def GateTunnel_gateTunnelManagement_HTTP_IDD_Implementation :> GateTunnel_gateTunnelManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'GateTunnel_gateTunnelManagement_http_sessions_0' {
        doc /* Operation sessions. Wire method: GET; address: /gatetunnel/mgmt/sessions. Query parameters: [{"name": "limit", "type": "String", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/gatetunnel/mgmt/sessions"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[{\"name\": \"limit\", \"type\": \"String\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'GateTunnel_gateTunnelManagement_http_close_1' {
        doc /* Operation close. Wire method: POST; address: /gatetunnel/mgmt/sessions/close. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/gatetunnel/mgmt/sessions/close"; requestType = "final"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'GateTunnel_gateTunnelManagement_http_status_2' {
        doc /* Operation status. Wire method: GET; address: /gatetunnel/mgmt/status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/gatetunnel/mgmt/status"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    port def GateTunnel_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-GateTunnel-java-spring/documentation/v5.3.0/GateTunnel-v5.3.0-SysD.tex */
    }
    port def GateTunnel_sysMonitor_AMQP_IDD :> GateTunnel_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-GateTunnel-java-spring/documentation/v5.3.0/GateTunnel-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.GateTunnel.GateTunnel";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, GateTunnel registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
      "status"
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
        "baseRoutingKey": "TestCloud.sysmonitor.GateTunnel.GateTunnel",
        "operations": [
          "echo",
          "power",
          "status"
        ]
      }
    }
  ]
}
\end{lstlisting} */
        doc /* echo: PUBLISH <Cloud>.sysmonitor.GateTunnel.GateTunnel.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadGateTunnelData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.GateTunnel.GateTunnel.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadGateTunnelData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.GateTunnel.GateTunnel.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadGateTunnelData::'Observation'[0..1];
    }
    port def GateTunnel_sysMonitor_AMQP_IDD_Implementation :> GateTunnel_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'GateTunnel_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.GateTunnel.GateTunnel.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.GateTunnel.GateTunnel.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGateTunnelData::'Observation'[0..1];
    }
    action def 'GateTunnel_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.GateTunnel.GateTunnel.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.GateTunnel.GateTunnel.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGateTunnelData::'Observation'[0..1];
    }
    action def 'GateTunnel_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.GateTunnel.GateTunnel.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.GateTunnel.GateTunnel.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGateTunnelData::'Observation'[0..1];
    }
    part def GateTunnel_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "GateTunnel"; FunctionalProperties = "This document describes the GateTunnel support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-GateTunnel-java-spring with an independent local-cloud deployment definition in its own folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-GateTunnel-java-spring/documentation/v5.3.0/GateTunnel-v5.3.0-SysD.tex"; }
        doc /* This document describes the GateTunnel support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-GateTunnel-java-spring with an independent local-cloud deployment definition in its own folder.
  \end{abstract} */
        port 'gateTunnelConnection_SD' : GateTunnel_gateTunnelConnection_SD { @FullPort; }
        port 'gateTunnelKey_SD' : GateTunnel_gateTunnelKey_SD { @FullPort; }
        port 'gateTunnelManagement_SD' : GateTunnel_gateTunnelManagement_SD { @FullPort; }
        port 'sysMonitor_SD' : GateTunnel_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, Providers, Relay (MQTT), ServiceRegistry. These are external requirements, not assumed co-deployments. */
    }
    part def GateTunnel_SysDD :> GateTunnel_SysD {
        @SysDD;
        port 'gateTunnelConnection_http' : GateTunnel_gateTunnelConnection_HTTP_IDD { @FullPort; }
        port 'gateTunnelKey_http' : GateTunnel_gateTunnelKey_HTTP_IDD { @FullPort; }
        port 'gateTunnelManagement_http' : GateTunnel_gateTunnelManagement_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : GateTunnel_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def GateTunnel :> GateTunnel_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8453;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'GateTunnel_Unregistered_0' { doc /* Unregistered HTTP endpoint; POST /gateway/connect_provider; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelConnectionAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/gateway/connect_provider"; } }
    action def 'GateTunnel_Unregistered_1' { doc /* Unregistered HTTP endpoint; POST /connect_provider; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelConnectionAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/connect_provider"; } }
    action def 'GateTunnel_Unregistered_2' { doc /* Unregistered HTTP endpoint; POST /gateway/connect_consumer; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelConnectionAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/gateway/connect_consumer"; } }
    action def 'GateTunnel_Unregistered_3' { doc /* Unregistered HTTP endpoint; POST /connect_consumer; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelConnectionAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/connect_consumer"; } }
    action def 'GateTunnel_Unregistered_4' { doc /* Unregistered HTTP endpoint; POST /gateway/close_sessions; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelConnectionAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/gateway/close_sessions"; } }
    action def 'GateTunnel_Unregistered_5' { doc /* Unregistered HTTP endpoint; POST /close_sessions; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelConnectionAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/close_sessions"; } }
    action def 'GateTunnel_Unregistered_6' { doc /* Unregistered HTTP endpoint; POST /gateway/intercloud/provider; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelConnectionAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/gateway/intercloud/provider"; } }
    action def 'GateTunnel_Unregistered_7' { doc /* Unregistered HTTP endpoint; POST /intercloud/provider; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelConnectionAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/intercloud/provider"; } }
    action def 'GateTunnel_Unregistered_8' { doc /* Unregistered HTTP endpoint; POST /gateway/intercloud/consumer; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelConnectionAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/gateway/intercloud/consumer"; } }
    action def 'GateTunnel_Unregistered_9' { doc /* Unregistered HTTP endpoint; POST /intercloud/consumer; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelConnectionAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/intercloud/consumer"; } }
    action def 'GateTunnel_Unregistered_10' { doc /* Unregistered HTTP endpoint; GET /gateway/publickey; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelKeyAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gateway/publickey"; } }
    action def 'GateTunnel_Unregistered_11' { doc /* Unregistered HTTP endpoint; GET /publickey; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelKeyAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/publickey"; } }
    action def 'GateTunnel_Unregistered_12' { doc /* Unregistered HTTP endpoint; GET /gateway/mgmt/sessions; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelManagementAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gateway/mgmt/sessions"; } }
    action def 'GateTunnel_Unregistered_13' { doc /* Unregistered HTTP endpoint; GET /mgmt/sessions; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelManagementAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/mgmt/sessions"; } }
    action def 'GateTunnel_Unregistered_14' { doc /* Unregistered HTTP endpoint; POST /gateway/mgmt/sessions/close; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelManagementAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/gateway/mgmt/sessions/close"; } }
    action def 'GateTunnel_Unregistered_15' { doc /* Unregistered HTTP endpoint; POST /mgmt/sessions/close; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelManagementAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/mgmt/sessions/close"; } }
    action def 'GateTunnel_Unregistered_16' { doc /* Unregistered HTTP endpoint; GET /gateway/mgmt/status; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelManagementAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gateway/mgmt/status"; } }
    action def 'GateTunnel_Unregistered_17' { doc /* Unregistered HTTP endpoint; GET /mgmt/status; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GateTunnelManagementAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/mgmt/status"; } }
    action def 'GateTunnel_Unregistered_18' { doc /* Unregistered HTTP endpoint; GET /gatetunnel/mgmt/general/status; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GeneralManagementAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gatetunnel/mgmt/general/status"; } }
    action def 'GateTunnel_Unregistered_19' { doc /* Unregistered HTTP endpoint; POST /gatetunnel/mgmt/general/logs; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GeneralManagementAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/gatetunnel/mgmt/general/logs"; } }
    action def 'GateTunnel_Unregistered_20' { doc /* Unregistered HTTP endpoint; GET /gatetunnel/mgmt/general/get-config; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/GeneralManagementAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gatetunnel/mgmt/general/get-config"; } }
    action def 'GateTunnel_Unregistered_21' { doc /* Unregistered HTTP endpoint; GET /gatetunnel/echo; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gatetunnel/echo"; } }
    action def 'GateTunnel_Unregistered_22' { doc /* Unregistered HTTP endpoint; GET /health; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/health"; } }
    action def 'GateTunnel_Unregistered_23' { doc /* Unregistered HTTP endpoint; GET /gatetunnel/monitor/echo; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gatetunnel/monitor/echo"; } }
    action def 'GateTunnel_Unregistered_24' { doc /* Unregistered HTTP endpoint; GET /gateway/echo; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gateway/echo"; } }
    action def 'GateTunnel_Unregistered_25' { doc /* Unregistered HTTP endpoint; GET /gateway/monitor/echo; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gateway/monitor/echo"; } }
    action def 'GateTunnel_Unregistered_26' { doc /* Unregistered HTTP endpoint; GET /echo; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/echo"; } }
    action def 'GateTunnel_Unregistered_27' { doc /* Unregistered HTTP endpoint; GET /monitor/echo; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/monitor/echo"; } }
    action def 'GateTunnel_Unregistered_28' { doc /* Unregistered HTTP endpoint; GET /certificate-authority/health; source ah5-GateTunnel-java-spring/src/main/java/eu/arrowhead/gatetunnel/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/certificate-authority/health"; } }
}
