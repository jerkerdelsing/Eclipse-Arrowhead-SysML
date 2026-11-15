library package ArrowheadSimpleStoreServiceOrchestration {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def SimpleStoreServiceOrchestration_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/SimpleStoreServiceOrchestrationSystemInfo.java */
    }
    port def SimpleStoreServiceOrchestration_generalManagement_HTTP_IDD :> SimpleStoreServiceOrchestration_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/documentation/v5.3.0/SimpleStoreServiceOrchestration-v5.3.0-generalManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/serviceorchestration/general/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8442 and base path /serviceorchestration/general/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
get-log & POST & /logs \\ \hline
get-config & GET & /get-config \\ \hline
\end{longtable}

\newpage */
        doc /* get-log: POST /serviceorchestration/general/mgmt/logs. Input: LogRequestDTO; output: LogEntryListResponseDTO. Returns the log entries */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
        doc /* get-config: GET /serviceorchestration/general/mgmt/get-config. Input: None; output: KeyValuesDTO. Returns a list of configurations */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def SimpleStoreServiceOrchestration_generalManagement_HTTP_IDD_Implementation :> SimpleStoreServiceOrchestration_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'SimpleStoreServiceOrchestration_generalManagement_http_get-log_0' {
        doc /* Returns the log entries. Wire method: POST; address: /serviceorchestration/general/mgmt/logs. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/general/mgmt/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_generalManagement_http_get-config_1' {
        doc /* Returns a list of configurations. Wire method: GET; address: /serviceorchestration/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/serviceorchestration/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def SimpleStoreServiceOrchestration_generalManagement_MQTT_IDD :> SimpleStoreServiceOrchestration_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/documentation/v5.3.0/SimpleStoreServiceOrchestration-v5.3.0-generalManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/serviceorchestration/general/management/";
        doc /* get-log: REQUEST_REPLY arrowhead/serviceorchestration/general/management/get-log. Input: LogRequest; output: LogEntryListResponse.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequest'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponse'[0..1];
        doc /* get-config: REQUEST_REPLY arrowhead/serviceorchestration/general/management/get-config. Input: Array<String>; output: KeyValues.  */
        in attribute 'get-configRequest' : ScalarValues::String[0..*];
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValues'[0..1];
    }
    port def SimpleStoreServiceOrchestration_generalManagement_MQTT_IDD_Implementation :> SimpleStoreServiceOrchestration_generalManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'SimpleStoreServiceOrchestration_generalManagement_mqtt_get-log_0' {
        doc /* Operation get-log. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/general/management/get-log. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/general/management/get-log"; requestType = "LogRequest"; responseType = "LogEntryListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'LogRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponse'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_generalManagement_mqtt_get-config_1' {
        doc /* Operation get-config. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/general/management/get-config. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/general/management/get-config"; requestType = "Array<String>"; responseType = "KeyValues"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : ArrowheadCoreData::'KeyValues'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestration_SD :> ArrowheadService {
        @SD { MicroserviceName = "serviceOrchestration"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/SimpleStoreServiceOrchestrationSystemInfo.java */
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestration_HTTP_IDD :> SimpleStoreServiceOrchestration_serviceOrchestration_SD {
        @IDD { MicroserviceName = "serviceOrchestration"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/documentation/v5.3.0/SimpleStoreServiceOrchestration-v5.3.0-serviceOrchestration-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/serviceorchestration/orchestration";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8442 and base path /serviceorchestration/orchestration. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
pull & POST & /pull \\ \hline
subscribe & POST & /subscribe \\ \hline
unsubscribe & DELETE & \texttt{/unsubscribe/{id}} \\ \hline
\end{longtable}

\newpage */
        doc /* pull: POST /serviceorchestration/orchestration/pull. Input: OrchestrationRequestDTO; output: OrchestrationResponseDTO. Returns the orchestration results from the simple store */
        in item 'pullRequest' : ArrowheadCoreData::'OrchestrationRequestDTO'[0..1];
        out item 'pullResponse' : ArrowheadCoreData::'OrchestrationResponseDTO'[0..1];
        doc /* subscribe: POST /serviceorchestration/orchestration/subscribe. Input: OrchestrationSubscriptionRequestDTO; output: ResponseEntity<String>. Returns a subscription id. Existing subscriptions will be overwritten. */
        in item 'subscribeRequest' : ArrowheadCoreData::'OrchestrationSubscriptionRequestDTO'[0..1];
        out attribute 'subscribeResponse' : ScalarValues::String[0..1];
        doc /* unsubscribe: DELETE /serviceorchestration/orchestration/unsubscribe/{id}. Input: None; output: ResponseEntity<Void>. Removes the subscription by the given id */
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestration_HTTP_IDD_Implementation :> SimpleStoreServiceOrchestration_serviceOrchestration_HTTP_IDD { @IDD_Implementation; }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestration_http_pull_0' {
        doc /* Returns the orchestration results from the simple store. Wire method: POST; address: /serviceorchestration/orchestration/pull. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/pull"; requestType = "OrchestrationRequestDTO"; responseType = "OrchestrationResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationResponseDTO'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestration_http_subscribe_1' {
        doc /* Returns a subscription id. Existing subscriptions will be overwritten.. Wire method: POST; address: /serviceorchestration/orchestration/subscribe. Query parameters: [{"name": "trigger", "type": "Boolean", "required": false, "default": "false"}]. Path parameters: []. Status codes: ["CREATED", "OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/subscribe"; requestType = "OrchestrationSubscriptionRequestDTO"; responseType = "ResponseEntity<String>"; queryParameters = "[{\"name\": \"trigger\", \"type\": \"Boolean\", \"required\": false, \"default\": \"false\"}]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionRequestDTO'[0..1];
        out attribute 'response' : ScalarValues::String[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestration_http_unsubscribe_2' {
        doc /* Removes the subscription by the given id. Wire method: DELETE; address: /serviceorchestration/orchestration/unsubscribe/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: ["OK", "NO_CONTENT", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/serviceorchestration/orchestration/unsubscribe/{id}"; requestType = "unspecified"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[\"OK\", \"NO_CONTENT\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestration_MQTT_IDD :> SimpleStoreServiceOrchestration_serviceOrchestration_SD {
        @IDD { MicroserviceName = "serviceOrchestration"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/documentation/v5.3.0/SimpleStoreServiceOrchestration-v5.3.0-serviceOrchestration-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/serviceorchestration/orchestration/";
        doc /* pull: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/pull. Input: OrchestrationRequest; output: OrchestrationResponse.  */
        in item 'pullRequest' : ArrowheadCoreData::'OrchestrationRequest'[0..1];
        out item 'pullResponse' : ArrowheadCoreData::'OrchestrationResponse'[0..1];
        doc /* subscribe: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/subscribe. Input: OrchestrationSubscriptionRequest; output: String.  */
        in item 'subscribeRequest' : ArrowheadCoreData::'OrchestrationSubscriptionRequest'[0..1];
        out attribute 'subscribeResponse' : ScalarValues::String[0..1];
        doc /* unsubscribe: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/unsubscribe. Input: String; output: None.  */
        in attribute 'unsubscribeRequest' : ScalarValues::String[0..1];
        out item 'unsubscribeResponse' : JSONMessage[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestration_MQTT_IDD_Implementation :> SimpleStoreServiceOrchestration_serviceOrchestration_MQTT_IDD { @IDD_Implementation; }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestration_mqtt_pull_0' {
        doc /* Operation pull. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/pull. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/pull"; requestType = "OrchestrationRequest"; responseType = "OrchestrationResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationResponse'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestration_mqtt_subscribe_1' {
        doc /* Operation subscribe. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/subscribe. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/subscribe"; requestType = "OrchestrationSubscriptionRequest"; responseType = "String"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionRequest'[0..1];
        out attribute 'response' : ScalarValues::String[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestration_mqtt_unsubscribe_2' {
        doc /* Operation unsubscribe. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/unsubscribe. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/unsubscribe"; requestType = "String"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "serviceOrchestrationSimpleStoreManagement"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/SimpleStoreServiceOrchestrationSystemInfo.java */
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_HTTP_IDD :> SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationSimpleStoreManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/documentation/v5.3.0/SimpleStoreServiceOrchestration-v5.3.0-serviceOrchestrationSimpleStoreManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/serviceorchestration/orchestration/mgmt/simple-store";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8442 and base path /serviceorchestration/orchestration/mgmt/simple-store. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
query & POST & /query \\ \hline
remove & DELETE & /remove \\ \hline
create & POST & /create \\ \hline
modify-priorities & PUT & /modify-priorities \\ \hline
\end{longtable}

\newpage */
        doc /* query: POST /serviceorchestration/orchestration/mgmt/simple-store/query. Input: OrchestrationSimpleStoreQueryRequestDTO; output: OrchestrationSimpleStoreListResponseDTO. Returns the store records according to the filters */
        in item 'queryRequest' : ArrowheadCoreData::'OrchestrationSimpleStoreQueryRequestDTO'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponseDTO'[0..1];
        doc /* remove: DELETE /serviceorchestration/orchestration/mgmt/simple-store/remove. Input: None; output: void. Deletes the simple store records by UUID. */
        doc /* create: POST /serviceorchestration/orchestration/mgmt/simple-store/create. Input: OrchestrationSimpleStoreListRequestDTO; output: OrchestrationSimpleStoreListResponseDTO. Returns the store records that were actually created */
        in item 'createRequest' : ArrowheadCoreData::'OrchestrationSimpleStoreListRequestDTO'[0..1];
        out item 'createResponse' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponseDTO'[0..1];
        doc /* modify-priorities: PUT /serviceorchestration/orchestration/mgmt/simple-store/modify-priorities. Input: PriorityRequestDTO; output: OrchestrationSimpleStoreListResponseDTO. Returns the store records that were updated */
        in item 'modify-prioritiesRequest' : JSONMessage[0..1];
        out item 'modify-prioritiesResponse' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponseDTO'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_HTTP_IDD_Implementation :> SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_http_query_0' {
        doc /* Returns the store records according to the filters. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/simple-store/query. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/simple-store/query"; requestType = "OrchestrationSimpleStoreQueryRequestDTO"; responseType = "OrchestrationSimpleStoreListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSimpleStoreQueryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponseDTO'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_http_remove_1' {
        doc /* Deletes the simple store records by UUID.. Wire method: DELETE; address: /serviceorchestration/orchestration/mgmt/simple-store/remove. Query parameters: [{"name": "uuids", "type": "List<String>", "required": true, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/serviceorchestration/orchestration/mgmt/simple-store/remove"; requestType = "unspecified"; responseType = "void"; queryParameters = "[{\"name\": \"uuids\", \"type\": \"List<String>\", \"required\": true, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_http_create_2' {
        doc /* Returns the store records that were actually created. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/simple-store/create. Query parameters: []. Path parameters: []. Status codes: ["CREATED", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/simple-store/create"; requestType = "OrchestrationSimpleStoreListRequestDTO"; responseType = "OrchestrationSimpleStoreListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSimpleStoreListRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponseDTO'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_http_modify-priorities_3' {
        doc /* Returns the store records that were updated. Wire method: PUT; address: /serviceorchestration/orchestration/mgmt/simple-store/modify-priorities. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/serviceorchestration/orchestration/mgmt/simple-store/modify-priorities"; requestType = "PriorityRequestDTO"; responseType = "OrchestrationSimpleStoreListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponseDTO'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_MQTT_IDD :> SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationSimpleStoreManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/documentation/v5.3.0/SimpleStoreServiceOrchestration-v5.3.0-serviceOrchestrationSimpleStoreManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/serviceorchestration/orchestration/management/store/";
        doc /* create: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/store/create. Input: OrchestrationSimpleStoreListRequest; output: OrchestrationSimpleStoreListResponse.  */
        in item 'createRequest' : ArrowheadCoreData::'OrchestrationSimpleStoreListRequest'[0..1];
        out item 'createResponse' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponse'[0..1];
        doc /* query: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/store/query. Input: OrchestrationSimpleStoreQueryRequest; output: OrchestrationSimpleStoreListResponse.  */
        in item 'queryRequest' : ArrowheadCoreData::'OrchestrationSimpleStoreQueryRequest'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponse'[0..1];
        doc /* remove: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/store/remove. Input: Array<String>; output: None.  */
        in attribute 'removeRequest' : ScalarValues::String[0..*];
        out item 'removeResponse' : JSONMessage[0..1];
        doc /* modify-priorities: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/store/modify-priorities. Input: PriorityRequest; output: OrchestrationSimpleStoreListResponse.  */
        in item 'modify-prioritiesRequest' : ArrowheadCoreData::'PriorityRequest'[0..1];
        out item 'modify-prioritiesResponse' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponse'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_MQTT_IDD_Implementation :> SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_mqtt_create_0' {
        doc /* Operation create. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/store/create. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/store/create"; requestType = "OrchestrationSimpleStoreListRequest"; responseType = "OrchestrationSimpleStoreListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSimpleStoreListRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponse'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_mqtt_query_1' {
        doc /* Operation query. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/store/query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/store/query"; requestType = "OrchestrationSimpleStoreQueryRequest"; responseType = "OrchestrationSimpleStoreListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSimpleStoreQueryRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponse'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_mqtt_remove_2' {
        doc /* Operation remove. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/store/remove. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/store/remove"; requestType = "Array<String>"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_mqtt_modify-priorities_3' {
        doc /* Operation modify-priorities. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/store/modify-priorities. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/store/modify-priorities"; requestType = "PriorityRequest"; responseType = "OrchestrationSimpleStoreListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'PriorityRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSimpleStoreListResponse'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "serviceOrchestrationPushManagement"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/SimpleStoreServiceOrchestrationSystemInfo.java */
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_HTTP_IDD :> SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationPushManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/documentation/v5.3.0/SimpleStoreServiceOrchestration-v5.3.0-serviceOrchestrationPushManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/serviceorchestration/orchestration/mgmt/push";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8442 and base path /serviceorchestration/orchestration/mgmt/push. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
subscribe & POST & /subscribe \\ \hline
unsubscribe & DELETE & /unsubscribe \\ \hline
trigger & POST & /trigger \\ \hline
query & POST & /query \\ \hline
\end{longtable}

\newpage */
        doc /* subscribe: POST /serviceorchestration/orchestration/mgmt/push/subscribe. Input: OrchestrationSubscriptionListRequestDTO; output: OrchestrationSubscriptionListResponseDTO. Returns the created subscription records. Existing ones will be overwritten. */
        in item 'subscribeRequest' : ArrowheadCoreData::'OrchestrationSubscriptionListRequestDTO'[0..1];
        out item 'subscribeResponse' : ArrowheadCoreData::'OrchestrationSubscriptionListResponseDTO'[0..1];
        doc /* unsubscribe: DELETE /serviceorchestration/orchestration/mgmt/push/unsubscribe. Input: None; output: void. Removes the specified subscriptions */
        doc /* trigger: POST /serviceorchestration/orchestration/mgmt/push/trigger. Input: OrchestrationPushTriggerDTO; output: OrchestrationPushJobListResponseDTO. Returns the created push orchestration job records */
        in item 'triggerRequest' : ArrowheadCoreData::'OrchestrationPushTriggerDTO'[0..1];
        out item 'triggerResponse' : ArrowheadCoreData::'OrchestrationPushJobListResponseDTO'[0..1];
        doc /* query: POST /serviceorchestration/orchestration/mgmt/push/query. Input: OrchestrationSubscriptionQueryRequestDTO; output: OrchestrationSubscriptionListResponseDTO. Returns the required subcription records. */
        in item 'queryRequest' : ArrowheadCoreData::'OrchestrationSubscriptionQueryRequestDTO'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'OrchestrationSubscriptionListResponseDTO'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_HTTP_IDD_Implementation :> SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_http_subscribe_0' {
        doc /* Returns the created subscription records. Existing ones will be overwritten.. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/push/subscribe. Query parameters: []. Path parameters: []. Status codes: ["CREATED", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/push/subscribe"; requestType = "OrchestrationSubscriptionListRequestDTO"; responseType = "OrchestrationSubscriptionListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionListRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSubscriptionListResponseDTO'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_http_unsubscribe_1' {
        doc /* Removes the specified subscriptions. Wire method: DELETE; address: /serviceorchestration/orchestration/mgmt/push/unsubscribe. Query parameters: [{"name": "ids", "type": "List<String>", "required": true, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/serviceorchestration/orchestration/mgmt/push/unsubscribe"; requestType = "unspecified"; responseType = "void"; queryParameters = "[{\"name\": \"ids\", \"type\": \"List<String>\", \"required\": true, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_http_trigger_2' {
        doc /* Returns the created push orchestration job records. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/push/trigger. Query parameters: []. Path parameters: []. Status codes: ["CREATED", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/push/trigger"; requestType = "OrchestrationPushTriggerDTO"; responseType = "OrchestrationPushJobListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationPushTriggerDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationPushJobListResponseDTO'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_http_query_3' {
        doc /* Returns the required subcription records.. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/push/query. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/push/query"; requestType = "OrchestrationSubscriptionQueryRequestDTO"; responseType = "OrchestrationSubscriptionListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionQueryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSubscriptionListResponseDTO'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_MQTT_IDD :> SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationPushManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/documentation/v5.3.0/SimpleStoreServiceOrchestration-v5.3.0-serviceOrchestrationPushManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/serviceorchestration/orchestration/management/push/";
        doc /* subscribe: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/push/subscribe. Input: OrchestrationSubscriptionListRequest; output: OrchestrationSubscriptionListResponse.  */
        in item 'subscribeRequest' : ArrowheadCoreData::'OrchestrationSubscriptionListRequest'[0..1];
        out item 'subscribeResponse' : ArrowheadCoreData::'OrchestrationSubscriptionListResponse'[0..1];
        doc /* trigger: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/push/trigger. Input: OrchestrationPushTrigger; output: OrchestrationPushJobListResponse.  */
        in item 'triggerRequest' : ArrowheadCoreData::'OrchestrationPushTrigger'[0..1];
        out item 'triggerResponse' : ArrowheadCoreData::'OrchestrationPushJobListResponse'[0..1];
        doc /* unsubscribe: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/push/unsubscribe. Input: Array<String>; output: None.  */
        in attribute 'unsubscribeRequest' : ScalarValues::String[0..*];
        out item 'unsubscribeResponse' : JSONMessage[0..1];
        doc /* query: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/push/query. Input: OrchestrationSubscriptionQueryRequest; output: OrchestrationSubscriptionListResponse.  */
        in item 'queryRequest' : ArrowheadCoreData::'OrchestrationSubscriptionQueryRequest'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'OrchestrationSubscriptionListResponse'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_MQTT_IDD_Implementation :> SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_mqtt_subscribe_0' {
        doc /* Operation subscribe. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/push/subscribe. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/push/subscribe"; requestType = "OrchestrationSubscriptionListRequest"; responseType = "OrchestrationSubscriptionListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionListRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSubscriptionListResponse'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_mqtt_trigger_1' {
        doc /* Operation trigger. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/push/trigger. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/push/trigger"; requestType = "OrchestrationPushTrigger"; responseType = "OrchestrationPushJobListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationPushTrigger'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationPushJobListResponse'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_mqtt_unsubscribe_2' {
        doc /* Operation unsubscribe. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/push/unsubscribe. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/push/unsubscribe"; requestType = "Array<String>"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_mqtt_query_3' {
        doc /* Operation query. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/push/query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/push/query"; requestType = "OrchestrationSubscriptionQueryRequest"; responseType = "OrchestrationSubscriptionListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionQueryRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSubscriptionListResponse'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "serviceOrchestrationHistoryManagement"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/SimpleStoreServiceOrchestrationSystemInfo.java */
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_HTTP_IDD :> SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationHistoryManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/documentation/v5.3.0/SimpleStoreServiceOrchestration-v5.3.0-serviceOrchestrationHistoryManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/serviceorchestration/orchestration/mgmt/history";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8442 and base path /serviceorchestration/orchestration/mgmt/history. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
query & POST & /query \\ \hline
\end{longtable}

\newpage */
        doc /* query: POST /serviceorchestration/orchestration/mgmt/history/query. Input: OrchestrationHistoryQueryRequestDTO; output: OrchestrationHistoryResponseDTO. Returns the orchestration job history records according to the given filters. */
        in item 'queryRequest' : ArrowheadCoreData::'OrchestrationHistoryQueryRequestDTO'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'OrchestrationHistoryResponseDTO'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_HTTP_IDD_Implementation :> SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_http_query_0' {
        doc /* Returns the orchestration job history records according to the given filters.. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/history/query. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/history/query"; requestType = "OrchestrationHistoryQueryRequestDTO"; responseType = "OrchestrationHistoryResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationHistoryQueryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationHistoryResponseDTO'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_MQTT_IDD :> SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationHistoryManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/documentation/v5.3.0/SimpleStoreServiceOrchestration-v5.3.0-serviceOrchestrationHistoryManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/serviceorchestration/orchestration/management/history/";
        doc /* query: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/history/query. Input: OrchestrationHistoryQueryRequest; output: OrchestrationHistoryResponse.  */
        in item 'queryRequest' : ArrowheadCoreData::'OrchestrationHistoryQueryRequest'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'OrchestrationHistoryResponse'[0..1];
    }
    port def SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_MQTT_IDD_Implementation :> SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_mqtt_query_0' {
        doc /* Operation query. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/history/query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/history/query"; requestType = "OrchestrationHistoryQueryRequest"; responseType = "OrchestrationHistoryResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationHistoryQueryRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationHistoryResponse'[0..1];
    }
    port def SimpleStoreServiceOrchestration_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/SimpleStoreServiceOrchestrationSystemInfo.java */
    }
    port def SimpleStoreServiceOrchestration_sysMonitor_AMQP_IDD :> SimpleStoreServiceOrchestration_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/documentation/v5.3.0/SimpleStoreServiceOrchestration-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.SimpleStoreServiceOrchestration.SimpleStoreServiceOrchestration";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, SimpleStoreServiceOrchestration registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.SimpleStoreServiceOrchestration.SimpleStoreServiceOrchestration",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.SimpleStoreServiceOrchestration.SimpleStoreServiceOrchestration.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadCoreData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.SimpleStoreServiceOrchestration.SimpleStoreServiceOrchestration.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadCoreData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.SimpleStoreServiceOrchestration.SimpleStoreServiceOrchestration.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadCoreData::'Observation'[0..1];
    }
    port def SimpleStoreServiceOrchestration_sysMonitor_AMQP_IDD_Implementation :> SimpleStoreServiceOrchestration_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'SimpleStoreServiceOrchestration_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.SimpleStoreServiceOrchestration.SimpleStoreServiceOrchestration.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.SimpleStoreServiceOrchestration.SimpleStoreServiceOrchestration.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.SimpleStoreServiceOrchestration.SimpleStoreServiceOrchestration.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.SimpleStoreServiceOrchestration.SimpleStoreServiceOrchestration.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    action def 'SimpleStoreServiceOrchestration_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.SimpleStoreServiceOrchestration.SimpleStoreServiceOrchestration.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.SimpleStoreServiceOrchestration.SimpleStoreServiceOrchestration.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    part def SimpleStoreServiceOrchestration_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "SimpleStoreServiceOrchestration"; FunctionalProperties = "Java release 5.3 core system SimpleStoreServiceOrchestration"; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/SimpleStoreServiceOrchestrationSystemInfo.java"; }
        doc /* Java release 5.3 core system SimpleStoreServiceOrchestration */
        port 'generalManagement_SD' : SimpleStoreServiceOrchestration_generalManagement_SD { @FullPort; }
        port 'serviceOrchestration_SD' : SimpleStoreServiceOrchestration_serviceOrchestration_SD { @FullPort; }
        port 'serviceOrchestrationSimpleStoreManagement_SD' : SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_SD { @FullPort; }
        port 'serviceOrchestrationPushManagement_SD' : SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_SD { @FullPort; }
        port 'serviceOrchestrationHistoryManagement_SD' : SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_SD { @FullPort; }
        port 'sysMonitor_SD' : SimpleStoreServiceOrchestration_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, Blacklist, ConsumerAuthorization, ServiceRegistry, Subscribers. These are external requirements, not assumed co-deployments. */
    }
    part def SimpleStoreServiceOrchestration_SysDD :> SimpleStoreServiceOrchestration_SysD {
        @SysDD;
        port 'generalManagement_http' : SimpleStoreServiceOrchestration_generalManagement_HTTP_IDD { @FullPort; }
        port 'generalManagement_mqtt' : SimpleStoreServiceOrchestration_generalManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'serviceOrchestration_http' : SimpleStoreServiceOrchestration_serviceOrchestration_HTTP_IDD { @FullPort; }
        port 'serviceOrchestration_mqtt' : SimpleStoreServiceOrchestration_serviceOrchestration_MQTT_IDD[0..1] { @FullPort; }
        port 'serviceOrchestrationSimpleStoreManagement_http' : SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_HTTP_IDD { @FullPort; }
        port 'serviceOrchestrationSimpleStoreManagement_mqtt' : SimpleStoreServiceOrchestration_serviceOrchestrationSimpleStoreManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'serviceOrchestrationPushManagement_http' : SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_HTTP_IDD { @FullPort; }
        port 'serviceOrchestrationPushManagement_mqtt' : SimpleStoreServiceOrchestration_serviceOrchestrationPushManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'serviceOrchestrationHistoryManagement_http' : SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_HTTP_IDD { @FullPort; }
        port 'serviceOrchestrationHistoryManagement_mqtt' : SimpleStoreServiceOrchestration_serviceOrchestrationHistoryManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'sysMonitor_amqp' : SimpleStoreServiceOrchestration_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def SimpleStoreServiceOrchestration :> SimpleStoreServiceOrchestration_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8442;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
}
