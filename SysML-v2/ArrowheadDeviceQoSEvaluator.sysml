library package ArrowheadDeviceQoSEvaluator {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def DeviceQoSEvaluator_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-SysD.tex */
    }
    port def DeviceQoSEvaluator_generalManagement_HTTP_IDD :> DeviceQoSEvaluator_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-generalManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/deviceqosevaluator/general/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address device-qos-evaluator, port 8472 and base path /deviceqosevaluator/general/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
get-log & POST & /logs \\ \hline
get-config & GET & /get-config \\ \hline
\end{longtable}

\newpage */
        doc /* get-log: POST /deviceqosevaluator/general/mgmt/logs. Input: LogRequestDTO; output: LogEntryListResponseDTO.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
        doc /* get-config: GET /deviceqosevaluator/general/mgmt/get-config. Input: None; output: KeyValuesDTO.  */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def DeviceQoSEvaluator_generalManagement_HTTP_IDD_Implementation :> DeviceQoSEvaluator_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'DeviceQoSEvaluator_generalManagement_http_get-log_0' {
        doc /* Operation get-log. Wire method: POST; address: /deviceqosevaluator/general/mgmt/logs. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/deviceqosevaluator/general/mgmt/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'DeviceQoSEvaluator_generalManagement_http_get-config_1' {
        doc /* Operation get-config. Wire method: GET; address: /deviceqosevaluator/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/deviceqosevaluator/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def DeviceQoSEvaluator_generalManagement_MQTT_IDD :> DeviceQoSEvaluator_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-generalManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/deviceqosevaluator/general/management/";
        doc /* get-log: REQUEST_REPLY arrowhead/deviceqosevaluator/general/management/get-log. Input: LogRequest; output: LogEntryListResponse.  */
        in item 'get-logRequest' : ArrowheadDeviceQoSEvaluatorData::'LogRequest'[0..1];
        out item 'get-logResponse' : ArrowheadDeviceQoSEvaluatorData::'LogEntryListResponse'[0..1];
        doc /* get-config: REQUEST_REPLY arrowhead/deviceqosevaluator/general/management/get-config. Input: Array<String>; output: KeyValues.  */
        in attribute 'get-configRequest' : ScalarValues::String[0..*];
        out item 'get-configResponse' : ArrowheadDeviceQoSEvaluatorData::'KeyValues'[0..1];
    }
    port def DeviceQoSEvaluator_generalManagement_MQTT_IDD_Implementation :> DeviceQoSEvaluator_generalManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'DeviceQoSEvaluator_generalManagement_mqtt_get-log_0' {
        doc /* Operation get-log. Wire method: REQUEST_REPLY; address: arrowhead/deviceqosevaluator/general/management/get-log. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/deviceqosevaluator/general/management/get-log"; requestType = "LogRequest"; responseType = "LogEntryListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadDeviceQoSEvaluatorData::'LogRequest'[0..1];
        out item 'response' : ArrowheadDeviceQoSEvaluatorData::'LogEntryListResponse'[0..1];
    }
    action def 'DeviceQoSEvaluator_generalManagement_mqtt_get-config_1' {
        doc /* Operation get-config. Wire method: REQUEST_REPLY; address: arrowhead/deviceqosevaluator/general/management/get-config. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/deviceqosevaluator/general/management/get-config"; requestType = "Array<String>"; responseType = "KeyValues"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : ArrowheadDeviceQoSEvaluatorData::'KeyValues'[0..1];
    }
    port def DeviceQoSEvaluator_qualityEvaluation_SD :> ArrowheadService {
        @SD { MicroserviceName = "qualityEvaluation"; }
        doc /* Service version 1.0.0. Source: ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-SysD.tex */
    }
    port def DeviceQoSEvaluator_qualityEvaluation_HTTP_IDD :> DeviceQoSEvaluator_qualityEvaluation_SD {
        @IDD { MicroserviceName = "qualityEvaluation"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-qualityEvaluation-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/deviceqosevaluator/qualityevaluation";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address device-qos-evaluator, port 8472 and base path /deviceqosevaluator/qualityevaluation. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
filter & POST & /filter \\ \hline
sort & POST & /sort \\ \hline
\end{longtable}

\newpage */
        doc /* filter: POST /deviceqosevaluator/qualityevaluation/filter. Input: QoSEvaluationRequestDTO; output: QoSEvaluationFilterResponseDTO.  */
        in item 'filterRequest' : ArrowheadCoreData::'QoSEvaluationRequestDTO'[0..1];
        out item 'filterResponse' : ArrowheadCoreData::'QoSEvaluationFilterResponseDTO'[0..1];
        doc /* sort: POST /deviceqosevaluator/qualityevaluation/sort. Input: QoSEvaluationRequestDTO; output: QoSEvaluationSortResponseDTO.  */
        in item 'sortRequest' : ArrowheadCoreData::'QoSEvaluationRequestDTO'[0..1];
        out item 'sortResponse' : ArrowheadCoreData::'QoSEvaluationSortResponseDTO'[0..1];
    }
    port def DeviceQoSEvaluator_qualityEvaluation_HTTP_IDD_Implementation :> DeviceQoSEvaluator_qualityEvaluation_HTTP_IDD { @IDD_Implementation; }
    action def 'DeviceQoSEvaluator_qualityEvaluation_http_filter_0' {
        doc /* Operation filter. Wire method: POST; address: /deviceqosevaluator/qualityevaluation/filter. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/deviceqosevaluator/qualityevaluation/filter"; requestType = "QoSEvaluationRequestDTO"; responseType = "QoSEvaluationFilterResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'QoSEvaluationRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'QoSEvaluationFilterResponseDTO'[0..1];
    }
    action def 'DeviceQoSEvaluator_qualityEvaluation_http_sort_1' {
        doc /* Operation sort. Wire method: POST; address: /deviceqosevaluator/qualityevaluation/sort. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/deviceqosevaluator/qualityevaluation/sort"; requestType = "QoSEvaluationRequestDTO"; responseType = "QoSEvaluationSortResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'QoSEvaluationRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'QoSEvaluationSortResponseDTO'[0..1];
    }
    port def DeviceQoSEvaluator_qualityEvaluation_MQTT_IDD :> DeviceQoSEvaluator_qualityEvaluation_SD {
        @IDD { MicroserviceName = "qualityEvaluation"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-qualityEvaluation-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/deviceqosevaluator/qualityevaluation/";
        doc /* filter: REQUEST_REPLY arrowhead/deviceqosevaluator/qualityevaluation/filter. Input: None; output: QoSEvaluationFilterResponse.  */
        out item 'filterResponse' : ArrowheadDeviceQoSEvaluatorData::'QoSEvaluationFilterResponse'[0..1];
        doc /* sort: REQUEST_REPLY arrowhead/deviceqosevaluator/qualityevaluation/sort. Input: None; output: QoSEvaluationSortResponse.  */
        out item 'sortResponse' : ArrowheadDeviceQoSEvaluatorData::'QoSEvaluationSortResponse'[0..1];
    }
    port def DeviceQoSEvaluator_qualityEvaluation_MQTT_IDD_Implementation :> DeviceQoSEvaluator_qualityEvaluation_MQTT_IDD { @IDD_Implementation; }
    action def 'DeviceQoSEvaluator_qualityEvaluation_mqtt_filter_0' {
        doc /* Operation filter. Wire method: REQUEST_REPLY; address: arrowhead/deviceqosevaluator/qualityevaluation/filter. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/deviceqosevaluator/qualityevaluation/filter"; requestType = "unspecified"; responseType = "QoSEvaluationFilterResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDeviceQoSEvaluatorData::'QoSEvaluationFilterResponse'[0..1];
    }
    action def 'DeviceQoSEvaluator_qualityEvaluation_mqtt_sort_1' {
        doc /* Operation sort. Wire method: REQUEST_REPLY; address: arrowhead/deviceqosevaluator/qualityevaluation/sort. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/deviceqosevaluator/qualityevaluation/sort"; requestType = "unspecified"; responseType = "QoSEvaluationSortResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDeviceQoSEvaluatorData::'QoSEvaluationSortResponse'[0..1];
    }
    port def DeviceQoSEvaluator_deviceQualityDataManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "deviceQualityDataManagement"; }
        doc /* Service version 1.0.0. Source: ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-SysD.tex */
    }
    port def DeviceQoSEvaluator_deviceQualityDataManagement_HTTP_IDD :> DeviceQoSEvaluator_deviceQualityDataManagement_SD {
        @IDD { MicroserviceName = "deviceQualityDataManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-deviceQualityDataManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/deviceqosevaluator/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address device-qos-evaluator, port 8472 and base path /deviceqosevaluator/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
query & POST & /query \\ \hline
reload & POST & /reload \\ \hline
\end{longtable}

\newpage */
        doc /* query: POST /deviceqosevaluator/mgmt/query. Input: QoSDeviceStatQueryRequestDTO; output: QoSDeviceStatQueryResponseDTO.  */
        in item 'queryRequest' : ArrowheadCoreData::'QoSDeviceStatQueryRequestDTO'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'QoSDeviceStatQueryResponseDTO'[0..1];
        doc /* reload: POST /deviceqosevaluator/mgmt/reload. Input: None; output: String.  */
        out attribute 'reloadResponse' : ScalarValues::String[0..1];
    }
    port def DeviceQoSEvaluator_deviceQualityDataManagement_HTTP_IDD_Implementation :> DeviceQoSEvaluator_deviceQualityDataManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'DeviceQoSEvaluator_deviceQualityDataManagement_http_query_0' {
        doc /* Operation query. Wire method: POST; address: /deviceqosevaluator/mgmt/query. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/deviceqosevaluator/mgmt/query"; requestType = "QoSDeviceStatQueryRequestDTO"; responseType = "QoSDeviceStatQueryResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'QoSDeviceStatQueryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'QoSDeviceStatQueryResponseDTO'[0..1];
    }
    action def 'DeviceQoSEvaluator_deviceQualityDataManagement_http_reload_1' {
        doc /* Operation reload. Wire method: POST; address: /deviceqosevaluator/mgmt/reload. Query parameters: []. Path parameters: []. Status codes: ["OK", "UNAUTHORIZED", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/deviceqosevaluator/mgmt/reload"; requestType = "unspecified"; responseType = "String"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"UNAUTHORIZED\", \"INTERNAL_SERVER_ERROR\"]"; }
        out attribute 'response' : ScalarValues::String[0..1];
    }
    port def DeviceQoSEvaluator_deviceQualityDataManagement_MQTT_IDD :> DeviceQoSEvaluator_deviceQualityDataManagement_SD {
        @IDD { MicroserviceName = "deviceQualityDataManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-deviceQualityDataManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/deviceqosevaluator/management/";
        doc /* query: REQUEST_REPLY arrowhead/deviceqosevaluator/management/query. Input: QoSDeviceStatQueryRequest; output: QoSDeviceStatQueryResponse.  */
        in item 'queryRequest' : ArrowheadDeviceQoSEvaluatorData::'QoSDeviceStatQueryRequest'[0..1];
        out item 'queryResponse' : ArrowheadDeviceQoSEvaluatorData::'QoSDeviceStatQueryResponse'[0..1];
        doc /* reload: REQUEST_REPLY arrowhead/deviceqosevaluator/management/reload. Input: None; output: String.  */
        out attribute 'reloadResponse' : ScalarValues::String[0..1];
    }
    port def DeviceQoSEvaluator_deviceQualityDataManagement_MQTT_IDD_Implementation :> DeviceQoSEvaluator_deviceQualityDataManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'DeviceQoSEvaluator_deviceQualityDataManagement_mqtt_query_0' {
        doc /* Operation query. Wire method: REQUEST_REPLY; address: arrowhead/deviceqosevaluator/management/query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/deviceqosevaluator/management/query"; requestType = "QoSDeviceStatQueryRequest"; responseType = "QoSDeviceStatQueryResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadDeviceQoSEvaluatorData::'QoSDeviceStatQueryRequest'[0..1];
        out item 'response' : ArrowheadDeviceQoSEvaluatorData::'QoSDeviceStatQueryResponse'[0..1];
    }
    action def 'DeviceQoSEvaluator_deviceQualityDataManagement_mqtt_reload_1' {
        doc /* Operation reload. Wire method: REQUEST_REPLY; address: arrowhead/deviceqosevaluator/management/reload. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/deviceqosevaluator/management/reload"; requestType = "unspecified"; responseType = "String"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out attribute 'response' : ScalarValues::String[0..1];
    }
    port def DeviceQoSEvaluator_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-SysD.tex */
    }
    port def DeviceQoSEvaluator_sysMonitor_AMQP_IDD :> DeviceQoSEvaluator_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.DeviceQoSEvaluator.DeviceQoSEvaluator";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, DeviceQoSEvaluator registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.DeviceQoSEvaluator.DeviceQoSEvaluator",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.DeviceQoSEvaluator.DeviceQoSEvaluator.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadDeviceQoSEvaluatorData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.DeviceQoSEvaluator.DeviceQoSEvaluator.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadDeviceQoSEvaluatorData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.DeviceQoSEvaluator.DeviceQoSEvaluator.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadDeviceQoSEvaluatorData::'Observation'[0..1];
    }
    port def DeviceQoSEvaluator_sysMonitor_AMQP_IDD_Implementation :> DeviceQoSEvaluator_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'DeviceQoSEvaluator_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DeviceQoSEvaluator.DeviceQoSEvaluator.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DeviceQoSEvaluator.DeviceQoSEvaluator.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDeviceQoSEvaluatorData::'Observation'[0..1];
    }
    action def 'DeviceQoSEvaluator_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DeviceQoSEvaluator.DeviceQoSEvaluator.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DeviceQoSEvaluator.DeviceQoSEvaluator.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDeviceQoSEvaluatorData::'Observation'[0..1];
    }
    action def 'DeviceQoSEvaluator_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DeviceQoSEvaluator.DeviceQoSEvaluator.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DeviceQoSEvaluator.DeviceQoSEvaluator.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDeviceQoSEvaluatorData::'Observation'[0..1];
    }
    part def DeviceQoSEvaluator_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "DeviceQoSEvaluator"; FunctionalProperties = "This document describes the DeviceQoSEvaluator support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-DeviceQoSEvaluator-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-DeviceQoSEvaluator-java-spring/documentation/v5.3.0/DeviceQoSEvaluator-v5.3.0-SysD.tex"; }
        doc /* This document describes the DeviceQoSEvaluator support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-DeviceQoSEvaluator-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.
  \end{abstract} */
        port 'generalManagement_SD' : DeviceQoSEvaluator_generalManagement_SD { @FullPort; }
        port 'qualityEvaluation_SD' : DeviceQoSEvaluator_qualityEvaluation_SD { @FullPort; }
        port 'deviceQualityDataManagement_SD' : DeviceQoSEvaluator_deviceQualityDataManagement_SD { @FullPort; }
        port 'sysMonitor_SD' : DeviceQoSEvaluator_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, Blacklist, ConsumerAuthorization, Device agents, ServiceRegistry. These are external requirements, not assumed co-deployments. */
    }
    part def DeviceQoSEvaluator_SysDD :> DeviceQoSEvaluator_SysD {
        @SysDD;
        port 'generalManagement_http' : DeviceQoSEvaluator_generalManagement_HTTP_IDD { @FullPort; }
        port 'generalManagement_mqtt' : DeviceQoSEvaluator_generalManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'qualityEvaluation_http' : DeviceQoSEvaluator_qualityEvaluation_HTTP_IDD { @FullPort; }
        port 'qualityEvaluation_mqtt' : DeviceQoSEvaluator_qualityEvaluation_MQTT_IDD[0..1] { @FullPort; }
        port 'deviceQualityDataManagement_http' : DeviceQoSEvaluator_deviceQualityDataManagement_HTTP_IDD { @FullPort; }
        port 'deviceQualityDataManagement_mqtt' : DeviceQoSEvaluator_deviceQualityDataManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'sysMonitor_amqp' : DeviceQoSEvaluator_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def DeviceQoSEvaluator :> DeviceQoSEvaluator_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8472;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'DeviceQoSEvaluator_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /deviceqosevaluator/monitor/echo; source ah5-DeviceQoSEvaluator-java-spring/src/main/java/eu/arrowhead/deviceqosevaluator/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/deviceqosevaluator/monitor/echo"; } }
}
