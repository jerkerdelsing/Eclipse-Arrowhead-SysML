library package ArrowheadAuthentication {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def Authentication_identity_SD :> ArrowheadService {
        @SD { MicroserviceName = "identity"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/AuthenticationSystemInfo.java */
    }
    port def Authentication_identity_HTTP_IDD :> Authentication_identity_SD {
        @IDD { MicroserviceName = "identity"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/authentication/documentation/v5.3.0/Authentication-v5.3.0-identity-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/authentication/identity";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8444 and base path /authentication/identity. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
identity-login & POST & /login \\ \hline
identity-logout & POST & /logout \\ \hline
identity-change-credentials & POST & /change \\ \hline
identity-verify & GET & \texttt{/verify/{token}} \\ \hline
\end{longtable}

\newpage */
        doc /* identity-login: POST /authentication/identity/login. Input: IdentityRequestDTO; output: IdentityLoginResponseDTO. Returns an identity token for the identified system */
        in item 'identity-loginRequest' : ArrowheadCoreData::'IdentityRequestDTO'[0..1];
        out item 'identity-loginResponse' : ArrowheadCoreData::'IdentityLoginResponseDTO'[0..1];
        doc /* identity-logout: POST /authentication/identity/logout. Input: IdentityRequestDTO; output: void. Logs out from the Local Cloud */
        in item 'identity-logoutRequest' : ArrowheadCoreData::'IdentityRequestDTO'[0..1];
        doc /* identity-change-credentials: POST /authentication/identity/change. Input: IdentityChangeRequestDTO; output: void. Changes the credentials (where it is possible) of the identified system */
        in item 'identity-change-credentialsRequest' : ArrowheadCoreData::'IdentityChangeRequestDTO'[0..1];
        doc /* identity-verify: GET /authentication/identity/verify/{token}. Input: None; output: IdentityVerifyResponseDTO. Returns information about a system (if verified) based on token */
        out item 'identity-verifyResponse' : ArrowheadCoreData::'IdentityVerifyResponseDTO'[0..1];
    }
    port def Authentication_identity_HTTP_IDD_Implementation :> Authentication_identity_HTTP_IDD { @IDD_Implementation; }
    action def 'Authentication_identity_http_identity-login_0' {
        doc /* Returns an identity token for the identified system. Wire method: POST; address: /authentication/identity/login. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/authentication/identity/login"; requestType = "IdentityRequestDTO"; responseType = "IdentityLoginResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
        in item 'request' : ArrowheadCoreData::'IdentityRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'IdentityLoginResponseDTO'[0..1];
    }
    action def 'Authentication_identity_http_identity-logout_1' {
        doc /* Logs out from the Local Cloud. Wire method: POST; address: /authentication/identity/logout. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/authentication/identity/logout"; requestType = "IdentityRequestDTO"; responseType = "void"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
        in item 'request' : ArrowheadCoreData::'IdentityRequestDTO'[0..1];
    }
    action def 'Authentication_identity_http_identity-change-credentials_2' {
        doc /* Changes the credentials (where it is possible) of the identified system. Wire method: POST; address: /authentication/identity/change. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/authentication/identity/change"; requestType = "IdentityChangeRequestDTO"; responseType = "void"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
        in item 'request' : ArrowheadCoreData::'IdentityChangeRequestDTO'[0..1];
    }
    action def 'Authentication_identity_http_identity-verify_3' {
        doc /* Returns information about a system (if verified) based on token. Wire method: GET; address: /authentication/identity/verify/{token}. Query parameters: []. Path parameters: ["token"]. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/authentication/identity/verify/{token}"; requestType = "unspecified"; responseType = "IdentityVerifyResponseDTO"; queryParameters = "[]"; pathParameters = "[\"token\"]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"INTERNAL_SERVER_ERROR\"]"; }
        out item 'response' : ArrowheadCoreData::'IdentityVerifyResponseDTO'[0..1];
    }
    port def Authentication_identity_MQTT_IDD :> Authentication_identity_SD {
        @IDD { MicroserviceName = "identity"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/authentication/documentation/v5.3.0/Authentication-v5.3.0-identity-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/authentication/identity/";
        doc /* identity-login: REQUEST_REPLY arrowhead/authentication/identity/identity-login. Input: IdentityRequest; output: IdentityLoginResponse.  */
        in item 'identity-loginRequest' : ArrowheadCoreData::'IdentityRequest'[0..1];
        out item 'identity-loginResponse' : ArrowheadCoreData::'IdentityLoginResponse'[0..1];
        doc /* identity-logout: REQUEST_REPLY arrowhead/authentication/identity/identity-logout. Input: IdentityRequest; output: None.  */
        in item 'identity-logoutRequest' : ArrowheadCoreData::'IdentityRequest'[0..1];
        out item 'identity-logoutResponse' : JSONMessage[0..1];
        doc /* identity-change-credentials: REQUEST_REPLY arrowhead/authentication/identity/identity-change-credentials. Input: IdentityChangeRequest; output: None.  */
        in item 'identity-change-credentialsRequest' : ArrowheadCoreData::'IdentityChangeRequest'[0..1];
        out item 'identity-change-credentialsResponse' : JSONMessage[0..1];
        doc /* identity-verify: REQUEST_REPLY arrowhead/authentication/identity/identity-verify. Input: String; output: IdentityVerifyResponse.  */
        in attribute 'identity-verifyRequest' : ScalarValues::String[0..1];
        out item 'identity-verifyResponse' : ArrowheadCoreData::'IdentityVerifyResponse'[0..1];
    }
    port def Authentication_identity_MQTT_IDD_Implementation :> Authentication_identity_MQTT_IDD { @IDD_Implementation; }
    action def 'Authentication_identity_mqtt_identity-login_0' {
        doc /* Operation identity-login. Wire method: REQUEST_REPLY; address: arrowhead/authentication/identity/identity-login. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/identity/identity-login"; requestType = "IdentityRequest"; responseType = "IdentityLoginResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'IdentityRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'IdentityLoginResponse'[0..1];
    }
    action def 'Authentication_identity_mqtt_identity-logout_1' {
        doc /* Operation identity-logout. Wire method: REQUEST_REPLY; address: arrowhead/authentication/identity/identity-logout. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/identity/identity-logout"; requestType = "IdentityRequest"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'IdentityRequest'[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'Authentication_identity_mqtt_identity-change-credentials_2' {
        doc /* Operation identity-change-credentials. Wire method: REQUEST_REPLY; address: arrowhead/authentication/identity/identity-change-credentials. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/identity/identity-change-credentials"; requestType = "IdentityChangeRequest"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'IdentityChangeRequest'[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'Authentication_identity_mqtt_identity-verify_3' {
        doc /* Operation identity-verify. Wire method: REQUEST_REPLY; address: arrowhead/authentication/identity/identity-verify. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/identity/identity-verify"; requestType = "String"; responseType = "IdentityVerifyResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..1];
        out item 'response' : ArrowheadCoreData::'IdentityVerifyResponse'[0..1];
    }
    port def Authentication_identityManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "identityManagement"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/AuthenticationSystemInfo.java */
    }
    port def Authentication_identityManagement_HTTP_IDD :> Authentication_identityManagement_SD {
        @IDD { MicroserviceName = "identityManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/authentication/documentation/v5.3.0/Authentication-v5.3.0-identityManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/authentication/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8444 and base path /authentication/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
identity-mgmt-create & POST & /identities \\ \hline
identity-mgmt-update & PUT & /identities \\ \hline
identity-mgmt-remove & DELETE & /identities \\ \hline
identity-mgmt-query & POST & /identities/query \\ \hline
identity-mgmt-session-close & DELETE & /sessions \\ \hline
identity-mgmt-session-query & POST & /sessions \\ \hline
\end{longtable}

\newpage */
        doc /* identity-mgmt-create: POST /authentication/mgmt/identities. Input: IdentityListMgmtCreateRequestDTO; output: IdentityListMgmtResponseDTO. Returns the created system identities (without sensitive information) */
        in item 'identity-mgmt-createRequest' : ArrowheadCoreData::'IdentityListMgmtCreateRequestDTO'[0..1];
        out item 'identity-mgmt-createResponse' : ArrowheadCoreData::'IdentityListMgmtResponseDTO'[0..1];
        doc /* identity-mgmt-update: PUT /authentication/mgmt/identities. Input: IdentityListMgmtUpdateRequestDTO; output: IdentityListMgmtResponseDTO. Returns the updated system identities (without sensitive information) */
        in item 'identity-mgmt-updateRequest' : ArrowheadCoreData::'IdentityListMgmtUpdateRequestDTO'[0..1];
        out item 'identity-mgmt-updateResponse' : ArrowheadCoreData::'IdentityListMgmtResponseDTO'[0..1];
        doc /* identity-mgmt-remove: DELETE /authentication/mgmt/identities. Input: None; output: void. Deletes the defined system identities */
        doc /* identity-mgmt-query: POST /authentication/mgmt/identities/query. Input: IdentityQueryRequestDTO; output: IdentityListMgmtResponseDTO. Returns the identifiable systems according to the query request */
        in item 'identity-mgmt-queryRequest' : ArrowheadCoreData::'IdentityQueryRequestDTO'[0..1];
        out item 'identity-mgmt-queryResponse' : ArrowheadCoreData::'IdentityListMgmtResponseDTO'[0..1];
        doc /* identity-mgmt-session-close: DELETE /authentication/mgmt/sessions. Input: None; output: void. Closes the defined system identities' active sessions */
        doc /* identity-mgmt-session-query: POST /authentication/mgmt/sessions. Input: IdentitySessionQueryRequestDTO; output: IdentitySessionListMgmtResponseDTO. Returns the active sessions according to the query request */
        in item 'identity-mgmt-session-queryRequest' : ArrowheadCoreData::'IdentitySessionQueryRequestDTO'[0..1];
        out item 'identity-mgmt-session-queryResponse' : ArrowheadCoreData::'IdentitySessionListMgmtResponseDTO'[0..1];
    }
    port def Authentication_identityManagement_HTTP_IDD_Implementation :> Authentication_identityManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'Authentication_identityManagement_http_identity-mgmt-create_0' {
        doc /* Returns the created system identities (without sensitive information). Wire method: POST; address: /authentication/mgmt/identities. Query parameters: []. Path parameters: []. Status codes: ["CREATED", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/authentication/mgmt/identities"; requestType = "IdentityListMgmtCreateRequestDTO"; responseType = "IdentityListMgmtResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"CREATED\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
        in item 'request' : ArrowheadCoreData::'IdentityListMgmtCreateRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'IdentityListMgmtResponseDTO'[0..1];
    }
    action def 'Authentication_identityManagement_http_identity-mgmt-update_1' {
        doc /* Returns the updated system identities (without sensitive information). Wire method: PUT; address: /authentication/mgmt/identities. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/authentication/mgmt/identities"; requestType = "IdentityListMgmtUpdateRequestDTO"; responseType = "IdentityListMgmtResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
        in item 'request' : ArrowheadCoreData::'IdentityListMgmtUpdateRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'IdentityListMgmtResponseDTO'[0..1];
    }
    action def 'Authentication_identityManagement_http_identity-mgmt-remove_2' {
        doc /* Deletes the defined system identities. Wire method: DELETE; address: /authentication/mgmt/identities. Query parameters: [{"name": "names", "type": "List<String>", "required": true, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR", "SERVICE_UNAVAILABLE"] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/authentication/mgmt/identities"; requestType = "unspecified"; responseType = "void"; queryParameters = "[{\"name\": \"names\", \"type\": \"List<String>\", \"required\": true, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\", \"SERVICE_UNAVAILABLE\"]"; }
    }
    action def 'Authentication_identityManagement_http_identity-mgmt-query_3' {
        doc /* Returns the identifiable systems according to the query request. Wire method: POST; address: /authentication/mgmt/identities/query. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/authentication/mgmt/identities/query"; requestType = "IdentityQueryRequestDTO"; responseType = "IdentityListMgmtResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'IdentityQueryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'IdentityListMgmtResponseDTO'[0..1];
    }
    action def 'Authentication_identityManagement_http_identity-mgmt-session-close_4' {
        doc /* Closes the defined system identities' active sessions. Wire method: DELETE; address: /authentication/mgmt/sessions. Query parameters: [{"name": "names", "type": "List<String>", "required": true, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/authentication/mgmt/sessions"; requestType = "unspecified"; responseType = "void"; queryParameters = "[{\"name\": \"names\", \"type\": \"List<String>\", \"required\": true, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
    }
    action def 'Authentication_identityManagement_http_identity-mgmt-session-query_5' {
        doc /* Returns the active sessions according to the query request. Wire method: POST; address: /authentication/mgmt/sessions. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/authentication/mgmt/sessions"; requestType = "IdentitySessionQueryRequestDTO"; responseType = "IdentitySessionListMgmtResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'IdentitySessionQueryRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'IdentitySessionListMgmtResponseDTO'[0..1];
    }
    port def Authentication_identityManagement_MQTT_IDD :> Authentication_identityManagement_SD {
        @IDD { MicroserviceName = "identityManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/authentication/documentation/v5.3.0/Authentication-v5.3.0-identityManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/authentication/identity/management/";
        doc /* identity-mgmt-create: REQUEST_REPLY arrowhead/authentication/identity/management/identity-mgmt-create. Input: IdentityListMgmtCreateRequest; output: IdentityListMgmtResponse.  */
        in item 'identity-mgmt-createRequest' : ArrowheadCoreData::'IdentityListMgmtCreateRequest'[0..1];
        out item 'identity-mgmt-createResponse' : ArrowheadCoreData::'IdentityListMgmtResponse'[0..1];
        doc /* identity-mgmt-update: REQUEST_REPLY arrowhead/authentication/identity/management/identity-mgmt-update. Input: IdentityListMgmtUpdateRequest; output: IdentityListMgmtResponse.  */
        in item 'identity-mgmt-updateRequest' : ArrowheadCoreData::'IdentityListMgmtUpdateRequest'[0..1];
        out item 'identity-mgmt-updateResponse' : ArrowheadCoreData::'IdentityListMgmtResponse'[0..1];
        doc /* identity-mgmt-remove: REQUEST_REPLY arrowhead/authentication/identity/management/identity-mgmt-remove. Input: Array<String>; output: None.  */
        in attribute 'identity-mgmt-removeRequest' : ScalarValues::String[0..*];
        out item 'identity-mgmt-removeResponse' : JSONMessage[0..1];
        doc /* identity-mgmt-query: REQUEST_REPLY arrowhead/authentication/identity/management/identity-mgmt-query. Input: IdentityQueryRequest; output: IdentityListMgmtResponse.  */
        in item 'identity-mgmt-queryRequest' : ArrowheadCoreData::'IdentityQueryRequest'[0..1];
        out item 'identity-mgmt-queryResponse' : ArrowheadCoreData::'IdentityListMgmtResponse'[0..1];
        doc /* identity-mgmt-session-close: REQUEST_REPLY arrowhead/authentication/identity/management/identity-mgmt-session-close. Input: Array<String>; output: None.  */
        in attribute 'identity-mgmt-session-closeRequest' : ScalarValues::String[0..*];
        out item 'identity-mgmt-session-closeResponse' : JSONMessage[0..1];
        doc /* identity-mgmt-session-query: REQUEST_REPLY arrowhead/authentication/identity/management/identity-mgmt-session-query. Input: IdentitySessionQueryRequest; output: IdentitySessionListMgmtResponse.  */
        in item 'identity-mgmt-session-queryRequest' : ArrowheadCoreData::'IdentitySessionQueryRequest'[0..1];
        out item 'identity-mgmt-session-queryResponse' : ArrowheadCoreData::'IdentitySessionListMgmtResponse'[0..1];
    }
    port def Authentication_identityManagement_MQTT_IDD_Implementation :> Authentication_identityManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'Authentication_identityManagement_mqtt_identity-mgmt-create_0' {
        doc /* Operation identity-mgmt-create. Wire method: REQUEST_REPLY; address: arrowhead/authentication/identity/management/identity-mgmt-create. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/identity/management/identity-mgmt-create"; requestType = "IdentityListMgmtCreateRequest"; responseType = "IdentityListMgmtResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'IdentityListMgmtCreateRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'IdentityListMgmtResponse'[0..1];
    }
    action def 'Authentication_identityManagement_mqtt_identity-mgmt-update_1' {
        doc /* Operation identity-mgmt-update. Wire method: REQUEST_REPLY; address: arrowhead/authentication/identity/management/identity-mgmt-update. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/identity/management/identity-mgmt-update"; requestType = "IdentityListMgmtUpdateRequest"; responseType = "IdentityListMgmtResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'IdentityListMgmtUpdateRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'IdentityListMgmtResponse'[0..1];
    }
    action def 'Authentication_identityManagement_mqtt_identity-mgmt-remove_2' {
        doc /* Operation identity-mgmt-remove. Wire method: REQUEST_REPLY; address: arrowhead/authentication/identity/management/identity-mgmt-remove. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/identity/management/identity-mgmt-remove"; requestType = "Array<String>"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'Authentication_identityManagement_mqtt_identity-mgmt-query_3' {
        doc /* Operation identity-mgmt-query. Wire method: REQUEST_REPLY; address: arrowhead/authentication/identity/management/identity-mgmt-query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/identity/management/identity-mgmt-query"; requestType = "IdentityQueryRequest"; responseType = "IdentityListMgmtResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'IdentityQueryRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'IdentityListMgmtResponse'[0..1];
    }
    action def 'Authentication_identityManagement_mqtt_identity-mgmt-session-close_4' {
        doc /* Operation identity-mgmt-session-close. Wire method: REQUEST_REPLY; address: arrowhead/authentication/identity/management/identity-mgmt-session-close. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/identity/management/identity-mgmt-session-close"; requestType = "Array<String>"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'Authentication_identityManagement_mqtt_identity-mgmt-session-query_5' {
        doc /* Operation identity-mgmt-session-query. Wire method: REQUEST_REPLY; address: arrowhead/authentication/identity/management/identity-mgmt-session-query. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/identity/management/identity-mgmt-session-query"; requestType = "IdentitySessionQueryRequest"; responseType = "IdentitySessionListMgmtResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'IdentitySessionQueryRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'IdentitySessionListMgmtResponse'[0..1];
    }
    port def Authentication_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/AuthenticationSystemInfo.java */
    }
    port def Authentication_generalManagement_HTTP_IDD :> Authentication_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-core-java-spring/authentication/documentation/v5.3.0/Authentication-v5.3.0-generalManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute basePath : String = "/authentication/general/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https (generic_http when TLS is disabled), access port 8444 and base path /authentication/general/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
get-log & POST & /logs \\ \hline
get-config & GET & /get-config \\ \hline
\end{longtable}

\newpage */
        doc /* get-log: POST /authentication/general/mgmt/logs. Input: LogRequestDTO; output: LogEntryListResponseDTO. Returns the log entries */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
        doc /* get-config: GET /authentication/general/mgmt/get-config. Input: None; output: KeyValuesDTO. Returns a list of configurations */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def Authentication_generalManagement_HTTP_IDD_Implementation :> Authentication_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'Authentication_generalManagement_http_get-log_0' {
        doc /* Returns the log entries. Wire method: POST; address: /authentication/general/mgmt/logs. Query parameters: []. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/authentication/general/mgmt/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'Authentication_generalManagement_http_get-config_1' {
        doc /* Returns a list of configurations. Wire method: GET; address: /authentication/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: ["OK", "BAD_REQUEST", "UNAUTHORIZED", "FORBIDDEN", "INTERNAL_SERVER_ERROR"] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/authentication/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[\"OK\", \"BAD_REQUEST\", \"UNAUTHORIZED\", \"FORBIDDEN\", \"INTERNAL_SERVER_ERROR\"]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def Authentication_generalManagement_MQTT_IDD :> Authentication_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'mqtt'; }
        @SourceTrace { path = "ah5-core-java-spring/authentication/documentation/v5.3.0/Authentication-v5.3.0-generalManagement-MQTT-IDD.tex"; }
        attribute baseTopic : String = "arrowhead/authentication/general/management/";
        doc /* get-log: REQUEST_REPLY arrowhead/authentication/general/management/get-log. Input: LogRequest; output: LogEntryListResponse.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequest'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponse'[0..1];
        doc /* get-config: REQUEST_REPLY arrowhead/authentication/general/management/get-config. Input: Array<String>; output: KeyValues.  */
        in attribute 'get-configRequest' : ScalarValues::String[0..*];
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValues'[0..1];
    }
    port def Authentication_generalManagement_MQTT_IDD_Implementation :> Authentication_generalManagement_MQTT_IDD { @IDD_Implementation; }
    action def 'Authentication_generalManagement_mqtt_get-log_0' {
        doc /* Operation get-log. Wire method: REQUEST_REPLY; address: arrowhead/authentication/general/management/get-log. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/general/management/get-log"; requestType = "LogRequest"; responseType = "LogEntryListResponse"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'LogRequest'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponse'[0..1];
    }
    action def 'Authentication_generalManagement_mqtt_get-config_1' {
        doc /* Operation get-config. Wire method: REQUEST_REPLY; address: arrowhead/authentication/general/management/get-config. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "mqtt"; method = "REQUEST_REPLY"; address = "arrowhead/authentication/general/management/get-config"; requestType = "Array<String>"; responseType = "KeyValues"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in attribute 'request' : ScalarValues::String[0..*];
        out item 'response' : ArrowheadCoreData::'KeyValues'[0..1];
    }
    port def Authentication_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/AuthenticationSystemInfo.java */
    }
    port def Authentication_sysMonitor_AMQP_IDD :> Authentication_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-core-java-spring/authentication/documentation/v5.3.0/Authentication-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.Authentication.Authentication";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, Authentication registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.Authentication.Authentication",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.Authentication.Authentication.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadCoreData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.Authentication.Authentication.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadCoreData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.Authentication.Authentication.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadCoreData::'Observation'[0..1];
    }
    port def Authentication_sysMonitor_AMQP_IDD_Implementation :> Authentication_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'Authentication_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Authentication.Authentication.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Authentication.Authentication.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    action def 'Authentication_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Authentication.Authentication.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Authentication.Authentication.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    action def 'Authentication_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Authentication.Authentication.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Authentication.Authentication.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    part def Authentication_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "Authentication"; FunctionalProperties = "Java release 5.3 core system Authentication"; }
        @SourceTrace { path = "ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/AuthenticationSystemInfo.java"; }
        doc /* Java release 5.3 core system Authentication */
        port 'identity_SD' : Authentication_identity_SD { @FullPort; }
        port 'identityManagement_SD' : Authentication_identityManagement_SD { @FullPort; }
        port 'generalManagement_SD' : Authentication_generalManagement_SD { @FullPort; }
        port 'sysMonitor_SD' : Authentication_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), ConsumerAuthorization, ServiceRegistry. These are external requirements, not assumed co-deployments. */
    }
    part def Authentication_SysDD :> Authentication_SysD {
        @SysDD;
        port 'identity_http' : Authentication_identity_HTTP_IDD { @FullPort; }
        port 'identity_mqtt' : Authentication_identity_MQTT_IDD[0..1] { @FullPort; }
        port 'identityManagement_http' : Authentication_identityManagement_HTTP_IDD { @FullPort; }
        port 'identityManagement_mqtt' : Authentication_identityManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'generalManagement_http' : Authentication_generalManagement_HTTP_IDD { @FullPort; }
        port 'generalManagement_mqtt' : Authentication_generalManagement_MQTT_IDD[0..1] { @FullPort; }
        port 'sysMonitor_amqp' : Authentication_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def Authentication :> Authentication_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8444;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'Authentication_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /authentication/monitor/echo; source ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/api/http/MonitorAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/authentication/monitor/echo"; } }
}
