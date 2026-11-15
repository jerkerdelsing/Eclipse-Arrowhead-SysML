library package ArrowheadSysMonitor {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def SysMonitor_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-SysMonitor-java-spring/documentation/v5.3.0/SysMonitor-v5.3.0-SysD.tex */
    }
    port def SysMonitor_generalManagement_HTTP_IDD :> SysMonitor_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-SysMonitor-java-spring/src/main/java/eu/arrowhead/sysmonitor/SysMonitorSystemInfo.java"; }
        attribute basePath : String = "/sysmonitor/mgmt/general";
        doc /* status: GET /sysmonitor/mgmt/general/status. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'statusResponse' : JSONMessage[0..1];
        doc /* get-log: POST /sysmonitor/mgmt/general/logs. Input: LogRequestDTO; output: LogEntryListResponseDTO.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
        doc /* get-config: GET /sysmonitor/mgmt/general/get-config. Input: None; output: KeyValuesDTO.  */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def SysMonitor_generalManagement_HTTP_IDD_Implementation :> SysMonitor_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'SysMonitor_generalManagement_http_status_0' {
        doc /* Operation status. Wire method: GET; address: /sysmonitor/mgmt/general/status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/sysmonitor/mgmt/general/status"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SysMonitor_generalManagement_http_get-log_1' {
        doc /* Operation get-log. Wire method: POST; address: /sysmonitor/mgmt/general/logs. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/sysmonitor/mgmt/general/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'SysMonitor_generalManagement_http_get-config_2' {
        doc /* Operation get-config. Wire method: GET; address: /sysmonitor/mgmt/general/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/sysmonitor/mgmt/general/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def SysMonitor_sysMonitorManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitorManagement"; }
        doc /* Service version 1.0.0. Source: ah5-SysMonitor-java-spring/documentation/v5.3.0/SysMonitor-v5.3.0-SysD.tex */
    }
    port def SysMonitor_sysMonitorManagement_HTTP_IDD :> SysMonitor_sysMonitorManagement_SD {
        @IDD { MicroserviceName = "sysMonitorManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-SysMonitor-java-spring/documentation/v5.3.0/SysMonitor-v5.3.0-sysMonitorManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/sysmonitor/management";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address sysmonitor, port 8475 and base path /sysmonitor/management. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
status & GET & /status \\ \hline
providers & GET & /providers \\ \hline
subscriptions & GET & /subscriptions \\ \hline
subscribe & PUT & \texttt{/subscriptions/{providerSystem}} \\ \hline
unsubscribe & DELETE & \texttt{/subscriptions/{providerSystem}} \\ \hline
reconcile & POST & /reconcile \\ \hline
\end{longtable}

\newpage */
        doc /* status: GET /sysmonitor/management/status. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'statusResponse' : JSONMessage[0..1];
        doc /* providers: GET /sysmonitor/management/providers. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'providersResponse' : JSONMessage[0..1];
        doc /* subscriptions: GET /sysmonitor/management/subscriptions. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'subscriptionsResponse' : JSONMessage[0..1];
        doc /* subscribe: PUT /sysmonitor/management/subscriptions/{providerSystem}. Input: String; output: ResponseEntity<Map<String, Object>>.  */
        in attribute 'subscribeRequest' : ScalarValues::String[0..1];
        out item 'subscribeResponse' : JSONMessage[0..1];
        doc /* unsubscribe: DELETE /sysmonitor/management/subscriptions/{providerSystem}. Input: None; output: ResponseEntity<Void>.  */
        doc /* reconcile: POST /sysmonitor/management/reconcile. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'reconcileResponse' : JSONMessage[0..1];
    }
    port def SysMonitor_sysMonitorManagement_HTTP_IDD_Implementation :> SysMonitor_sysMonitorManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'SysMonitor_sysMonitorManagement_http_status_0' {
        doc /* Operation status. Wire method: GET; address: /sysmonitor/management/status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/sysmonitor/management/status"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SysMonitor_sysMonitorManagement_http_providers_1' {
        doc /* Operation providers. Wire method: GET; address: /sysmonitor/management/providers. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/sysmonitor/management/providers"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SysMonitor_sysMonitorManagement_http_subscriptions_2' {
        doc /* Operation subscriptions. Wire method: GET; address: /sysmonitor/management/subscriptions. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/sysmonitor/management/subscriptions"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SysMonitor_sysMonitorManagement_http_subscribe_3' {
        doc /* Operation subscribe. Wire method: PUT; address: /sysmonitor/management/subscriptions/{providerSystem}. Query parameters: []. Path parameters: ["providerSystem"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/sysmonitor/management/subscriptions/{providerSystem}"; requestType = "String"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[\"providerSystem\"]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SysMonitor_sysMonitorManagement_http_unsubscribe_4' {
        doc /* Operation unsubscribe. Wire method: DELETE; address: /sysmonitor/management/subscriptions/{providerSystem}. Query parameters: []. Path parameters: ["providerSystem"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/sysmonitor/management/subscriptions/{providerSystem}"; requestType = "unspecified"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"providerSystem\"]"; statusCodes = "[]"; }
    }
    action def 'SysMonitor_sysMonitorManagement_http_reconcile_5' {
        doc /* Operation reconcile. Wire method: POST; address: /sysmonitor/management/reconcile. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/sysmonitor/management/reconcile"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    port def SysMonitor_sysMonitorHistory_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitorHistory"; }
        doc /* Service version 1.0.0. Source: ah5-SysMonitor-java-spring/documentation/v5.3.0/SysMonitor-v5.3.0-SysD.tex */
    }
    port def SysMonitor_sysMonitorHistory_HTTP_IDD :> SysMonitor_sysMonitorHistory_SD {
        @IDD { MicroserviceName = "sysMonitorHistory"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-SysMonitor-java-spring/documentation/v5.3.0/SysMonitor-v5.3.0-sysMonitorHistory-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/sysmonitor/history";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address sysmonitor, port 8475 and base path /sysmonitor/history. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
list-systems & GET & /systems \\ \hline
query & GET & \texttt{/systems/{systemName}/observations} \\ \hline
latest & GET & \texttt{/systems/{systemName}/latest} \\ \hline
\end{longtable}

\newpage */
        doc /* list-systems: GET /sysmonitor/history/systems. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'list-systemsResponse' : JSONMessage[0..1];
        doc /* query: GET /sysmonitor/history/systems/{systemName}/observations. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'queryResponse' : JSONMessage[0..1];
        doc /* latest: GET /sysmonitor/history/systems/{systemName}/latest. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'latestResponse' : JSONMessage[0..1];
    }
    port def SysMonitor_sysMonitorHistory_HTTP_IDD_Implementation :> SysMonitor_sysMonitorHistory_HTTP_IDD { @IDD_Implementation; }
    action def 'SysMonitor_sysMonitorHistory_http_list-systems_0' {
        doc /* Operation list-systems. Wire method: GET; address: /sysmonitor/history/systems. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/sysmonitor/history/systems"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SysMonitor_sysMonitorHistory_http_query_1' {
        doc /* Operation query. Wire method: GET; address: /sysmonitor/history/systems/{systemName}/observations. Query parameters: [{"name": "count", "type": "String", "required": false, "default": "100"}, {"name": "type", "type": "List<String>", "required": false, "default": null}, {"name": "from", "type": "String", "required": false, "default": null}, {"name": "to", "type": "String", "required": false, "default": null}]. Path parameters: ["systemName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/sysmonitor/history/systems/{systemName}/observations"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[{\"name\": \"count\", \"type\": \"String\", \"required\": false, \"default\": \"100\"}, {\"name\": \"type\", \"type\": \"List<String>\", \"required\": false, \"default\": null}, {\"name\": \"from\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"to\", \"type\": \"String\", \"required\": false, \"default\": null}]"; pathParameters = "[\"systemName\"]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SysMonitor_sysMonitorHistory_http_latest_2' {
        doc /* Operation latest. Wire method: GET; address: /sysmonitor/history/systems/{systemName}/latest. Query parameters: []. Path parameters: ["systemName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/sysmonitor/history/systems/{systemName}/latest"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[\"systemName\"]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    port def SysMonitor_sysMonitorData_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitorData"; }
        doc /* Service version 1.0.0. Source: ah5-SysMonitor-java-spring/documentation/v5.3.0/SysMonitor-v5.3.0-SysD.tex */
    }
    port def SysMonitor_sysMonitorData_MQTT_IDD :> SysMonitor_sysMonitorData_SD {
        @IDD { MicroserviceName = "sysMonitorData"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-SysMonitor-java-spring/documentation/v5.3.0/SysMonitor-v5.3.0-sysMonitorData-MQTT-IDD.tex"; }
        attribute templateName : String = "generic_mqtts";
        attribute protocol : String = "ssl";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 8883;
        attribute 'baseTopic' : String = "arrowhead/TestCloud/sysmonitor/data";
        doc /* Registration (source documentation): \begin{lstlisting}[caption={Registered service instance (TestCloud).}]
{
  "serviceDefinitionName": "sysMonitorData",
  "version": "1.0.0",
  "metadata": {
    "contract": "SysMonitor-Data-MQTT-IDD-5.2.2",
    "schemaVersion": "1.0"
  },
  "interfaces": [
    {
      "templateName": "generic_mqtts",
      "protocol": "ssl",
      "policy": "CERT_AUTH",
      "properties": {
        "accessAddresses": [
          "mqtt-broker"
        ],
        "accessPort": 8883,
        "baseTopic": "arrowhead/TestCloud/sysmonitor/data",
        "operations": [
          "subscribe"
        ]
      }
    }
  ]
}
\end{lstlisting} */
        doc /* subscribe: SUBSCRIBE <baseTopic>/<observationType>/<providerSystem>. Input: None; output: StoredObservation.  */
        out item 'subscribeResponse' : ArrowheadSysMonitorData::'StoredObservation'[0..1];
    }
    port def SysMonitor_sysMonitorData_MQTT_IDD_Implementation :> SysMonitor_sysMonitorData_MQTT_IDD { @IDD_Implementation; }
    action def 'SysMonitor_sysMonitorData_mqtt_subscribe_0' {
        doc /* Operation subscribe. Wire method: SUBSCRIBE; address: <baseTopic>/<observationType>/<providerSystem>. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "SUBSCRIBE"; address = "<baseTopic>/<observationType>/<providerSystem>"; requestType = "unspecified"; responseType = "StoredObservation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadSysMonitorData::'StoredObservation'[0..1];
    }
    port def SysMonitor_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-SysMonitor-java-spring/documentation/v5.3.0/SysMonitor-v5.3.0-SysD.tex */
    }
    port def SysMonitor_sysMonitor_AMQP_IDD :> SysMonitor_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-SysMonitor-java-spring/documentation/v5.3.0/SysMonitor-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.SysMonitor.SysMonitor";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, SysMonitor registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.SysMonitor.SysMonitor",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.SysMonitor.SysMonitor.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadSysMonitorData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.SysMonitor.SysMonitor.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadSysMonitorData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.SysMonitor.SysMonitor.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadSysMonitorData::'Observation'[0..1];
    }
    port def SysMonitor_sysMonitor_AMQP_IDD_Implementation :> SysMonitor_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'SysMonitor_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.SysMonitor.SysMonitor.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.SysMonitor.SysMonitor.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadSysMonitorData::'Observation'[0..1];
    }
    action def 'SysMonitor_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.SysMonitor.SysMonitor.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.SysMonitor.SysMonitor.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadSysMonitorData::'Observation'[0..1];
    }
    action def 'SysMonitor_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.SysMonitor.SysMonitor.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.SysMonitor.SysMonitor.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadSysMonitorData::'Observation'[0..1];
    }
    part def SysMonitor_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "SysMonitor"; FunctionalProperties = "This document describes the SysMonitor support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-SysMonitor-java-spring with an independent local-cloud deployment definition in its own folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-SysMonitor-java-spring/documentation/v5.3.0/SysMonitor-v5.3.0-SysD.tex"; }
        doc /* This document describes the SysMonitor support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-SysMonitor-java-spring with an independent local-cloud deployment definition in its own folder.
  \end{abstract} */
        port 'generalManagement_SD' : SysMonitor_generalManagement_SD { @FullPort; }
        port 'sysMonitorManagement_SD' : SysMonitor_sysMonitorManagement_SD { @FullPort; }
        port 'sysMonitorHistory_SD' : SysMonitor_sysMonitorHistory_SD { @FullPort; }
        port 'sysMonitorData_SD' : SysMonitor_sysMonitorData_SD { @FullPort; }
        port 'sysMonitor_SD' : SysMonitor_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker, Authentication, ConsumerAuthorization, DynamicServiceOrchestration, MQTT broker, ServiceRegistry. These are external requirements, not assumed co-deployments. */
    }
    part def SysMonitor_SysDD :> SysMonitor_SysD {
        @SysDD;
        port 'generalManagement_http' : SysMonitor_generalManagement_HTTP_IDD { @FullPort; }
        port 'sysMonitorManagement_http' : SysMonitor_sysMonitorManagement_HTTP_IDD { @FullPort; }
        port 'sysMonitorHistory_http' : SysMonitor_sysMonitorHistory_HTTP_IDD { @FullPort; }
        port 'sysMonitorData_mqtt' : SysMonitor_sysMonitorData_MQTT_IDD[0..1] { @FullPort; }
        port 'sysMonitor_amqp' : SysMonitor_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def SysMonitor :> SysMonitor_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8475;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'SysMonitor_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /health; source ah5-SysMonitor-java-spring/src/main/java/eu/arrowhead/sysmonitor/api/http/HealthAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/health"; } }
}
