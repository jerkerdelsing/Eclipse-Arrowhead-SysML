library package ArrowheadBlacklist {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def Blacklist_blacklistDiscovery_SD :> ArrowheadService {
        @SD { MicroserviceName = "blacklistDiscovery"; }
        doc /* Service version 1.0.0. Source: ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-SysD.tex */
    }
    port def Blacklist_blacklistDiscovery_HTTP_IDD :> Blacklist_blacklistDiscovery_SD {
        @IDD { MicroserviceName = "blacklistDiscovery"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-blacklistDiscovery-HTTP-IDD.tex"; }
        attribute basePath : String = "/blacklist";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address blacklist, port 8464 and base path /blacklist. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
check & GET & \texttt{/check/{systemName}} \\ \hline
lookup & GET & /lookup \\ \hline
\end{longtable}

\newpage */
        doc /* check: GET /blacklist/check/{systemName}. Input: None; output: boolean.  */
        out attribute 'checkResponse' : ScalarValues::Boolean[0..1];
        doc /* lookup: GET /blacklist/lookup. Input: None; output: BlacklistEntryListResponseDTO.  */
        out item 'lookupResponse' : ArrowheadCoreData::'BlacklistEntryListResponseDTO'[0..1];
    }
    port def Blacklist_blacklistDiscovery_HTTP_IDD_Implementation :> Blacklist_blacklistDiscovery_HTTP_IDD { @IDD_Implementation; }
    action def 'Blacklist_blacklistDiscovery_http_check_0' {
        doc /* Operation check. Wire method: GET; address: /blacklist/check/{systemName}. Query parameters: []. Path parameters: ["systemName"]. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/blacklist/check/{systemName}"; requestType = "unspecified"; responseType = "boolean"; queryParameters = "[]"; pathParameters = "[\"systemName\"]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        out attribute 'response' : ScalarValues::Boolean[0..1];
    }
    action def 'Blacklist_blacklistDiscovery_http_lookup_1' {
        doc /* Operation lookup. Wire method: GET; address: /blacklist/lookup. Query parameters: []. Path parameters: []. Status codes: ["OK", "UNAUTHORIZED", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/blacklist/lookup"; requestType = "unspecified"; responseType = "BlacklistEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"UNAUTHORIZED\", \"INTERNAL_SERVER_ERROR\"]"; }
        out item 'response' : ArrowheadCoreData::'BlacklistEntryListResponseDTO'[0..1];
    }
    port def Blacklist_blacklistDiscovery_MQTT_IDD :> Blacklist_blacklistDiscovery_SD {
        @IDD { MicroserviceName = "blacklistDiscovery"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-blacklistDiscovery-MQTT-IDD.tex"; }
        doc /* check: PUBLISH arrowhead/blacklist/check. Input: String; output: Boolean.  */
        in attribute 'checkRequest' : ScalarValues::String[0..1];
        out attribute 'checkResponse' : ScalarValues::Boolean[0..1];
        doc /* lookup: PUBLISH arrowhead/blacklist/lookup. Input: None; output: BlacklistEntryListResponse.  */
        out item 'lookupResponse' : ArrowheadBlacklistData::'BlacklistEntryListResponse'[0..1];
    }
    port def Blacklist_blacklistDiscovery_MQTT_IDD_Implementation :> Blacklist_blacklistDiscovery_MQTT_IDD { @IDD_Implementation; }
    action def 'Blacklist_blacklistDiscovery_mqtt_check_0' {
        doc /* Operation check. Wire method: PUBLISH; address: arrowhead/blacklist/check. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "PUBLISH"; address = "arrowhead/blacklist/check"; requestType = "String"; responseType = "Boolean"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..1];
        out attribute 'response' : ScalarValues::Boolean[0..1];
    }
    action def 'Blacklist_blacklistDiscovery_mqtt_lookup_1' {
        doc /* Operation lookup. Wire method: PUBLISH; address: arrowhead/blacklist/lookup. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "PUBLISH"; address = "arrowhead/blacklist/lookup"; requestType = "unspecified"; responseType = "BlacklistEntryListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadBlacklistData::'BlacklistEntryListResponse'[0..1];
    }
    port def Blacklist_blacklistManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "blacklistManagement"; }
        doc /* Service version 1.0.0. Source: ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-SysD.tex */
    }
    port def Blacklist_blacklistManagement_HTTP_IDD :> Blacklist_blacklistManagement_SD {
        @IDD { MicroserviceName = "blacklistManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-blacklistManagement-HTTP-IDD.tex"; }
        attribute basePath : String = "/blacklist/mgmt";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address blacklist, port 8464 and base path /blacklist/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
query & POST & /query \\ \hline
create & POST & /create \\ \hline
remove & DELETE & /remove \\ \hline
\end{longtable}

\newpage */
        doc /* query: POST /blacklist/mgmt/query. Input: BlacklistQueryRequestDTO; output: BlacklistEntryListResponseDTO.  */
        in item 'queryRequest' : ArrowheadCoreData::'BlacklistQueryRequestDTO'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'BlacklistEntryListResponseDTO'[0..1];
        doc /* create: POST /blacklist/mgmt/create. Input: BlacklistCreateListRequestDTO; output: BlacklistEntryListResponseDTO.  */
        in item 'createRequest' : ArrowheadCoreData::'BlacklistCreateListRequestDTO'[0..1];
        out item 'createResponse' : ArrowheadCoreData::'BlacklistEntryListResponseDTO'[0..1];
        doc /* remove: DELETE /blacklist/mgmt/remove. Input: None; output: void.  */
    }
    port def Blacklist_blacklistManagement_HTTP_IDD_Implementation :> Blacklist_blacklistManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'Blacklist_blacklistManagement_http_query_0' {
        doc /* Operation query. Wire method: POST; address: /blacklist/mgmt/query. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/blacklist/mgmt/query"; requestType = "BlacklistQueryRequestDTO"; responseType = "BlacklistEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'BlacklistQueryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'BlacklistEntryListResponseDTO'[0..1];
    }
    action def 'Blacklist_blacklistManagement_http_create_1' {
        doc /* Operation create. Wire method: POST; address: /blacklist/mgmt/create. Query parameters: []. Path parameters: []. Status codes: ["CREATED", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/blacklist/mgmt/create"; requestType = "BlacklistCreateListRequestDTO"; responseType = "BlacklistEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'BlacklistCreateListRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'BlacklistEntryListResponseDTO'[0..1];
    }
    action def 'Blacklist_blacklistManagement_http_remove_2' {
        doc /* Operation remove. Wire method: DELETE; address: /blacklist/mgmt/remove. Query parameters: [{"name": "names", "type": "List<String>", "required": true, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/blacklist/mgmt/remove"; requestType = "unspecified"; responseType = "void"; queryParameters = "[{\"name\": \"names\", \"type\": \"List<String>\", \"required\": true, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
    }
    port def Blacklist_blacklistManagement_MQTT_IDD :> Blacklist_blacklistManagement_SD {
        @IDD { MicroserviceName = "blacklistManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-blacklistManagement-MQTT-IDD.tex"; }
        doc /* create: PUBLISH arrowhead/blacklist/management/create. Input: BlacklistCreateListRequest; output: BlacklistEntryListResponse.  */
        in item 'createRequest' : ArrowheadBlacklistData::'BlacklistCreateListRequest'[0..1];
        out item 'createResponse' : ArrowheadBlacklistData::'BlacklistEntryListResponse'[0..1];
        doc /* query: PUBLISH arrowhead/blacklist/management/query. Input: BlacklistQueryRequest; output: BlacklistEntryListResponse.  */
        in item 'queryRequest' : ArrowheadBlacklistData::'BlacklistQueryRequest'[0..1];
        out item 'queryResponse' : ArrowheadBlacklistData::'BlacklistEntryListResponse'[0..1];
        doc /* remove: PUBLISH arrowhead/blacklist/management/remove. Input: Array<String>; output: None.  */
        in attribute 'removeRequest' : ScalarValues::String[0..*];
        out item 'removeResponse' : JSONMessage[0..1];
    }
    port def Blacklist_blacklistManagement_MQTT_IDD_Implementation :> Blacklist_blacklistManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'Blacklist_blacklistManagement_mqtt_create_0' {
        doc /* Operation create. Wire method: PUBLISH; address: arrowhead/blacklist/management/create. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "PUBLISH"; address = "arrowhead/blacklist/management/create"; requestType = "BlacklistCreateListRequest"; responseType = "BlacklistEntryListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadBlacklistData::'BlacklistCreateListRequest'[0..1];
        out item 'response' : ArrowheadBlacklistData::'BlacklistEntryListResponse'[0..1];
    }
    action def 'Blacklist_blacklistManagement_mqtt_query_1' {
        doc /* Operation query. Wire method: PUBLISH; address: arrowhead/blacklist/management/query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "PUBLISH"; address = "arrowhead/blacklist/management/query"; requestType = "BlacklistQueryRequest"; responseType = "BlacklistEntryListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadBlacklistData::'BlacklistQueryRequest'[0..1];
        out item 'response' : ArrowheadBlacklistData::'BlacklistEntryListResponse'[0..1];
    }
    action def 'Blacklist_blacklistManagement_mqtt_remove_2' {
        doc /* Operation remove. Wire method: PUBLISH; address: arrowhead/blacklist/management/remove. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "PUBLISH"; address = "arrowhead/blacklist/management/remove"; requestType = "Array<String>"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : JSONMessage[0..1];
    }
    port def Blacklist_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-SysD.tex */
    }
    port def Blacklist_generalManagement_HTTP_IDD :> Blacklist_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-generalManagement-HTTP-IDD.tex"; }
        attribute basePath : String = "/blacklist/general/mgmt";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address blacklist, port 8464 and base path /blacklist/general/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
get-log & POST & /logs \\ \hline
get-config & GET & /get-config \\ \hline
\end{longtable}

\newpage */
        doc /* get-log: POST /blacklist/general/mgmt/logs. Input: LogRequestDTO; output: LogEntryListResponseDTO.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
        doc /* get-config: GET /blacklist/general/mgmt/get-config. Input: None; output: KeyValuesDTO.  */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def Blacklist_generalManagement_HTTP_IDD_Implementation :> Blacklist_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'Blacklist_generalManagement_http_get-log_0' {
        doc /* Operation get-log. Wire method: POST; address: /blacklist/general/mgmt/logs. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/blacklist/general/mgmt/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'Blacklist_generalManagement_http_get-config_1' {
        doc /* Operation get-config. Wire method: GET; address: /blacklist/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/blacklist/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def Blacklist_generalManagement_MQTT_IDD :> Blacklist_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-generalManagement-MQTT-IDD.tex"; }
        doc /* get-log: PUBLISH arrowhead/blacklist/general/management/get-log. Input: LogRequest; output: LogEntryListResponse.  */
        in item 'get-logRequest' : ArrowheadBlacklistData::'LogRequest'[0..1];
        out item 'get-logResponse' : ArrowheadBlacklistData::'LogEntryListResponse'[0..1];
        doc /* get-config: PUBLISH arrowhead/blacklist/general/management/get-config. Input: Array<String>; output: KeyValues.  */
        in attribute 'get-configRequest' : ScalarValues::String[0..*];
        out item 'get-configResponse' : ArrowheadBlacklistData::'KeyValues'[0..1];
    }
    port def Blacklist_generalManagement_MQTT_IDD_Implementation :> Blacklist_generalManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'Blacklist_generalManagement_mqtt_get-log_0' {
        doc /* Operation get-log. Wire method: PUBLISH; address: arrowhead/blacklist/general/management/get-log. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "PUBLISH"; address = "arrowhead/blacklist/general/management/get-log"; requestType = "LogRequest"; responseType = "LogEntryListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadBlacklistData::'LogRequest'[0..1];
        out item 'response' : ArrowheadBlacklistData::'LogEntryListResponse'[0..1];
    }
    action def 'Blacklist_generalManagement_mqtt_get-config_1' {
        doc /* Operation get-config. Wire method: PUBLISH; address: arrowhead/blacklist/general/management/get-config. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "PUBLISH"; address = "arrowhead/blacklist/general/management/get-config"; requestType = "Array<String>"; responseType = "KeyValues"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : ArrowheadBlacklistData::'KeyValues'[0..1];
    }
    port def Blacklist_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-SysD.tex */
    }
    port def Blacklist_sysMonitor_AMQP_IDD :> Blacklist_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.Blacklist.Blacklist";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, Blacklist registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.Blacklist.Blacklist",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.Blacklist.Blacklist.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadBlacklistData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.Blacklist.Blacklist.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadBlacklistData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.Blacklist.Blacklist.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadBlacklistData::'Observation'[0..1];
    }
    port def Blacklist_sysMonitor_AMQP_IDD_Implementation :> Blacklist_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'Blacklist_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Blacklist.Blacklist.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Blacklist.Blacklist.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadBlacklistData::'Observation'[0..1];
    }
    action def 'Blacklist_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Blacklist.Blacklist.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Blacklist.Blacklist.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadBlacklistData::'Observation'[0..1];
    }
    action def 'Blacklist_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Blacklist.Blacklist.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Blacklist.Blacklist.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadBlacklistData::'Observation'[0..1];
    }
    part def Blacklist_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "Blacklist"; FunctionalProperties = "This document describes the Blacklist support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-Blacklist-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-Blacklist-java-spring/documentation/v5.3.0/Blacklist-v5.3.0-SysD.tex"; }
        doc /* This document describes the Blacklist support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-Blacklist-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.
  \end{abstract} */
        port 'blacklistDiscovery_SD' : Blacklist_blacklistDiscovery_SD { @FullPort; }
        port 'blacklistManagement_SD' : Blacklist_blacklistManagement_SD { @FullPort; }
        port 'generalManagement_SD' : Blacklist_generalManagement_SD { @FullPort; }
        port 'sysMonitor_SD' : Blacklist_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, ConsumerAuthorization, ServiceRegistry. These are external requirements, not assumed co-deployments. */
    }
    part def Blacklist_SysDD :> Blacklist_SysD {
        @SysDD;
        port 'blacklistDiscovery_http' : Blacklist_blacklistDiscovery_HTTP_IDD { @FullPort; }
        port 'blacklistDiscovery_mqtt' : Blacklist_blacklistDiscovery_MQTT_IDD[0..1] { @FullPort; }
        port 'blacklistManagement_http' : Blacklist_blacklistManagement_HTTP_IDD { @FullPort; }
        port 'blacklistManagement_mqtt' : Blacklist_blacklistManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'generalManagement_http' : Blacklist_generalManagement_HTTP_IDD { @FullPort; }
        port 'generalManagement_mqtt' : Blacklist_generalManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'sysMonitor_amqp' : Blacklist_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def Blacklist :> Blacklist_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8464;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'Blacklist_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /blacklist/monitor/echo; source ah5-Blacklist-java-spring/src/main/java/eu/arrowhead/blacklist/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/blacklist/monitor/echo"; } }
}
