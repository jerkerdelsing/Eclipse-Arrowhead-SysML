library package ArrowheadTranslationManager {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def TranslationManager_translationReport_SD :> ArrowheadService {
        @SD { MicroserviceName = "translationReport"; }
        doc /* Service version 1.0.0. Source: ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-SysD.tex */
    }
    port def TranslationManager_translationReport_HTTP_IDD :> TranslationManager_translationReport_SD {
        @IDD { MicroserviceName = "translationReport"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-translationReport-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/translation/event";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address translation-manager, port 8465 and base path /translation/event. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
report & POST & /report \\ \hline
\end{longtable}

\newpage */
        doc /* report: POST /translation/event/report. Input: TranslationReportRequestDTO; output: void.  */
        in item 'reportRequest' : ArrowheadCoreData::'TranslationReportRequestDTO'[0..1];
    }
    port def TranslationManager_translationReport_HTTP_IDD_Implementation :> TranslationManager_translationReport_HTTP_IDD { @IDD_Implementation; }
    action def 'TranslationManager_translationReport_http_report_0' {
        doc /* Operation report. Wire method: POST; address: /translation/event/report. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/translation/event/report"; requestType = "TranslationReportRequestDTO"; responseType = "void"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'TranslationReportRequestDTO'[0..1];
    }
    port def TranslationManager_translationReport_MQTT_IDD :> TranslationManager_translationReport_SD {
        @IDD { MicroserviceName = "translationReport"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-translationReport-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/translation/event/";
        doc /* report: REQUEST_REPLY arrowhead/translation/event/report. Input: TranslationReportRequest; output: None.  */
        in item 'reportRequest' : ArrowheadTranslationManagerData::'TranslationReportRequest'[0..1];
        out item 'reportResponse' : JSONMessage[0..1];
    }
    port def TranslationManager_translationReport_MQTT_IDD_Implementation :> TranslationManager_translationReport_MQTT_IDD { @IDD_Implementation; }
    action def 'TranslationManager_translationReport_mqtt_report_0' {
        doc /* Operation report. Wire method: REQUEST_REPLY; address: arrowhead/translation/event/report. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/translation/event/report"; requestType = "TranslationReportRequest"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadTranslationManagerData::'TranslationReportRequest'[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    port def TranslationManager_translationBridge_SD :> ArrowheadService {
        @SD { MicroserviceName = "translationBridge"; }
        doc /* Service version 1.0.0. Source: ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-SysD.tex */
    }
    port def TranslationManager_translationBridge_HTTP_IDD :> TranslationManager_translationBridge_SD {
        @IDD { MicroserviceName = "translationBridge"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-translationBridge-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/translation/bridge";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address translation-manager, port 8465 and base path /translation/bridge. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
discovery & POST & /discovery \\ \hline
negotiation & POST & /negotiation \\ \hline
abort & DELETE & \texttt{/abort/{bridgeId}} \\ \hline
\end{longtable}

\newpage */
        doc /* discovery: POST /translation/bridge/discovery. Input: TranslationDiscoveryRequestDTO; output: TranslationDiscoveryResponseDTO.  */
        in item 'discoveryRequest' : ArrowheadCoreData::'TranslationDiscoveryRequestDTO'[0..1];
        out item 'discoveryResponse' : ArrowheadCoreData::'TranslationDiscoveryResponseDTO'[0..1];
        doc /* negotiation: POST /translation/bridge/negotiation. Input: TranslationNegotiationRequestDTO; output: TranslationNegotiationResponseDTO.  */
        in item 'negotiationRequest' : ArrowheadCoreData::'TranslationNegotiationRequestDTO'[0..1];
        out item 'negotiationResponse' : ArrowheadCoreData::'TranslationNegotiationResponseDTO'[0..1];
        doc /* abort: DELETE /translation/bridge/abort/{bridgeId}. Input: None; output: ResponseEntity<Void>.  */
    }
    port def TranslationManager_translationBridge_HTTP_IDD_Implementation :> TranslationManager_translationBridge_HTTP_IDD { @IDD_Implementation; }
    action def 'TranslationManager_translationBridge_http_discovery_0' {
        doc /* Operation discovery. Wire method: POST; address: /translation/bridge/discovery. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/translation/bridge/discovery"; requestType = "TranslationDiscoveryRequestDTO"; responseType = "TranslationDiscoveryResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
        in item 'request' : ArrowheadCoreData::'TranslationDiscoveryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'TranslationDiscoveryResponseDTO'[0..1];
    }
    action def 'TranslationManager_translationBridge_http_negotiation_1' {
        doc /* Operation negotiation. Wire method: POST; address: /translation/bridge/negotiation. Query parameters: []. Path parameters: []. Status codes: ["CREATED", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "NOT_FOUND", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/translation/bridge/negotiation"; requestType = "TranslationNegotiationRequestDTO"; responseType = "TranslationNegotiationResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"NOT_FOUND\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
        in item 'request' : ArrowheadCoreData::'TranslationNegotiationRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'TranslationNegotiationResponseDTO'[0..1];
    }
    action def 'TranslationManager_translationBridge_http_abort_2' {
        doc /* Operation abort. Wire method: DELETE; address: /translation/bridge/abort/{bridgeId}. Query parameters: []. Path parameters: ["bridgeId"]. Status codes: ["OK", "NO_CONTENT", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/translation/bridge/abort/{bridgeId}"; requestType = "unspecified"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"bridgeId\"]"; statusCodes = "[\"OK\", \"NO_CONTENT\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
    }
    port def TranslationManager_translationBridge_MQTT_IDD :> TranslationManager_translationBridge_SD {
        @IDD { MicroserviceName = "translationBridge"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-translationBridge-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/translation/bridge/";
        doc /* discovery: REQUEST_REPLY arrowhead/translation/bridge/discovery. Input: TranslationDiscoveryRequest; output: TranslationDiscoveryResponse.  */
        in item 'discoveryRequest' : ArrowheadTranslationManagerData::'TranslationDiscoveryRequest'[0..1];
        out item 'discoveryResponse' : ArrowheadTranslationManagerData::'TranslationDiscoveryResponse'[0..1];
        doc /* negotiation: REQUEST_REPLY arrowhead/translation/bridge/negotiation. Input: TranslationNegotiationRequest; output: TranslationNegotiationResponse.  */
        in item 'negotiationRequest' : ArrowheadTranslationManagerData::'TranslationNegotiationRequest'[0..1];
        out item 'negotiationResponse' : ArrowheadTranslationManagerData::'TranslationNegotiationResponse'[0..1];
        doc /* abort: REQUEST_REPLY arrowhead/translation/bridge/abort. Input: String; output: None.  */
        in attribute 'abortRequest' : ScalarValues::String[0..1];
        out item 'abortResponse' : JSONMessage[0..1];
    }
    port def TranslationManager_translationBridge_MQTT_IDD_Implementation :> TranslationManager_translationBridge_MQTT_IDD { @IDD_Implementation; }
    action def 'TranslationManager_translationBridge_mqtt_discovery_0' {
        doc /* Operation discovery. Wire method: REQUEST_REPLY; address: arrowhead/translation/bridge/discovery. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/translation/bridge/discovery"; requestType = "TranslationDiscoveryRequest"; responseType = "TranslationDiscoveryResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadTranslationManagerData::'TranslationDiscoveryRequest'[0..1];
        out item 'response' : ArrowheadTranslationManagerData::'TranslationDiscoveryResponse'[0..1];
    }
    action def 'TranslationManager_translationBridge_mqtt_negotiation_1' {
        doc /* Operation negotiation. Wire method: REQUEST_REPLY; address: arrowhead/translation/bridge/negotiation. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/translation/bridge/negotiation"; requestType = "TranslationNegotiationRequest"; responseType = "TranslationNegotiationResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadTranslationManagerData::'TranslationNegotiationRequest'[0..1];
        out item 'response' : ArrowheadTranslationManagerData::'TranslationNegotiationResponse'[0..1];
    }
    action def 'TranslationManager_translationBridge_mqtt_abort_2' {
        doc /* Operation abort. Wire method: REQUEST_REPLY; address: arrowhead/translation/bridge/abort. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/translation/bridge/abort"; requestType = "String"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    port def TranslationManager_translationBridgeManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "translationBridgeManagement"; }
        doc /* Service version 1.0.0. Source: ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-SysD.tex */
    }
    port def TranslationManager_translationBridgeManagement_HTTP_IDD :> TranslationManager_translationBridgeManagement_SD {
        @IDD { MicroserviceName = "translationBridgeManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-translationBridgeManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/translation/bridge/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address translation-manager, port 8465 and base path /translation/bridge/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
discovery & POST & /discovery \\ \hline
negotiation & POST & /negotiation \\ \hline
abort & DELETE & /abort \\ \hline
query & POST & /query \\ \hline
\end{longtable}

\newpage */
        doc /* discovery: POST /translation/bridge/mgmt/discovery. Input: TranslationDiscoveryMgmtRequestDTO; output: TranslationDiscoveryResponseDTO.  */
        in item 'discoveryRequest' : ArrowheadCoreData::'TranslationDiscoveryMgmtRequestDTO'[0..1];
        out item 'discoveryResponse' : ArrowheadCoreData::'TranslationDiscoveryResponseDTO'[0..1];
        doc /* negotiation: POST /translation/bridge/mgmt/negotiation. Input: TranslationNegotiationMgmtRequestDTO; output: TranslationNegotiationResponseDTO.  */
        in item 'negotiationRequest' : ArrowheadCoreData::'TranslationNegotiationMgmtRequestDTO'[0..1];
        out item 'negotiationResponse' : ArrowheadCoreData::'TranslationNegotiationResponseDTO'[0..1];
        doc /* abort: DELETE /translation/bridge/mgmt/abort. Input: None; output: TranslationAbortMgmtResponseDTO.  */
        out item 'abortResponse' : ArrowheadCoreData::'TranslationAbortMgmtResponseDTO'[0..1];
        doc /* query: POST /translation/bridge/mgmt/query. Input: TranslationQueryRequestDTO; output: TranslationQueryListResponseDTO.  */
        in item 'queryRequest' : ArrowheadCoreData::'TranslationQueryRequestDTO'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'TranslationQueryListResponseDTO'[0..1];
    }
    port def TranslationManager_translationBridgeManagement_HTTP_IDD_Implementation :> TranslationManager_translationBridgeManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'TranslationManager_translationBridgeManagement_http_discovery_0' {
        doc /* Operation discovery. Wire method: POST; address: /translation/bridge/mgmt/discovery. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/translation/bridge/mgmt/discovery"; requestType = "TranslationDiscoveryMgmtRequestDTO"; responseType = "TranslationDiscoveryResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
        in item 'request' : ArrowheadCoreData::'TranslationDiscoveryMgmtRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'TranslationDiscoveryResponseDTO'[0..1];
    }
    action def 'TranslationManager_translationBridgeManagement_http_negotiation_1' {
        doc /* Operation negotiation. Wire method: POST; address: /translation/bridge/mgmt/negotiation. Query parameters: []. Path parameters: []. Status codes: ["CREATED", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "NOT_FOUND", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/translation/bridge/mgmt/negotiation"; requestType = "TranslationNegotiationMgmtRequestDTO"; responseType = "TranslationNegotiationResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"NOT_FOUND\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
        in item 'request' : ArrowheadCoreData::'TranslationNegotiationMgmtRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'TranslationNegotiationResponseDTO'[0..1];
    }
    action def 'TranslationManager_translationBridgeManagement_http_abort_2' {
        doc /* Operation abort. Wire method: DELETE; address: /translation/bridge/mgmt/abort. Query parameters: [{"name": "ids", "type": "List<String>", "required": true, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/translation/bridge/mgmt/abort"; requestType = "unspecified"; responseType = "TranslationAbortMgmtResponseDTO"; queryParameters = "[{\"name\": \"ids\", \"type\": \"List<String>\", \"required\": true, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
        out item 'response' : ArrowheadCoreData::'TranslationAbortMgmtResponseDTO'[0..1];
    }
    action def 'TranslationManager_translationBridgeManagement_http_query_3' {
        doc /* Operation query. Wire method: POST; address: /translation/bridge/mgmt/query. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/translation/bridge/mgmt/query"; requestType = "TranslationQueryRequestDTO"; responseType = "TranslationQueryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'TranslationQueryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'TranslationQueryListResponseDTO'[0..1];
    }
    port def TranslationManager_translationBridgeManagement_MQTT_IDD :> TranslationManager_translationBridgeManagement_SD {
        @IDD { MicroserviceName = "translationBridgeManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-translationBridgeManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/translation/bridge/management/";
        doc /* discovery: REQUEST_REPLY arrowhead/translation/bridge/management/discovery. Input: TranslationDiscoveryMgmtRequest; output: TranslationDiscoveryResponse.  */
        in item 'discoveryRequest' : ArrowheadTranslationManagerData::'TranslationDiscoveryMgmtRequest'[0..1];
        out item 'discoveryResponse' : ArrowheadTranslationManagerData::'TranslationDiscoveryResponse'[0..1];
        doc /* negotiation: REQUEST_REPLY arrowhead/translation/bridge/management/negotiation. Input: TranslationNegotiationMgmtRequest; output: TranslationNegotiationResponse.  */
        in item 'negotiationRequest' : ArrowheadTranslationManagerData::'TranslationNegotiationMgmtRequest'[0..1];
        out item 'negotiationResponse' : ArrowheadTranslationManagerData::'TranslationNegotiationResponse'[0..1];
        doc /* abort: REQUEST_REPLY arrowhead/translation/bridge/management/abort. Input: Array<String>; output: TranslationAbortMgmtResponse.  */
        in attribute 'abortRequest' : ScalarValues::String[0..*];
        out item 'abortResponse' : ArrowheadTranslationManagerData::'TranslationAbortMgmtResponse'[0..1];
        doc /* query: REQUEST_REPLY arrowhead/translation/bridge/management/query. Input: TranslationQueryRequest; output: TranslationQueryListResponse.  */
        in item 'queryRequest' : ArrowheadTranslationManagerData::'TranslationQueryRequest'[0..1];
        out item 'queryResponse' : ArrowheadTranslationManagerData::'TranslationQueryListResponse'[0..1];
    }
    port def TranslationManager_translationBridgeManagement_MQTT_IDD_Implementation :> TranslationManager_translationBridgeManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'TranslationManager_translationBridgeManagement_mqtt_discovery_0' {
        doc /* Operation discovery. Wire method: REQUEST_REPLY; address: arrowhead/translation/bridge/management/discovery. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/translation/bridge/management/discovery"; requestType = "TranslationDiscoveryMgmtRequest"; responseType = "TranslationDiscoveryResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadTranslationManagerData::'TranslationDiscoveryMgmtRequest'[0..1];
        out item 'response' : ArrowheadTranslationManagerData::'TranslationDiscoveryResponse'[0..1];
    }
    action def 'TranslationManager_translationBridgeManagement_mqtt_negotiation_1' {
        doc /* Operation negotiation. Wire method: REQUEST_REPLY; address: arrowhead/translation/bridge/management/negotiation. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/translation/bridge/management/negotiation"; requestType = "TranslationNegotiationMgmtRequest"; responseType = "TranslationNegotiationResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadTranslationManagerData::'TranslationNegotiationMgmtRequest'[0..1];
        out item 'response' : ArrowheadTranslationManagerData::'TranslationNegotiationResponse'[0..1];
    }
    action def 'TranslationManager_translationBridgeManagement_mqtt_abort_2' {
        doc /* Operation abort. Wire method: REQUEST_REPLY; address: arrowhead/translation/bridge/management/abort. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/translation/bridge/management/abort"; requestType = "Array<String>"; responseType = "TranslationAbortMgmtResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : ArrowheadTranslationManagerData::'TranslationAbortMgmtResponse'[0..1];
    }
    action def 'TranslationManager_translationBridgeManagement_mqtt_query_3' {
        doc /* Operation query. Wire method: REQUEST_REPLY; address: arrowhead/translation/bridge/management/query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/translation/bridge/management/query"; requestType = "TranslationQueryRequest"; responseType = "TranslationQueryListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadTranslationManagerData::'TranslationQueryRequest'[0..1];
        out item 'response' : ArrowheadTranslationManagerData::'TranslationQueryListResponse'[0..1];
    }
    port def TranslationManager_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-SysD.tex */
    }
    port def TranslationManager_generalManagement_HTTP_IDD :> TranslationManager_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-generalManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/translation/general/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address translation-manager, port 8465 and base path /translation/general/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
get-log & POST & /logs \\ \hline
get-config & GET & /get-config \\ \hline
\end{longtable}

\newpage */
        doc /* get-log: POST /translation/general/mgmt/logs. Input: LogRequestDTO; output: LogEntryListResponseDTO.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
        doc /* get-config: GET /translation/general/mgmt/get-config. Input: None; output: KeyValuesDTO.  */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def TranslationManager_generalManagement_HTTP_IDD_Implementation :> TranslationManager_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'TranslationManager_generalManagement_http_get-log_0' {
        doc /* Operation get-log. Wire method: POST; address: /translation/general/mgmt/logs. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/translation/general/mgmt/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'TranslationManager_generalManagement_http_get-config_1' {
        doc /* Operation get-config. Wire method: GET; address: /translation/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/translation/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def TranslationManager_generalManagement_MQTT_IDD :> TranslationManager_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-generalManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/translation/general/management/";
        doc /* get-log: REQUEST_REPLY arrowhead/translation/general/management/get-log. Input: LogRequest; output: LogEntryListResponse.  */
        in item 'get-logRequest' : ArrowheadTranslationManagerData::'LogRequest'[0..1];
        out item 'get-logResponse' : ArrowheadTranslationManagerData::'LogEntryListResponse'[0..1];
        doc /* get-config: REQUEST_REPLY arrowhead/translation/general/management/get-config. Input: Array<String>; output: KeyValues.  */
        in attribute 'get-configRequest' : ScalarValues::String[0..*];
        out item 'get-configResponse' : ArrowheadTranslationManagerData::'KeyValues'[0..1];
    }
    port def TranslationManager_generalManagement_MQTT_IDD_Implementation :> TranslationManager_generalManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'TranslationManager_generalManagement_mqtt_get-log_0' {
        doc /* Operation get-log. Wire method: REQUEST_REPLY; address: arrowhead/translation/general/management/get-log. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/translation/general/management/get-log"; requestType = "LogRequest"; responseType = "LogEntryListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadTranslationManagerData::'LogRequest'[0..1];
        out item 'response' : ArrowheadTranslationManagerData::'LogEntryListResponse'[0..1];
    }
    action def 'TranslationManager_generalManagement_mqtt_get-config_1' {
        doc /* Operation get-config. Wire method: REQUEST_REPLY; address: arrowhead/translation/general/management/get-config. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/translation/general/management/get-config"; requestType = "Array<String>"; responseType = "KeyValues"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : ArrowheadTranslationManagerData::'KeyValues'[0..1];
    }
    port def TranslationManager_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-SysD.tex */
    }
    port def TranslationManager_sysMonitor_AMQP_IDD :> TranslationManager_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.TranslationManager.TranslationManager";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, TranslationManager registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.TranslationManager.TranslationManager",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.TranslationManager.TranslationManager.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadTranslationManagerData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.TranslationManager.TranslationManager.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadTranslationManagerData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.TranslationManager.TranslationManager.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadTranslationManagerData::'Observation'[0..1];
    }
    port def TranslationManager_sysMonitor_AMQP_IDD_Implementation :> TranslationManager_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'TranslationManager_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.TranslationManager.TranslationManager.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.TranslationManager.TranslationManager.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadTranslationManagerData::'Observation'[0..1];
    }
    action def 'TranslationManager_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.TranslationManager.TranslationManager.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.TranslationManager.TranslationManager.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadTranslationManagerData::'Observation'[0..1];
    }
    action def 'TranslationManager_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.TranslationManager.TranslationManager.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.TranslationManager.TranslationManager.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadTranslationManagerData::'Observation'[0..1];
    }
    part def TranslationManager_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "TranslationManager"; FunctionalProperties = "This document describes the TranslationManager support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-TranslationManager-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-TranslationManager-java-spring/documentation/v5.3.0/TranslationManager-v5.3.0-SysD.tex"; }
        doc /* This document describes the TranslationManager support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-TranslationManager-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.
  \end{abstract} */
        port 'translationReport_SD' : TranslationManager_translationReport_SD { @FullPort; }
        port 'translationBridge_SD' : TranslationManager_translationBridge_SD { @FullPort; }
        port 'translationBridgeManagement_SD' : TranslationManager_translationBridgeManagement_SD { @FullPort; }
        port 'generalManagement_SD' : TranslationManager_generalManagement_SD { @FullPort; }
        port 'sysMonitor_SD' : TranslationManager_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, Blacklist, ConsumerAuthorization, ServiceRegistry, Translators. These are external requirements, not assumed co-deployments. */
    }
    part def TranslationManager_SysDD :> TranslationManager_SysD {
        @SysDD;
        port 'translationReport_http' : TranslationManager_translationReport_HTTP_IDD { @FullPort; }
        port 'translationReport_mqtt' : TranslationManager_translationReport_MQTT_IDD[0..1] { @FullPort; }
        port 'translationBridge_http' : TranslationManager_translationBridge_HTTP_IDD { @FullPort; }
        port 'translationBridge_mqtt' : TranslationManager_translationBridge_MQTT_IDD[0..1] { @FullPort; }
        port 'translationBridgeManagement_http' : TranslationManager_translationBridgeManagement_HTTP_IDD { @FullPort; }
        port 'translationBridgeManagement_mqtt' : TranslationManager_translationBridgeManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'generalManagement_http' : TranslationManager_generalManagement_HTTP_IDD { @FullPort; }
        port 'generalManagement_mqtt' : TranslationManager_generalManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'sysMonitor_amqp' : TranslationManager_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def TranslationManager :> TranslationManager_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8465;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'TranslationManager_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /translation/monitor/echo; source ah5-TranslationManager-java-spring/src/main/java/eu/arrowhead/translationmanager/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/translation/monitor/echo"; } }
}
