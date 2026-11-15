library package ArrowheadLocalCloudManager {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def LocalCloudManager_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-LocalCloudManager-java-spring/documentation/v5.3.0/LocalCloudManager-v5.3.0-SysD.tex */
    }
    port def LocalCloudManager_generalManagement_HTTP_IDD :> LocalCloudManager_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/LocalCloudManagerSystemInfo.java"; }
        attribute basePath : String = "/localcloudmanager/general/mgmt";
        doc /* get-config: GET /localcloudmanager/general/mgmt/get-config. Input: None; output: KeyValuesDTO.  */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def LocalCloudManager_generalManagement_HTTP_IDD_Implementation :> LocalCloudManager_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'LocalCloudManager_generalManagement_http_get-config_0' {
        doc /* Operation get-config. Wire method: GET; address: /localcloudmanager/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/localcloudmanager/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def LocalCloudManager_localCloudManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "localCloudManagement"; }
        doc /* Service version 1.0.0. Source: ah5-LocalCloudManager-java-spring/documentation/v5.3.0/LocalCloudManager-v5.3.0-SysD.tex */
    }
    port def LocalCloudManager_localCloudManagement_HTTP_IDD :> LocalCloudManager_localCloudManagement_SD {
        @IDD { MicroserviceName = "localCloudManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-LocalCloudManager-java-spring/documentation/v5.3.0/LocalCloudManager-v5.3.0-localCloudManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/api";
        doc /* Registration (source documentation): LocalCloudManager listens on two connectors. The Arrowhead connector (port 8491, HTTPS with mutual TLS) is registered in the ServiceRegistry with the interface template generic_https and policy CERT_AUTH, base path /api. The console connector (port 8490, plain HTTP, published on the host's loopback address only) serves the browser console with the same routes plus the console-only ones; it is not registered. The operations property lists the operations below with their method and path relative to the base path (path values are appended to the registered path):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
overview & GET & /overview \\ \hline
serviceRegistryManagement & GET & /service-registry-management \\ \hline
dataManager & GET & /datamanager \\ \hline
consumers & GET & /consumers \\ \hline
interCloud & GET & /intercloud \\ \hline
sysMonitorHistory & GET & /sysmonitor \\ \hline
sysMonitorSubscriptions & GET & /sysmonitor/subscriptions \\ \hline
subscribeSysMonitor & PUT & /sysmonitor/subscriptions \\ \hline
unsubscribeSysMonitor & DELETE & /sysmonitor/subscriptions \\ \hline
plantDescriptions & GET & /plantdescriptions \\ \hline
createPlantDescription & POST & /plantdescriptions \\ \hline
replacePlantDescription & PUT & /plantdescriptions \\ \hline
updatePlantDescription & PATCH & /plantdescriptions \\ \hline
removePlantDescription & DELETE & /plantdescriptions \\ \hline
orchestrationRules & GET & /orchestration/rules \\ \hline
createOrchestrationRule & POST & /orchestration/rules \\ \hline
removeOrchestrationRule & DELETE & /orchestration/rules \\ \hline
logs & GET & /logs \\ \hline
lifecycle & POST & /containers \\ \hline
\end{longtable}

generalManagement is registered separately (base path /localcloudmanager/general/mgmt, operation get-config, GET /get-config?keys=\ldots, Sysop only).

\subsection{Access}

\textbf{Arrowhead connector (8491).} A request needs the caller's client certificate and Authorization: Bearer IDENTITY-TOKEN//<token> of the same system (common outsourced authentication filter; 401 otherwise, with the common error body \texttt{{"errorMessage", "errorCode", "exceptionType", "origin"}}). A registered operation is allowed for Sysop, the systems of lcm.api.whitelist and systems with a ConsumerAuthorization grant of the operation (403 otherwise); other /api paths only for Sysop and the whitelist. The console-only paths (/api/session, /health, the UI) are 404 there.

\begin{lstlisting}[label={lst:arrowhead},caption={An invocation on the Arrowhead connector.}]
GET /api/overview HTTP/1.1
Host: cloud-monitor-api:8491
Authorization: Bearer IDENTITY-TOKEN//<identity token>
\end{lstlisting}

\textbf{Console connector (8490).} Host and Origin must be allowed console names (403 "Host or Origin is not an allowed console address"; Origin null is refused); with a configured proxy secret, /api requests must carry X-Console-Proxy (403 "Not forwarded by the console"); without a configured password every /api request is 503. Every /api route except /api/session needs the session cookie ah_console (401 "Console login required"). Other paths serve the static console (index.html for unknown paths). Responses carry X-Frame-Options: DENY, Content-Security-Policy: frame-ancestors 'none', X-Content-Type-Options: nosniff and Referrer-Policy: no-referrer.

\newpage */
        doc /* overview: GET /api/overview. Input: None; output: View.  */
        out item 'overviewResponse' : ArrowheadLocalCloudManagerData::'View'[0..1];
        doc /* serviceRegistryManagement: GET /api/service-registry-management. Input: None; output: View.  */
        out item 'serviceRegistryManagementResponse' : ArrowheadLocalCloudManagerData::'View'[0..1];
        doc /* dataManager: GET /api/datamanager. Input: None; output: View.  */
        out item 'dataManagerResponse' : ArrowheadLocalCloudManagerData::'View'[0..1];
        doc /* consumers: GET /api/consumers. Input: None; output: View.  */
        out item 'consumersResponse' : ArrowheadLocalCloudManagerData::'View'[0..1];
        doc /* interCloud: GET /api/intercloud. Input: None; output: View.  */
        out item 'interCloudResponse' : ArrowheadLocalCloudManagerData::'View'[0..1];
        doc /* sysMonitorHistory: GET /api/sysmonitor. Input: None; output: View.  */
        out item 'sysMonitorHistoryResponse' : ArrowheadLocalCloudManagerData::'View'[0..1];
        doc /* sysMonitorSubscriptions: GET /api/sysmonitor/subscriptions. Input: None; output: View.  */
        out item 'sysMonitorSubscriptionsResponse' : ArrowheadLocalCloudManagerData::'View'[0..1];
        doc /* subscribeSysMonitor: PUT /api/sysmonitor/subscriptions. Input: SysMonitorSubscriptionRequest; output: View.  */
        in item 'subscribeSysMonitorRequest' : ArrowheadLocalCloudManagerData::'SysMonitorSubscriptionRequest'[0..1];
        out item 'subscribeSysMonitorResponse' : ArrowheadLocalCloudManagerData::'View'[0..1];
        doc /* unsubscribeSysMonitor: DELETE /api/sysmonitor/subscriptions. Input: None; output: Removal.  */
        out item 'unsubscribeSysMonitorResponse' : ArrowheadLocalCloudManagerData::'Removal'[0..1];
        doc /* plantDescriptions: GET /api/plantdescriptions. Input: None; output: View.  */
        out item 'plantDescriptionsResponse' : ArrowheadLocalCloudManagerData::'View'[0..1];
        doc /* createPlantDescription: POST /api/plantdescriptions. Input: PlantDescription; output: PlantDescription.  */
        in item 'createPlantDescriptionRequest' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
        out item 'createPlantDescriptionResponse' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
        doc /* replacePlantDescription: PUT /api/plantdescriptions. Input: PlantDescription; output: PlantDescription.  */
        in item 'replacePlantDescriptionRequest' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
        out item 'replacePlantDescriptionResponse' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
        doc /* updatePlantDescription: PATCH /api/plantdescriptions. Input: PlantDescription; output: PlantDescription.  */
        in item 'updatePlantDescriptionRequest' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
        out item 'updatePlantDescriptionResponse' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
        doc /* removePlantDescription: DELETE /api/plantdescriptions. Input: None; output: Removal.  */
        out item 'removePlantDescriptionResponse' : ArrowheadLocalCloudManagerData::'Removal'[0..1];
        doc /* orchestrationRules: GET /api/orchestration/rules. Input: None; output: View.  */
        out item 'orchestrationRulesResponse' : ArrowheadLocalCloudManagerData::'View'[0..1];
        doc /* createOrchestrationRule: POST /api/orchestration/rules. Input: OrchestrationRule; output: View.  */
        in item 'createOrchestrationRuleRequest' : ArrowheadLocalCloudManagerData::'OrchestrationRule'[0..1];
        out item 'createOrchestrationRuleResponse' : ArrowheadLocalCloudManagerData::'View'[0..1];
        doc /* removeOrchestrationRule: DELETE /api/orchestration/rules. Input: None; output: Removal.  */
        out item 'removeOrchestrationRuleResponse' : ArrowheadLocalCloudManagerData::'Removal'[0..1];
        doc /* logs: GET /api/logs. Input: None; output: LogLines.  */
        out item 'logsResponse' : ArrowheadLocalCloudManagerData::'LogLines'[0..1];
        doc /* lifecycle: POST /api/containers. Input: None; output: LifecycleResult.  */
        out item 'lifecycleResponse' : ArrowheadLocalCloudManagerData::'LifecycleResult'[0..1];
    }
    port def LocalCloudManager_localCloudManagement_HTTP_IDD_Implementation :> LocalCloudManager_localCloudManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'LocalCloudManager_localCloudManagement_http_overview_0' {
        doc /* Operation overview. Wire method: GET; address: /api/overview. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/overview"; requestType = "unspecified"; responseType = "View"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'View'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_serviceRegistryManagement_1' {
        doc /* Operation serviceRegistryManagement. Wire method: GET; address: /api/service-registry-management. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/service-registry-management"; requestType = "unspecified"; responseType = "View"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'View'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_dataManager_2' {
        doc /* Operation dataManager. Wire method: GET; address: /api/datamanager. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/datamanager"; requestType = "unspecified"; responseType = "View"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'View'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_consumers_3' {
        doc /* Operation consumers. Wire method: GET; address: /api/consumers. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/consumers"; requestType = "unspecified"; responseType = "View"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'View'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_interCloud_4' {
        doc /* Operation interCloud. Wire method: GET; address: /api/intercloud. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/intercloud"; requestType = "unspecified"; responseType = "View"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'View'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_sysMonitorHistory_5' {
        doc /* Operation sysMonitorHistory. Wire method: GET; address: /api/sysmonitor. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/sysmonitor"; requestType = "unspecified"; responseType = "View"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'View'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_sysMonitorSubscriptions_6' {
        doc /* Operation sysMonitorSubscriptions. Wire method: GET; address: /api/sysmonitor/subscriptions. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/sysmonitor/subscriptions"; requestType = "unspecified"; responseType = "View"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'View'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_subscribeSysMonitor_7' {
        doc /* Operation subscribeSysMonitor. Wire method: PUT; address: /api/sysmonitor/subscriptions. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/api/sysmonitor/subscriptions"; requestType = "SysMonitorSubscriptionRequest"; responseType = "View"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadLocalCloudManagerData::'SysMonitorSubscriptionRequest'[0..1];
        out item 'response' : ArrowheadLocalCloudManagerData::'View'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_unsubscribeSysMonitor_8' {
        doc /* Operation unsubscribeSysMonitor. Wire method: DELETE; address: /api/sysmonitor/subscriptions. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/api/sysmonitor/subscriptions"; requestType = "unspecified"; responseType = "Removal"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'Removal'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_plantDescriptions_9' {
        doc /* Operation plantDescriptions. Wire method: GET; address: /api/plantdescriptions. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/plantdescriptions"; requestType = "unspecified"; responseType = "View"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'View'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_createPlantDescription_10' {
        doc /* Operation createPlantDescription. Wire method: POST; address: /api/plantdescriptions. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/api/plantdescriptions"; requestType = "PlantDescription"; responseType = "PlantDescription"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
        out item 'response' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_replacePlantDescription_11' {
        doc /* Operation replacePlantDescription. Wire method: PUT; address: /api/plantdescriptions. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/api/plantdescriptions"; requestType = "PlantDescription"; responseType = "PlantDescription"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
        out item 'response' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_updatePlantDescription_12' {
        doc /* Operation updatePlantDescription. Wire method: PATCH; address: /api/plantdescriptions. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PATCH"; address = "/api/plantdescriptions"; requestType = "PlantDescription"; responseType = "PlantDescription"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
        out item 'response' : ArrowheadLocalCloudManagerData::'PlantDescription'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_removePlantDescription_13' {
        doc /* Operation removePlantDescription. Wire method: DELETE; address: /api/plantdescriptions. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/api/plantdescriptions"; requestType = "unspecified"; responseType = "Removal"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'Removal'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_orchestrationRules_14' {
        doc /* Operation orchestrationRules. Wire method: GET; address: /api/orchestration/rules. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/orchestration/rules"; requestType = "unspecified"; responseType = "View"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'View'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_createOrchestrationRule_15' {
        doc /* Operation createOrchestrationRule. Wire method: POST; address: /api/orchestration/rules. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/api/orchestration/rules"; requestType = "OrchestrationRule"; responseType = "View"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadLocalCloudManagerData::'OrchestrationRule'[0..1];
        out item 'response' : ArrowheadLocalCloudManagerData::'View'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_removeOrchestrationRule_16' {
        doc /* Operation removeOrchestrationRule. Wire method: DELETE; address: /api/orchestration/rules. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/api/orchestration/rules"; requestType = "unspecified"; responseType = "Removal"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'Removal'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_logs_17' {
        doc /* Operation logs. Wire method: GET; address: /api/logs. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/logs"; requestType = "unspecified"; responseType = "LogLines"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'LogLines'[0..1];
    }
    action def 'LocalCloudManager_localCloudManagement_http_lifecycle_18' {
        doc /* Operation lifecycle. Wire method: POST; address: /api/containers. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/api/containers"; requestType = "unspecified"; responseType = "LifecycleResult"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'LifecycleResult'[0..1];
    }
    port def LocalCloudManager_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-LocalCloudManager-java-spring/documentation/v5.3.0/LocalCloudManager-v5.3.0-SysD.tex */
    }
    port def LocalCloudManager_sysMonitor_AMQP_IDD :> LocalCloudManager_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-LocalCloudManager-java-spring/documentation/v5.3.0/LocalCloudManager-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.LocalCloudManager.LocalCloudManager";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, the common sysMonitor publisher of LocalCloudManager registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.LocalCloudManager.LocalCloudManager",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.LocalCloudManager.LocalCloudManager.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadLocalCloudManagerData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.LocalCloudManager.LocalCloudManager.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadLocalCloudManagerData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.LocalCloudManager.LocalCloudManager.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadLocalCloudManagerData::'Observation'[0..1];
    }
    port def LocalCloudManager_sysMonitor_AMQP_IDD_Implementation :> LocalCloudManager_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'LocalCloudManager_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.LocalCloudManager.LocalCloudManager.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.LocalCloudManager.LocalCloudManager.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'Observation'[0..1];
    }
    action def 'LocalCloudManager_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.LocalCloudManager.LocalCloudManager.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.LocalCloudManager.LocalCloudManager.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'Observation'[0..1];
    }
    action def 'LocalCloudManager_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.LocalCloudManager.LocalCloudManager.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.LocalCloudManager.LocalCloudManager.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudManagerData::'Observation'[0..1];
    }
    part def LocalCloudManager_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "LocalCloudManager"; FunctionalProperties = "This document describes the LocalCloudManager support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-LocalCloudManager-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) (Java-Spring with the vendored Eclipse Arrowhead common library) and deployed with the standalone Compose definition of that folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-LocalCloudManager-java-spring/documentation/v5.3.0/LocalCloudManager-v5.3.0-SysD.tex"; }
        doc /* This document describes the LocalCloudManager support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-LocalCloudManager-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) (Java-Spring with the vendored Eclipse Arrowhead common library) and deployed with the standalone Compose definition of that folder.
  \end{abstract} */
        port 'generalManagement_SD' : LocalCloudManager_generalManagement_SD { @FullPort; }
        port 'localCloudManagement_SD' : LocalCloudManager_localCloudManagement_SD { @FullPort; }
        port 'sysMonitor_SD' : LocalCloudManager_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: Authentication, ConsumerAuthorization, DataManager, Docker proxy, DynamicServiceOrchestration, Gatekeeper, GateTunnel, PlantDescriptionEngine, ServiceRegistry, SimpleStoreServiceOrchestration, SysMonitor, LocalCloudConfigurator, ChipletFloorplanGenerator (opt.). These are external requirements, not assumed co-deployments. */
    }
    part def LocalCloudManager_SysDD :> LocalCloudManager_SysD {
        @SysDD;
        port 'generalManagement_http' : LocalCloudManager_generalManagement_HTTP_IDD { @FullPort; }
        port 'localCloudManagement_http' : LocalCloudManager_localCloudManagement_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : LocalCloudManager_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def LocalCloudManager :> LocalCloudManager_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8491;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'LocalCloudManager_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /health; source ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/api/http/ConsoleApiController.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/health"; } }
    action def 'LocalCloudManager_Unregistered_1' { doc /* Unregistered HTTP endpoint; ANY /api/**; source ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/api/http/ConsoleApiController.java */ @WireOperation { protocol = "http"; method = "ANY"; address = "/api/**"; } }
}
