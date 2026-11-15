library package ArrowheadDynamicServiceOrchestration {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def DynamicServiceOrchestration_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-dynamic/src/main/java/eu/arrowhead/serviceorchestration/DynamicServiceOrchestrationSystemInfo.java */
    }
    port def DynamicServiceOrchestration_generalManagement_HTTP_IDD :> DynamicServiceOrchestration_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-generalManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/serviceorchestration/general/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8441 and base path /serviceorchestration/general/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

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
    port def DynamicServiceOrchestration_generalManagement_HTTP_IDD_Implementation :> DynamicServiceOrchestration_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_generalManagement_http_get-log_0' {
        doc /* Returns the log entries. Wire method: POST; address: /serviceorchestration/general/mgmt/logs. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/general/mgmt/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'DynamicServiceOrchestration_generalManagement_http_get-config_1' {
        doc /* Returns a list of configurations. Wire method: GET; address: /serviceorchestration/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/serviceorchestration/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def DynamicServiceOrchestration_generalManagement_MQTT_IDD :> DynamicServiceOrchestration_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-generalManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/serviceorchestration/general/management/";
        doc /* get-log: REQUEST_REPLY arrowhead/serviceorchestration/general/management/get-log. Input: LogRequest; output: LogEntryListResponse.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequest'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponse'[0..1];
        doc /* get-config: REQUEST_REPLY arrowhead/serviceorchestration/general/management/get-config. Input: Array<String>; output: KeyValues.  */
        in attribute 'get-configRequest' : ScalarValues::String[0..*];
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValues'[0..1];
    }
    port def DynamicServiceOrchestration_generalManagement_MQTT_IDD_Implementation :> DynamicServiceOrchestration_generalManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_generalManagement_mqtt_get-log_0' {
        doc /* Operation get-log. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/general/management/get-log. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/general/management/get-log"; requestType = "LogRequest"; responseType = "LogEntryListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'LogRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponse'[0..1];
    }
    action def 'DynamicServiceOrchestration_generalManagement_mqtt_get-config_1' {
        doc /* Operation get-config. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/general/management/get-config. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/general/management/get-config"; requestType = "Array<String>"; responseType = "KeyValues"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : ArrowheadCoreData::'KeyValues'[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestration_SD :> ArrowheadService {
        @SD { MicroserviceName = "serviceOrchestration"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-dynamic/src/main/java/eu/arrowhead/serviceorchestration/DynamicServiceOrchestrationSystemInfo.java */
    }
    port def DynamicServiceOrchestration_serviceOrchestration_HTTP_IDD :> DynamicServiceOrchestration_serviceOrchestration_SD {
        @IDD { MicroserviceName = "serviceOrchestration"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-serviceOrchestration-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/serviceorchestration/orchestration";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8441 and base path /serviceorchestration/orchestration. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
pull & POST & /pull \\ \hline
subscribe & POST & /subscribe \\ \hline
unsubscribe & DELETE & \texttt{/unsubscribe/{id}} \\ \hline
\end{longtable}

\newpage */
        doc /* pull: POST /serviceorchestration/orchestration/pull. Input: OrchestrationRequestDTO; output: OrchestrationResponseDTO. Returns the dynamically produced orchestration results */
        in item 'pullRequest' : ArrowheadCoreData::'OrchestrationRequestDTO'[0..1];
        out item 'pullResponse' : ArrowheadCoreData::'OrchestrationResponseDTO'[0..1];
        doc /* subscribe: POST /serviceorchestration/orchestration/subscribe. Input: OrchestrationSubscriptionRequestDTO; output: ResponseEntity<String>. Returns a subscription id. Existing subscriptions will be overwritten. */
        in item 'subscribeRequest' : ArrowheadCoreData::'OrchestrationSubscriptionRequestDTO'[0..1];
        out attribute 'subscribeResponse' : ScalarValues::String[0..1];
        doc /* unsubscribe: DELETE /serviceorchestration/orchestration/unsubscribe/{id}. Input: None; output: ResponseEntity<Void>. Removes the subscription by the given id */
    }
    port def DynamicServiceOrchestration_serviceOrchestration_HTTP_IDD_Implementation :> DynamicServiceOrchestration_serviceOrchestration_HTTP_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_serviceOrchestration_http_pull_0' {
        doc /* Returns the dynamically produced orchestration results. Wire method: POST; address: /serviceorchestration/orchestration/pull. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/pull"; requestType = "OrchestrationRequestDTO"; responseType = "OrchestrationResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationResponseDTO'[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestration_http_subscribe_1' {
        doc /* Returns a subscription id. Existing subscriptions will be overwritten.. Wire method: POST; address: /serviceorchestration/orchestration/subscribe. Query parameters: [{"name": "trigger", "type": "Boolean", "required": false, "default": "false"}]. Path parameters: []. Status codes: ["CREATED", "OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/subscribe"; requestType = "OrchestrationSubscriptionRequestDTO"; responseType = "ResponseEntity<String>"; queryParameters = "[{\"name\": \"trigger\", \"type\": \"Boolean\", \"required\": false, \"default\": \"false\"}]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionRequestDTO'[0..1];
        out attribute 'response' : ScalarValues::String[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestration_http_unsubscribe_2' {
        doc /* Removes the subscription by the given id. Wire method: DELETE; address: /serviceorchestration/orchestration/unsubscribe/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: ["OK", "NO_CONTENT", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/serviceorchestration/orchestration/unsubscribe/{id}"; requestType = "unspecified"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[\"OK\", \"NO_CONTENT\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
    }
    port def DynamicServiceOrchestration_serviceOrchestration_MQTT_IDD :> DynamicServiceOrchestration_serviceOrchestration_SD {
        @IDD { MicroserviceName = "serviceOrchestration"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-serviceOrchestration-MQTT-IDD.tex"; }
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
    port def DynamicServiceOrchestration_serviceOrchestration_MQTT_IDD_Implementation :> DynamicServiceOrchestration_serviceOrchestration_MQTT_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_serviceOrchestration_mqtt_pull_0' {
        doc /* Operation pull. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/pull. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/pull"; requestType = "OrchestrationRequest"; responseType = "OrchestrationResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationResponse'[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestration_mqtt_subscribe_1' {
        doc /* Operation subscribe. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/subscribe. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/subscribe"; requestType = "OrchestrationSubscriptionRequest"; responseType = "String"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionRequest'[0..1];
        out attribute 'response' : ScalarValues::String[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestration_mqtt_unsubscribe_2' {
        doc /* Operation unsubscribe. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/unsubscribe. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/unsubscribe"; requestType = "String"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationPushManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "serviceOrchestrationPushManagement"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-dynamic/src/main/java/eu/arrowhead/serviceorchestration/DynamicServiceOrchestrationSystemInfo.java */
    }
    port def DynamicServiceOrchestration_serviceOrchestrationPushManagement_HTTP_IDD :> DynamicServiceOrchestration_serviceOrchestrationPushManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationPushManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-serviceOrchestrationPushManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/serviceorchestration/orchestration/mgmt/push";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8441 and base path /serviceorchestration/orchestration/mgmt/push. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

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
    port def DynamicServiceOrchestration_serviceOrchestrationPushManagement_HTTP_IDD_Implementation :> DynamicServiceOrchestration_serviceOrchestrationPushManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_serviceOrchestrationPushManagement_http_subscribe_0' {
        doc /* Returns the created subscription records. Existing ones will be overwritten.. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/push/subscribe. Query parameters: []. Path parameters: []. Status codes: ["CREATED", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/push/subscribe"; requestType = "OrchestrationSubscriptionListRequestDTO"; responseType = "OrchestrationSubscriptionListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionListRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSubscriptionListResponseDTO'[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestrationPushManagement_http_unsubscribe_1' {
        doc /* Removes the specified subscriptions. Wire method: DELETE; address: /serviceorchestration/orchestration/mgmt/push/unsubscribe. Query parameters: [{"name": "ids", "type": "List<String>", "required": true, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/serviceorchestration/orchestration/mgmt/push/unsubscribe"; requestType = "unspecified"; responseType = "void"; queryParameters = "[{\"name\": \"ids\", \"type\": \"List<String>\", \"required\": true, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
    }
    action def 'DynamicServiceOrchestration_serviceOrchestrationPushManagement_http_trigger_2' {
        doc /* Returns the created push orchestration job records. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/push/trigger. Query parameters: []. Path parameters: []. Status codes: ["CREATED", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/push/trigger"; requestType = "OrchestrationPushTriggerDTO"; responseType = "OrchestrationPushJobListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationPushTriggerDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationPushJobListResponseDTO'[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestrationPushManagement_http_query_3' {
        doc /* Returns the required subcription records.. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/push/query. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/push/query"; requestType = "OrchestrationSubscriptionQueryRequestDTO"; responseType = "OrchestrationSubscriptionListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionQueryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSubscriptionListResponseDTO'[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationPushManagement_MQTT_IDD :> DynamicServiceOrchestration_serviceOrchestrationPushManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationPushManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-serviceOrchestrationPushManagement-MQTT-IDD.tex"; }
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
    port def DynamicServiceOrchestration_serviceOrchestrationPushManagement_MQTT_IDD_Implementation :> DynamicServiceOrchestration_serviceOrchestrationPushManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_serviceOrchestrationPushManagement_mqtt_subscribe_0' {
        doc /* Operation subscribe. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/push/subscribe. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/push/subscribe"; requestType = "OrchestrationSubscriptionListRequest"; responseType = "OrchestrationSubscriptionListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionListRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSubscriptionListResponse'[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestrationPushManagement_mqtt_trigger_1' {
        doc /* Operation trigger. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/push/trigger. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/push/trigger"; requestType = "OrchestrationPushTrigger"; responseType = "OrchestrationPushJobListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationPushTrigger'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationPushJobListResponse'[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestrationPushManagement_mqtt_unsubscribe_2' {
        doc /* Operation unsubscribe. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/push/unsubscribe. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/push/unsubscribe"; requestType = "Array<String>"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestrationPushManagement_mqtt_query_3' {
        doc /* Operation query. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/push/query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/push/query"; requestType = "OrchestrationSubscriptionQueryRequest"; responseType = "OrchestrationSubscriptionListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationSubscriptionQueryRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationSubscriptionListResponse'[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationLockManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "serviceOrchestrationLockManagement"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-dynamic/src/main/java/eu/arrowhead/serviceorchestration/DynamicServiceOrchestrationSystemInfo.java */
    }
    port def DynamicServiceOrchestration_serviceOrchestrationLockManagement_HTTP_IDD :> DynamicServiceOrchestration_serviceOrchestrationLockManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationLockManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-serviceOrchestrationLockManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/serviceorchestration/orchestration/mgmt/lock";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8441 and base path /serviceorchestration/orchestration/mgmt/lock. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
query & POST & /query \\ \hline
remove & DELETE & \texttt{/remove/{owner}} \\ \hline
create & POST & /create \\ \hline
\end{longtable}

\newpage */
        doc /* query: POST /serviceorchestration/orchestration/mgmt/lock/query. Input: OrchestrationLockQueryRequestDTO; output: OrchestrationLockListResponseDTO. Returns the lock records according to the given filters */
        in item 'queryRequest' : ArrowheadCoreData::'OrchestrationLockQueryRequestDTO'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'OrchestrationLockListResponseDTO'[0..1];
        doc /* remove: DELETE /serviceorchestration/orchestration/mgmt/lock/remove/{owner}. Input: None; output: void. Deletes the existing lock entries */
        doc /* create: POST /serviceorchestration/orchestration/mgmt/lock/create. Input: OrchestrationLockListRequestDTO; output: OrchestrationLockListResponseDTO. Returns the created lock records */
        in item 'createRequest' : ArrowheadCoreData::'OrchestrationLockListRequestDTO'[0..1];
        out item 'createResponse' : ArrowheadCoreData::'OrchestrationLockListResponseDTO'[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationLockManagement_HTTP_IDD_Implementation :> DynamicServiceOrchestration_serviceOrchestrationLockManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_serviceOrchestrationLockManagement_http_query_0' {
        doc /* Returns the lock records according to the given filters. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/lock/query. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/lock/query"; requestType = "OrchestrationLockQueryRequestDTO"; responseType = "OrchestrationLockListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationLockQueryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationLockListResponseDTO'[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestrationLockManagement_http_remove_1' {
        doc /* Deletes the existing lock entries. Wire method: DELETE; address: /serviceorchestration/orchestration/mgmt/lock/remove/{owner}. Query parameters: [{"name": "instanceIds", "type": "List<String>", "required": true, "default": null}]. Path parameters: ["owner"]. Status codes: ["OK", "NO_CONTENT", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/serviceorchestration/orchestration/mgmt/lock/remove/{owner}"; requestType = "unspecified"; responseType = "void"; queryParameters = "[{\"name\": \"instanceIds\", \"type\": \"List<String>\", \"required\": true, \"default\": null}]"; pathParameters = "[\"owner\"]"; statusCodes = "[\"OK\", \"NO_CONTENT\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
    }
    action def 'DynamicServiceOrchestration_serviceOrchestrationLockManagement_http_create_2' {
        doc /* Returns the created lock records. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/lock/create. Query parameters: []. Path parameters: []. Status codes: ["CREATED", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/lock/create"; requestType = "OrchestrationLockListRequestDTO"; responseType = "OrchestrationLockListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationLockListRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationLockListResponseDTO'[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationLockManagement_MQTT_IDD :> DynamicServiceOrchestration_serviceOrchestrationLockManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationLockManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-serviceOrchestrationLockManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/serviceorchestration/orchestration/management/lock/";
        doc /* create: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/lock/create. Input: OrchestrationLockListRequest; output: OrchestrationLockListResponse.  */
        in item 'createRequest' : ArrowheadCoreData::'OrchestrationLockListRequest'[0..1];
        out item 'createResponse' : ArrowheadCoreData::'OrchestrationLockListResponse'[0..1];
        doc /* query: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/lock/query. Input: OrchestrationLockQueryRequest; output: OrchestrationLockListResponse.  */
        in item 'queryRequest' : ArrowheadCoreData::'OrchestrationLockQueryRequest'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'OrchestrationLockListResponse'[0..1];
        doc /* remove: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/lock/remove. Input: Array<String>; output: None.  */
        in attribute 'removeRequest' : ScalarValues::String[0..*];
        out item 'removeResponse' : JSONMessage[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationLockManagement_MQTT_IDD_Implementation :> DynamicServiceOrchestration_serviceOrchestrationLockManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_serviceOrchestrationLockManagement_mqtt_create_0' {
        doc /* Operation create. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/lock/create. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/lock/create"; requestType = "OrchestrationLockListRequest"; responseType = "OrchestrationLockListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationLockListRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationLockListResponse'[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestrationLockManagement_mqtt_query_1' {
        doc /* Operation query. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/lock/query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/lock/query"; requestType = "OrchestrationLockQueryRequest"; responseType = "OrchestrationLockListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationLockQueryRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationLockListResponse'[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestrationLockManagement_mqtt_remove_2' {
        doc /* Operation remove. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/lock/remove. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/lock/remove"; requestType = "Array<String>"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : JSONMessage[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "serviceOrchestrationHistoryManagement"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-dynamic/src/main/java/eu/arrowhead/serviceorchestration/DynamicServiceOrchestrationSystemInfo.java */
    }
    port def DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_HTTP_IDD :> DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationHistoryManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-serviceOrchestrationHistoryManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/serviceorchestration/orchestration/mgmt/history";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8441 and base path /serviceorchestration/orchestration/mgmt/history. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
query & POST & /query \\ \hline
\end{longtable}

\newpage */
        doc /* query: POST /serviceorchestration/orchestration/mgmt/history/query. Input: OrchestrationHistoryQueryRequestDTO; output: OrchestrationHistoryResponseDTO. Returns the orchestration job history records according to the given filters. */
        in item 'queryRequest' : ArrowheadCoreData::'OrchestrationHistoryQueryRequestDTO'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'OrchestrationHistoryResponseDTO'[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_HTTP_IDD_Implementation :> DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_http_query_0' {
        doc /* Returns the orchestration job history records according to the given filters.. Wire method: POST; address: /serviceorchestration/orchestration/mgmt/history/query. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/orchestration/mgmt/history/query"; requestType = "OrchestrationHistoryQueryRequestDTO"; responseType = "OrchestrationHistoryResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationHistoryQueryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationHistoryResponseDTO'[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_MQTT_IDD :> DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationHistoryManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-serviceOrchestrationHistoryManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/serviceorchestration/orchestration/management/history/";
        doc /* query: REQUEST_REPLY arrowhead/serviceorchestration/orchestration/management/history/query. Input: OrchestrationHistoryQueryRequest; output: OrchestrationHistoryResponse.  */
        in item 'queryRequest' : ArrowheadCoreData::'OrchestrationHistoryQueryRequest'[0..1];
        out item 'queryResponse' : ArrowheadCoreData::'OrchestrationHistoryResponse'[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_MQTT_IDD_Implementation :> DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_mqtt_query_0' {
        doc /* Operation query. Wire method: REQUEST_REPLY; address: arrowhead/serviceorchestration/orchestration/management/history/query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/serviceorchestration/orchestration/management/history/query"; requestType = "OrchestrationHistoryQueryRequest"; responseType = "OrchestrationHistoryResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationHistoryQueryRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationHistoryResponse'[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationPlantManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "serviceOrchestrationPlantManagement"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-dynamic/src/main/java/eu/arrowhead/serviceorchestration/DynamicServiceOrchestrationSystemInfo.java */
    }
    port def DynamicServiceOrchestration_serviceOrchestrationPlantManagement_HTTP_IDD :> DynamicServiceOrchestration_serviceOrchestrationPlantManagement_SD {
        @IDD { MicroserviceName = "serviceOrchestrationPlantManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-serviceOrchestrationPlantManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/serviceorchestration/mgmt/plant-rules";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8441 and base path /serviceorchestration/mgmt/plant-rules. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
query & POST & /query \\ \hline
replace & PUT & /replace \\ \hline
\end{longtable}

\newpage */
        doc /* query: POST /serviceorchestration/mgmt/plant-rules/query. Input: None; output: OrchestrationPlantRulesDTO. Returns the active engineered plant snapshot */
        out item 'queryResponse' : ArrowheadCoreData::'OrchestrationPlantRulesDTO'[0..1];
        doc /* replace: PUT /serviceorchestration/mgmt/plant-rules/replace. Input: OrchestrationPlantRulesDTO; output: OrchestrationPlantRulesDTO. Atomically replaces all active-plant scopes; empty rules clears the snapshot */
        in item 'replaceRequest' : ArrowheadCoreData::'OrchestrationPlantRulesDTO'[0..1];
        out item 'replaceResponse' : ArrowheadCoreData::'OrchestrationPlantRulesDTO'[0..1];
    }
    port def DynamicServiceOrchestration_serviceOrchestrationPlantManagement_HTTP_IDD_Implementation :> DynamicServiceOrchestration_serviceOrchestrationPlantManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_serviceOrchestrationPlantManagement_http_query_0' {
        doc /* Returns the active engineered plant snapshot. Wire method: POST; address: /serviceorchestration/mgmt/plant-rules/query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/serviceorchestration/mgmt/plant-rules/query"; requestType = "unspecified"; responseType = "OrchestrationPlantRulesDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'OrchestrationPlantRulesDTO'[0..1];
    }
    action def 'DynamicServiceOrchestration_serviceOrchestrationPlantManagement_http_replace_1' {
        doc /* Atomically replaces all active-plant scopes; empty rules clears the snapshot. Wire method: PUT; address: /serviceorchestration/mgmt/plant-rules/replace. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/serviceorchestration/mgmt/plant-rules/replace"; requestType = "OrchestrationPlantRulesDTO"; responseType = "OrchestrationPlantRulesDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'OrchestrationPlantRulesDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'OrchestrationPlantRulesDTO'[0..1];
    }
    port def DynamicServiceOrchestration_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/serviceorchestration-dynamic/src/main/java/eu/arrowhead/serviceorchestration/DynamicServiceOrchestrationSystemInfo.java */
    }
    port def DynamicServiceOrchestration_sysMonitor_AMQP_IDD :> DynamicServiceOrchestration_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/documentation/v5.3.0/DynamicServiceOrchestration-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.DynamicServiceOrchestration.DynamicServiceOrchestration";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, DynamicServiceOrchestration registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.DynamicServiceOrchestration.DynamicServiceOrchestration",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.DynamicServiceOrchestration.DynamicServiceOrchestration.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadCoreData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.DynamicServiceOrchestration.DynamicServiceOrchestration.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadCoreData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.DynamicServiceOrchestration.DynamicServiceOrchestration.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadCoreData::'Observation'[0..1];
    }
    port def DynamicServiceOrchestration_sysMonitor_AMQP_IDD_Implementation :> DynamicServiceOrchestration_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'DynamicServiceOrchestration_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DynamicServiceOrchestration.DynamicServiceOrchestration.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DynamicServiceOrchestration.DynamicServiceOrchestration.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    action def 'DynamicServiceOrchestration_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DynamicServiceOrchestration.DynamicServiceOrchestration.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DynamicServiceOrchestration.DynamicServiceOrchestration.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    action def 'DynamicServiceOrchestration_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DynamicServiceOrchestration.DynamicServiceOrchestration.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DynamicServiceOrchestration.DynamicServiceOrchestration.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    part def DynamicServiceOrchestration_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "DynamicServiceOrchestration"; FunctionalProperties = "Java release 5.3 core system DynamicServiceOrchestration"; }
        @SourceTrace { path = "ah5-core-java-spring/serviceorchestration-dynamic/src/main/java/eu/arrowhead/serviceorchestration/DynamicServiceOrchestrationSystemInfo.java"; }
        doc /* Java release 5.3 core system DynamicServiceOrchestration */
        port 'generalManagement_SD' : DynamicServiceOrchestration_generalManagement_SD { @FullPort; }
        port 'serviceOrchestration_SD' : DynamicServiceOrchestration_serviceOrchestration_SD { @FullPort; }
        port 'serviceOrchestrationPushManagement_SD' : DynamicServiceOrchestration_serviceOrchestrationPushManagement_SD { @FullPort; }
        port 'serviceOrchestrationLockManagement_SD' : DynamicServiceOrchestration_serviceOrchestrationLockManagement_SD { @FullPort; }
        port 'serviceOrchestrationHistoryManagement_SD' : DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_SD { @FullPort; }
        port 'serviceOrchestrationPlantManagement_SD' : DynamicServiceOrchestration_serviceOrchestrationPlantManagement_SD { @FullPort; }
        port 'sysMonitor_SD' : DynamicServiceOrchestration_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, Blacklist, ConsumerAuthorization, DeviceQoSEvaluator, Gatekeeper, ServiceRegistry, Subscribers, TranslationManager. These are external requirements, not assumed co-deployments. */
    }
    part def DynamicServiceOrchestration_SysDD :> DynamicServiceOrchestration_SysD {
        @SysDD;
        port 'generalManagement_http' : DynamicServiceOrchestration_generalManagement_HTTP_IDD { @FullPort; }
        port 'generalManagement_mqtt' : DynamicServiceOrchestration_generalManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'serviceOrchestration_http' : DynamicServiceOrchestration_serviceOrchestration_HTTP_IDD { @FullPort; }
        port 'serviceOrchestration_mqtt' : DynamicServiceOrchestration_serviceOrchestration_MQTT_IDD[0..1] { @FullPort; }
        port 'serviceOrchestrationPushManagement_http' : DynamicServiceOrchestration_serviceOrchestrationPushManagement_HTTP_IDD { @FullPort; }
        port 'serviceOrchestrationPushManagement_mqtt' : DynamicServiceOrchestration_serviceOrchestrationPushManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'serviceOrchestrationLockManagement_http' : DynamicServiceOrchestration_serviceOrchestrationLockManagement_HTTP_IDD { @FullPort; }
        port 'serviceOrchestrationLockManagement_mqtt' : DynamicServiceOrchestration_serviceOrchestrationLockManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'serviceOrchestrationHistoryManagement_http' : DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_HTTP_IDD { @FullPort; }
        port 'serviceOrchestrationHistoryManagement_mqtt' : DynamicServiceOrchestration_serviceOrchestrationHistoryManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'serviceOrchestrationPlantManagement_http' : DynamicServiceOrchestration_serviceOrchestrationPlantManagement_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : DynamicServiceOrchestration_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def DynamicServiceOrchestration :> DynamicServiceOrchestration_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8441;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
}
