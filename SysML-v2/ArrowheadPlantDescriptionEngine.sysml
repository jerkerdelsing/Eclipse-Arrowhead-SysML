library package ArrowheadPlantDescriptionEngine {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def PlantDescriptionEngine_plantDescriptionManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "plantDescriptionManagement"; }
        doc /* Service version 1.0.0. Source: ah5-PlantDescriptionEngine-java-spring/documentation/v5.3.0/PlantDescriptionEngine-v5.3.0-SysD.tex */
    }
    port def PlantDescriptionEngine_plantDescriptionManagement_HTTP_IDD :> PlantDescriptionEngine_plantDescriptionManagement_SD {
        @IDD { MicroserviceName = "plantDescriptionManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-PlantDescriptionEngine-java-spring/documentation/v5.3.0/PlantDescriptionEngine-v5.3.0-plantDescriptionManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/plantdescriptionengine/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address plantdescriptionengine, port 8432 and base path /plantdescriptionengine/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
query & GET & /plant-descriptions \\ \hline
get & GET & \texttt{/plant-descriptions/{id}} \\ \hline
create & POST & /plant-descriptions \\ \hline
replace & PUT & \texttt{/plant-descriptions/{id}} \\ \hline
update & PATCH & \texttt{/plant-descriptions/{id}} \\ \hline
remove & DELETE & \texttt{/plant-descriptions/{id}} \\ \hline
\end{longtable}

\newpage */
        doc /* query: GET /plantdescriptionengine/mgmt/plant-descriptions. Input: None; output: PlantDescriptionListResponseDTO.  */
        out item 'queryResponse' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionListResponseDTO'[0..1];
        doc /* get: GET /plantdescriptionengine/mgmt/plant-descriptions/{id}. Input: None; output: PlantDescriptionResponseDTO.  */
        out item 'getResponse' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionResponseDTO'[0..1];
        doc /* create: POST /plantdescriptionengine/mgmt/plant-descriptions. Input: PlantDescriptionRequestDTO; output: PlantDescriptionResponseDTO.  */
        in item 'createRequest' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionRequestDTO'[0..1];
        out item 'createResponse' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionResponseDTO'[0..1];
        doc /* replace: PUT /plantdescriptionengine/mgmt/plant-descriptions/{id}. Input: PlantDescriptionRequestDTO; output: PlantDescriptionResponseDTO.  */
        in item 'replaceRequest' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionRequestDTO'[0..1];
        out item 'replaceResponse' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionResponseDTO'[0..1];
        doc /* update: PATCH /plantdescriptionengine/mgmt/plant-descriptions/{id}. Input: PlantDescriptionUpdateDTO; output: PlantDescriptionResponseDTO.  */
        in item 'updateRequest' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionUpdateDTO'[0..1];
        out item 'updateResponse' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionResponseDTO'[0..1];
        doc /* remove: DELETE /plantdescriptionengine/mgmt/plant-descriptions/{id}. Input: None; output: void.  */
    }
    port def PlantDescriptionEngine_plantDescriptionManagement_HTTP_IDD_Implementation :> PlantDescriptionEngine_plantDescriptionManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'PlantDescriptionEngine_plantDescriptionManagement_http_query_0' {
        doc /* Operation query. Wire method: GET; address: /plantdescriptionengine/mgmt/plant-descriptions. Query parameters: [{"name": "page", "type": "Integer", "required": false, "default": null}, {"name": "size", "type": "Integer", "required": false, "default": null}, {"name": "direction", "type": "String", "required": false, "default": null}, {"name": "sort_field", "type": "String", "required": false, "default": null}, {"name": "active", "type": "Boolean", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/plantdescriptionengine/mgmt/plant-descriptions"; requestType = "unspecified"; responseType = "PlantDescriptionListResponseDTO"; queryParameters = "[{\"name\": \"page\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"size\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"direction\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"sort_field\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"active\", \"type\": \"Boolean\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionListResponseDTO'[0..1];
    }
    action def 'PlantDescriptionEngine_plantDescriptionManagement_http_get_1' {
        doc /* Operation get. Wire method: GET; address: /plantdescriptionengine/mgmt/plant-descriptions/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/plantdescriptionengine/mgmt/plant-descriptions/{id}"; requestType = "unspecified"; responseType = "PlantDescriptionResponseDTO"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionResponseDTO'[0..1];
    }
    action def 'PlantDescriptionEngine_plantDescriptionManagement_http_create_2' {
        doc /* Operation create. Wire method: POST; address: /plantdescriptionengine/mgmt/plant-descriptions. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/plantdescriptionengine/mgmt/plant-descriptions"; requestType = "PlantDescriptionRequestDTO"; responseType = "PlantDescriptionResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionRequestDTO'[0..1];
        out item 'response' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionResponseDTO'[0..1];
    }
    action def 'PlantDescriptionEngine_plantDescriptionManagement_http_replace_3' {
        doc /* Operation replace. Wire method: PUT; address: /plantdescriptionengine/mgmt/plant-descriptions/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/plantdescriptionengine/mgmt/plant-descriptions/{id}"; requestType = "PlantDescriptionRequestDTO"; responseType = "PlantDescriptionResponseDTO"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionRequestDTO'[0..1];
        out item 'response' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionResponseDTO'[0..1];
    }
    action def 'PlantDescriptionEngine_plantDescriptionManagement_http_update_4' {
        doc /* Operation update. Wire method: PATCH; address: /plantdescriptionengine/mgmt/plant-descriptions/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PATCH"; address = "/plantdescriptionengine/mgmt/plant-descriptions/{id}"; requestType = "PlantDescriptionUpdateDTO"; responseType = "PlantDescriptionResponseDTO"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionUpdateDTO'[0..1];
        out item 'response' : ArrowheadPlantDescriptionEngineData::'PlantDescriptionResponseDTO'[0..1];
    }
    action def 'PlantDescriptionEngine_plantDescriptionManagement_http_remove_5' {
        doc /* Operation remove. Wire method: DELETE; address: /plantdescriptionengine/mgmt/plant-descriptions/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/plantdescriptionengine/mgmt/plant-descriptions/{id}"; requestType = "unspecified"; responseType = "void"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
    }
    port def PlantDescriptionEngine_plantDescriptionMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "plantDescriptionMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-PlantDescriptionEngine-java-spring/documentation/v5.3.0/PlantDescriptionEngine-v5.3.0-SysD.tex */
    }
    port def PlantDescriptionEngine_plantDescriptionMonitor_HTTP_IDD :> PlantDescriptionEngine_plantDescriptionMonitor_SD {
        @IDD { MicroserviceName = "plantDescriptionMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-PlantDescriptionEngine-java-spring/documentation/v5.3.0/PlantDescriptionEngine-v5.3.0-plantDescriptionMonitor-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/plantdescriptionengine/monitor";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address plantdescriptionengine, port 8432 and base path /plantdescriptionengine/monitor. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
query-plant-descriptions & GET & /plant-descriptions \\ \hline
get-plant-description & GET & \texttt{/plant-descriptions/{id}} \\ \hline
query-alarms & GET & /alarms \\ \hline
get-alarm & GET & \texttt{/alarms/{id}} \\ \hline
acknowledge-alarm & PATCH & \texttt{/alarms/{id}} \\ \hline
\end{longtable}

\newpage */
        doc /* query-plant-descriptions: GET /plantdescriptionengine/monitor/plant-descriptions. Input: None; output: MonitorPlantDescriptionListResponseDTO.  */
        out item 'query-plant-descriptionsResponse' : ArrowheadPlantDescriptionEngineData::'MonitorPlantDescriptionListResponseDTO'[0..1];
        doc /* get-plant-description: GET /plantdescriptionengine/monitor/plant-descriptions/{id}. Input: None; output: MonitorPlantDescriptionResponseDTO.  */
        out item 'get-plant-descriptionResponse' : ArrowheadPlantDescriptionEngineData::'MonitorPlantDescriptionResponseDTO'[0..1];
        doc /* query-alarms: GET /plantdescriptionengine/monitor/alarms. Input: None; output: PdeAlarmListResponseDTO.  */
        out item 'query-alarmsResponse' : ArrowheadPlantDescriptionEngineData::'PdeAlarmListResponseDTO'[0..1];
        doc /* get-alarm: GET /plantdescriptionengine/monitor/alarms/{id}. Input: None; output: PdeAlarmResponseDTO.  */
        out item 'get-alarmResponse' : ArrowheadPlantDescriptionEngineData::'PdeAlarmResponseDTO'[0..1];
        doc /* acknowledge-alarm: PATCH /plantdescriptionengine/monitor/alarms/{id}. Input: PdeAlarmUpdateDTO; output: PdeAlarmResponseDTO.  */
        in item 'acknowledge-alarmRequest' : ArrowheadPlantDescriptionEngineData::'PdeAlarmUpdateDTO'[0..1];
        out item 'acknowledge-alarmResponse' : ArrowheadPlantDescriptionEngineData::'PdeAlarmResponseDTO'[0..1];
    }
    port def PlantDescriptionEngine_plantDescriptionMonitor_HTTP_IDD_Implementation :> PlantDescriptionEngine_plantDescriptionMonitor_HTTP_IDD { @IDD_Implementation; }
    action def 'PlantDescriptionEngine_plantDescriptionMonitor_http_query-plant-descriptions_0' {
        doc /* Operation query-plant-descriptions. Wire method: GET; address: /plantdescriptionengine/monitor/plant-descriptions. Query parameters: [{"name": "page", "type": "Integer", "required": false, "default": null}, {"name": "size", "type": "Integer", "required": false, "default": null}, {"name": "direction", "type": "String", "required": false, "default": null}, {"name": "sort_field", "type": "String", "required": false, "default": null}, {"name": "active", "type": "Boolean", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/plantdescriptionengine/monitor/plant-descriptions"; requestType = "unspecified"; responseType = "MonitorPlantDescriptionListResponseDTO"; queryParameters = "[{\"name\": \"page\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"size\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"direction\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"sort_field\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"active\", \"type\": \"Boolean\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadPlantDescriptionEngineData::'MonitorPlantDescriptionListResponseDTO'[0..1];
    }
    action def 'PlantDescriptionEngine_plantDescriptionMonitor_http_get-plant-description_1' {
        doc /* Operation get-plant-description. Wire method: GET; address: /plantdescriptionengine/monitor/plant-descriptions/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/plantdescriptionengine/monitor/plant-descriptions/{id}"; requestType = "unspecified"; responseType = "MonitorPlantDescriptionResponseDTO"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadPlantDescriptionEngineData::'MonitorPlantDescriptionResponseDTO'[0..1];
    }
    action def 'PlantDescriptionEngine_plantDescriptionMonitor_http_query-alarms_2' {
        doc /* Operation query-alarms. Wire method: GET; address: /plantdescriptionengine/monitor/alarms. Query parameters: [{"name": "page", "type": "Integer", "required": false, "default": null}, {"name": "size", "type": "Integer", "required": false, "default": null}, {"name": "direction", "type": "String", "required": false, "default": null}, {"name": "sort_field", "type": "String", "required": false, "default": null}, {"name": "system_name", "type": "String", "required": false, "default": null}, {"name": "severity", "type": "String", "required": false, "default": null}, {"name": "acknowledged", "type": "Boolean", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/plantdescriptionengine/monitor/alarms"; requestType = "unspecified"; responseType = "PdeAlarmListResponseDTO"; queryParameters = "[{\"name\": \"page\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"size\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"direction\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"sort_field\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"system_name\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"severity\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"acknowledged\", \"type\": \"Boolean\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadPlantDescriptionEngineData::'PdeAlarmListResponseDTO'[0..1];
    }
    action def 'PlantDescriptionEngine_plantDescriptionMonitor_http_get-alarm_3' {
        doc /* Operation get-alarm. Wire method: GET; address: /plantdescriptionengine/monitor/alarms/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/plantdescriptionengine/monitor/alarms/{id}"; requestType = "unspecified"; responseType = "PdeAlarmResponseDTO"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadPlantDescriptionEngineData::'PdeAlarmResponseDTO'[0..1];
    }
    action def 'PlantDescriptionEngine_plantDescriptionMonitor_http_acknowledge-alarm_4' {
        doc /* Operation acknowledge-alarm. Wire method: PATCH; address: /plantdescriptionengine/monitor/alarms/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PATCH"; address = "/plantdescriptionengine/monitor/alarms/{id}"; requestType = "PdeAlarmUpdateDTO"; responseType = "PdeAlarmResponseDTO"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadPlantDescriptionEngineData::'PdeAlarmUpdateDTO'[0..1];
        out item 'response' : ArrowheadPlantDescriptionEngineData::'PdeAlarmResponseDTO'[0..1];
    }
    port def PlantDescriptionEngine_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-PlantDescriptionEngine-java-spring/documentation/v5.3.0/PlantDescriptionEngine-v5.3.0-SysD.tex */
    }
    port def PlantDescriptionEngine_generalManagement_HTTP_IDD :> PlantDescriptionEngine_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-PlantDescriptionEngine-java-spring/documentation/v5.3.0/PlantDescriptionEngine-v5.3.0-generalManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/plantdescriptionengine/general/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address plantdescriptionengine, port 8432 and base path /plantdescriptionengine/general/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
get-log & POST & /logs \\ \hline
get-config & GET & /get-config \\ \hline
\end{longtable}

\newpage */
        doc /* get-log: POST /plantdescriptionengine/general/mgmt/logs. Input: LogRequestDTO; output: LogEntryListResponseDTO.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
        doc /* get-config: GET /plantdescriptionengine/general/mgmt/get-config. Input: None; output: KeyValuesDTO.  */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def PlantDescriptionEngine_generalManagement_HTTP_IDD_Implementation :> PlantDescriptionEngine_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'PlantDescriptionEngine_generalManagement_http_get-log_0' {
        doc /* Operation get-log. Wire method: POST; address: /plantdescriptionengine/general/mgmt/logs. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/plantdescriptionengine/general/mgmt/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'PlantDescriptionEngine_generalManagement_http_get-config_1' {
        doc /* Operation get-config. Wire method: GET; address: /plantdescriptionengine/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/plantdescriptionengine/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def PlantDescriptionEngine_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-PlantDescriptionEngine-java-spring/documentation/v5.3.0/PlantDescriptionEngine-v5.3.0-SysD.tex */
    }
    port def PlantDescriptionEngine_sysMonitor_AMQP_IDD :> PlantDescriptionEngine_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-PlantDescriptionEngine-java-spring/documentation/v5.3.0/PlantDescriptionEngine-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.PlantDescriptionEngine.PlantDescriptionEngine";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, PlantDescriptionEngine registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.PlantDescriptionEngine.PlantDescriptionEngine",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.PlantDescriptionEngine.PlantDescriptionEngine.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadPlantDescriptionEngineData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.PlantDescriptionEngine.PlantDescriptionEngine.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadPlantDescriptionEngineData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.PlantDescriptionEngine.PlantDescriptionEngine.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadPlantDescriptionEngineData::'Observation'[0..1];
    }
    port def PlantDescriptionEngine_sysMonitor_AMQP_IDD_Implementation :> PlantDescriptionEngine_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'PlantDescriptionEngine_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.PlantDescriptionEngine.PlantDescriptionEngine.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.PlantDescriptionEngine.PlantDescriptionEngine.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadPlantDescriptionEngineData::'Observation'[0..1];
    }
    action def 'PlantDescriptionEngine_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.PlantDescriptionEngine.PlantDescriptionEngine.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.PlantDescriptionEngine.PlantDescriptionEngine.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadPlantDescriptionEngineData::'Observation'[0..1];
    }
    action def 'PlantDescriptionEngine_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.PlantDescriptionEngine.PlantDescriptionEngine.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.PlantDescriptionEngine.PlantDescriptionEngine.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadPlantDescriptionEngineData::'Observation'[0..1];
    }
    part def PlantDescriptionEngine_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "PlantDescriptionEngine"; FunctionalProperties = "This document describes the PlantDescriptionEngine support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-PlantDescriptionEngine-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-PlantDescriptionEngine-java-spring/documentation/v5.3.0/PlantDescriptionEngine-v5.3.0-SysD.tex"; }
        doc /* This document describes the PlantDescriptionEngine support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-PlantDescriptionEngine-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.
  \end{abstract} */
        port 'plantDescriptionManagement_SD' : PlantDescriptionEngine_plantDescriptionManagement_SD { @FullPort; }
        port 'plantDescriptionMonitor_SD' : PlantDescriptionEngine_plantDescriptionMonitor_SD { @FullPort; }
        port 'generalManagement_SD' : PlantDescriptionEngine_generalManagement_SD { @FullPort; }
        port 'sysMonitor_SD' : PlantDescriptionEngine_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, ConsumerAuthorization, DynamicServiceOrchestration, ServiceRegistry, SysMonitor. These are external requirements, not assumed co-deployments. */
    }
    part def PlantDescriptionEngine_SysDD :> PlantDescriptionEngine_SysD {
        @SysDD;
        port 'plantDescriptionManagement_http' : PlantDescriptionEngine_plantDescriptionManagement_HTTP_IDD { @FullPort; }
        port 'plantDescriptionMonitor_http' : PlantDescriptionEngine_plantDescriptionMonitor_HTTP_IDD { @FullPort; }
        port 'generalManagement_http' : PlantDescriptionEngine_generalManagement_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : PlantDescriptionEngine_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def PlantDescriptionEngine :> PlantDescriptionEngine_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8432;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
}
