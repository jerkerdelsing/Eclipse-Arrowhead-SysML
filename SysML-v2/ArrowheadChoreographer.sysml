library package ArrowheadChoreographer {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def Choreographer_choreographerSession_SD :> ArrowheadService {
        @SD { MicroserviceName = "choreographerSession"; }
        doc /* Service version 1.0.0. Source: ah5-Choreographer-java-spring/documentation/v5.3.0/Choreographer-v5.3.0-SysD.tex */
    }
    port def Choreographer_choreographerSession_HTTP_IDD :> Choreographer_choreographerSession_SD {
        @IDD { MicroserviceName = "choreographerSession"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-Choreographer-java-spring/documentation/v5.3.0/Choreographer-v5.3.0-choreographerSession-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/choreographer/session";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address choreographer, port 8457 (server.port; the standalone deployment registers 8454) and base path /choreographer/session. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
start-session & POST & /start \\ \hline
abort-session & DELETE & \texttt{/abort/{id}} \\ \hline
\end{longtable}

\newpage */
        doc /* start-session: POST /choreographer/session/start. Input: StartSessionListRequestDTO; output: RunPlanListResponseDTO.  */
        in item 'start-sessionRequest' : ArrowheadChoreographerData::'StartSessionListRequestDTO'[0..1];
        out item 'start-sessionResponse' : ArrowheadChoreographerData::'RunPlanListResponseDTO'[0..1];
        doc /* abort-session: DELETE /choreographer/session/abort/{id}. Input: None; output: ResponseEntity<Void>.  */
    }
    port def Choreographer_choreographerSession_HTTP_IDD_Implementation :> Choreographer_choreographerSession_HTTP_IDD { @IDD_Implementation; }
    action def 'Choreographer_choreographerSession_http_start-session_0' {
        doc /* Operation start-session. Wire method: POST; address: /choreographer/session/start. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/choreographer/session/start"; requestType = "StartSessionListRequestDTO"; responseType = "RunPlanListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadChoreographerData::'StartSessionListRequestDTO'[0..1];
        out item 'response' : ArrowheadChoreographerData::'RunPlanListResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerSession_http_abort-session_1' {
        doc /* Operation abort-session. Wire method: DELETE; address: /choreographer/session/abort/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/choreographer/session/abort/{id}"; requestType = "unspecified"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
    }
    port def Choreographer_choreographerExecutor_SD :> ArrowheadService {
        @SD { MicroserviceName = "choreographerExecutor"; }
        doc /* Service version 1.0.0. Source: ah5-Choreographer-java-spring/documentation/v5.3.0/Choreographer-v5.3.0-SysD.tex */
    }
    port def Choreographer_choreographerExecutor_HTTP_IDD :> Choreographer_choreographerExecutor_SD {
        @IDD { MicroserviceName = "choreographerExecutor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-Choreographer-java-spring/documentation/v5.3.0/Choreographer-v5.3.0-choreographerExecutor-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/choreographer/executor";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address choreographer, port 8457 (server.port; the standalone deployment registers 8454) and base path /choreographer/executor. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
register & POST & /register \\ \hline
unregister & DELETE & /unregister \\ \hline
notify-step-done & POST & /notify-step-done \\ \hline
\end{longtable}

\newpage */
        doc /* register: POST /choreographer/executor/register. Input: ExecutorRegistrationRequestDTO; output: ExecutorResponseDTO.  */
        in item 'registerRequest' : ArrowheadChoreographerData::'ExecutorRegistrationRequestDTO'[0..1];
        out item 'registerResponse' : ArrowheadChoreographerData::'ExecutorResponseDTO'[0..1];
        doc /* unregister: DELETE /choreographer/executor/unregister. Input: None; output: ResponseEntity<Void>.  */
        doc /* notify-step-done: POST /choreographer/executor/notify-step-done. Input: ExecutedStepResultDTO; output: ResponseEntity<Void>.  */
        in item 'notify-step-doneRequest' : ArrowheadChoreographerData::'ExecutedStepResultDTO'[0..1];
    }
    port def Choreographer_choreographerExecutor_HTTP_IDD_Implementation :> Choreographer_choreographerExecutor_HTTP_IDD { @IDD_Implementation; }
    action def 'Choreographer_choreographerExecutor_http_register_0' {
        doc /* Operation register. Wire method: POST; address: /choreographer/executor/register. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/choreographer/executor/register"; requestType = "ExecutorRegistrationRequestDTO"; responseType = "ExecutorResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadChoreographerData::'ExecutorRegistrationRequestDTO'[0..1];
        out item 'response' : ArrowheadChoreographerData::'ExecutorResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerExecutor_http_unregister_1' {
        doc /* Operation unregister. Wire method: DELETE; address: /choreographer/executor/unregister. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/choreographer/executor/unregister"; requestType = "unspecified"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
    }
    action def 'Choreographer_choreographerExecutor_http_notify-step-done_2' {
        doc /* Operation notify-step-done. Wire method: POST; address: /choreographer/executor/notify-step-done. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/choreographer/executor/notify-step-done"; requestType = "ExecutedStepResultDTO"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadChoreographerData::'ExecutedStepResultDTO'[0..1];
    }
    port def Choreographer_choreographerManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "choreographerManagement"; }
        doc /* Service version 1.0.0. Source: ah5-Choreographer-java-spring/documentation/v5.3.0/Choreographer-v5.3.0-SysD.tex */
    }
    port def Choreographer_choreographerManagement_HTTP_IDD :> Choreographer_choreographerManagement_SD {
        @IDD { MicroserviceName = "choreographerManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-Choreographer-java-spring/documentation/v5.3.0/Choreographer-v5.3.0-choreographerManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/choreographer/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address choreographer, port 8457 (server.port; the standalone deployment registers 8454) and base path /choreographer/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
query-plans & GET & /plans \\ \hline
get-plan & GET & \texttt{/plans/{id}} \\ \hline
create-plan & POST & /plans \\ \hline
remove-plan & DELETE & \texttt{/plans/{id}} \\ \hline
check-plan & GET & \texttt{/plans/{id}/check} \\ \hline
start-sessions & POST & /sessions/start \\ \hline
abort-session & DELETE & \texttt{/sessions/{id}} \\ \hline
query-sessions & GET & /sessions \\ \hline
query-session-steps & GET & /session-steps \\ \hline
query-worklog & GET & /worklog \\ \hline
query-executors & GET & /executors \\ \hline
get-executor & GET & \texttt{/executors/{id}} \\ \hline
create-executor & POST & /executors \\ \hline
remove-executor & DELETE & \texttt{/executors/{id}} \\ \hline
\end{longtable}

\newpage */
        doc /* query-plans: GET /choreographer/mgmt/plans. Input: None; output: PlanListResponseDTO.  */
        out item 'query-plansResponse' : ArrowheadChoreographerData::'PlanListResponseDTO'[0..1];
        doc /* get-plan: GET /choreographer/mgmt/plans/{id}. Input: None; output: PlanResponseDTO.  */
        out item 'get-planResponse' : ArrowheadChoreographerData::'PlanResponseDTO'[0..1];
        doc /* create-plan: POST /choreographer/mgmt/plans. Input: PlanRequestDTO; output: PlanResponseDTO.  */
        in item 'create-planRequest' : ArrowheadChoreographerData::'PlanRequestDTO'[0..1];
        out item 'create-planResponse' : ArrowheadChoreographerData::'PlanResponseDTO'[0..1];
        doc /* remove-plan: DELETE /choreographer/mgmt/plans/{id}. Input: None; output: ResponseEntity<Void>.  */
        doc /* check-plan: GET /choreographer/mgmt/plans/{id}/check. Input: None; output: CheckPlanResponseDTO.  */
        out item 'check-planResponse' : ArrowheadChoreographerData::'CheckPlanResponseDTO'[0..1];
        doc /* start-sessions: POST /choreographer/mgmt/sessions/start. Input: RunPlanListRequestDTO; output: RunPlanListResponseDTO.  */
        in item 'start-sessionsRequest' : ArrowheadChoreographerData::'RunPlanListRequestDTO'[0..1];
        out item 'start-sessionsResponse' : ArrowheadChoreographerData::'RunPlanListResponseDTO'[0..1];
        doc /* abort-session: DELETE /choreographer/mgmt/sessions/{id}. Input: None; output: ResponseEntity<Void>.  */
        doc /* query-sessions: GET /choreographer/mgmt/sessions. Input: None; output: SessionListResponseDTO.  */
        out item 'query-sessionsResponse' : ArrowheadChoreographerData::'SessionListResponseDTO'[0..1];
        doc /* query-session-steps: GET /choreographer/mgmt/session-steps. Input: None; output: SessionStepListResponseDTO.  */
        out item 'query-session-stepsResponse' : ArrowheadChoreographerData::'SessionStepListResponseDTO'[0..1];
        doc /* query-worklog: GET /choreographer/mgmt/worklog. Input: None; output: WorklogListResponseDTO.  */
        out item 'query-worklogResponse' : ArrowheadChoreographerData::'WorklogListResponseDTO'[0..1];
        doc /* query-executors: GET /choreographer/mgmt/executors. Input: None; output: ExecutorListResponseDTO.  */
        out item 'query-executorsResponse' : ArrowheadChoreographerData::'ExecutorListResponseDTO'[0..1];
        doc /* get-executor: GET /choreographer/mgmt/executors/{id}. Input: None; output: ExecutorResponseDTO.  */
        out item 'get-executorResponse' : ArrowheadChoreographerData::'ExecutorResponseDTO'[0..1];
        doc /* create-executor: POST /choreographer/mgmt/executors. Input: ExecutorCreateRequestDTO; output: ExecutorResponseDTO.  */
        in item 'create-executorRequest' : ArrowheadChoreographerData::'ExecutorCreateRequestDTO'[0..1];
        out item 'create-executorResponse' : ArrowheadChoreographerData::'ExecutorResponseDTO'[0..1];
        doc /* remove-executor: DELETE /choreographer/mgmt/executors/{id}. Input: None; output: ResponseEntity<Void>.  */
    }
    port def Choreographer_choreographerManagement_HTTP_IDD_Implementation :> Choreographer_choreographerManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'Choreographer_choreographerManagement_http_query-plans_0' {
        doc /* Operation query-plans. Wire method: GET; address: /choreographer/mgmt/plans. Query parameters: [{"name": "page", "type": "Integer", "required": false, "default": null}, {"name": "size", "type": "Integer", "required": false, "default": null}, {"name": "direction", "type": "String", "required": false, "default": null}, {"name": "sortField", "type": "String", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/choreographer/mgmt/plans"; requestType = "unspecified"; responseType = "PlanListResponseDTO"; queryParameters = "[{\"name\": \"page\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"size\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"direction\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"sortField\", \"type\": \"String\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadChoreographerData::'PlanListResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerManagement_http_get-plan_1' {
        doc /* Operation get-plan. Wire method: GET; address: /choreographer/mgmt/plans/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/choreographer/mgmt/plans/{id}"; requestType = "unspecified"; responseType = "PlanResponseDTO"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadChoreographerData::'PlanResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerManagement_http_create-plan_2' {
        doc /* Operation create-plan. Wire method: POST; address: /choreographer/mgmt/plans. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/choreographer/mgmt/plans"; requestType = "PlanRequestDTO"; responseType = "PlanResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadChoreographerData::'PlanRequestDTO'[0..1];
        out item 'response' : ArrowheadChoreographerData::'PlanResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerManagement_http_remove-plan_3' {
        doc /* Operation remove-plan. Wire method: DELETE; address: /choreographer/mgmt/plans/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/choreographer/mgmt/plans/{id}"; requestType = "unspecified"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
    }
    action def 'Choreographer_choreographerManagement_http_check-plan_4' {
        doc /* Operation check-plan. Wire method: GET; address: /choreographer/mgmt/plans/{id}/check. Query parameters: [{"name": "allowInterCloud", "type": "boolean", "required": false, "default": "false"}]. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/choreographer/mgmt/plans/{id}/check"; requestType = "unspecified"; responseType = "CheckPlanResponseDTO"; queryParameters = "[{\"name\": \"allowInterCloud\", \"type\": \"boolean\", \"required\": false, \"default\": \"false\"}]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadChoreographerData::'CheckPlanResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerManagement_http_start-sessions_5' {
        doc /* Operation start-sessions. Wire method: POST; address: /choreographer/mgmt/sessions/start. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/choreographer/mgmt/sessions/start"; requestType = "RunPlanListRequestDTO"; responseType = "RunPlanListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadChoreographerData::'RunPlanListRequestDTO'[0..1];
        out item 'response' : ArrowheadChoreographerData::'RunPlanListResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerManagement_http_abort-session_6' {
        doc /* Operation abort-session. Wire method: DELETE; address: /choreographer/mgmt/sessions/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/choreographer/mgmt/sessions/{id}"; requestType = "unspecified"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
    }
    action def 'Choreographer_choreographerManagement_http_query-sessions_7' {
        doc /* Operation query-sessions. Wire method: GET; address: /choreographer/mgmt/sessions. Query parameters: [{"name": "page", "type": "Integer", "required": false, "default": null}, {"name": "size", "type": "Integer", "required": false, "default": null}, {"name": "direction", "type": "String", "required": false, "default": null}, {"name": "sortField", "type": "String", "required": false, "default": null}, {"name": "planId", "type": "Long", "required": false, "default": null}, {"name": "status", "type": "String", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/choreographer/mgmt/sessions"; requestType = "unspecified"; responseType = "SessionListResponseDTO"; queryParameters = "[{\"name\": \"page\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"size\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"direction\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"sortField\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"planId\", \"type\": \"Long\", \"required\": false, \"default\": null}, {\"name\": \"status\", \"type\": \"String\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadChoreographerData::'SessionListResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerManagement_http_query-session-steps_8' {
        doc /* Operation query-session-steps. Wire method: GET; address: /choreographer/mgmt/session-steps. Query parameters: [{"name": "page", "type": "Integer", "required": false, "default": null}, {"name": "size", "type": "Integer", "required": false, "default": null}, {"name": "direction", "type": "String", "required": false, "default": null}, {"name": "sortField", "type": "String", "required": false, "default": null}, {"name": "sessionId", "type": "Long", "required": false, "default": null}, {"name": "status", "type": "String", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/choreographer/mgmt/session-steps"; requestType = "unspecified"; responseType = "SessionStepListResponseDTO"; queryParameters = "[{\"name\": \"page\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"size\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"direction\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"sortField\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"sessionId\", \"type\": \"Long\", \"required\": false, \"default\": null}, {\"name\": \"status\", \"type\": \"String\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadChoreographerData::'SessionStepListResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerManagement_http_query-worklog_9' {
        doc /* Operation query-worklog. Wire method: GET; address: /choreographer/mgmt/worklog. Query parameters: [{"name": "page", "type": "Integer", "required": false, "default": null}, {"name": "size", "type": "Integer", "required": false, "default": null}, {"name": "direction", "type": "String", "required": false, "default": null}, {"name": "sortField", "type": "String", "required": false, "default": null}, {"name": "sessionId", "type": "Long", "required": false, "default": null}, {"name": "planName", "type": "String", "required": false, "default": null}, {"name": "actionName", "type": "String", "required": false, "default": null}, {"name": "stepName", "type": "String", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/choreographer/mgmt/worklog"; requestType = "unspecified"; responseType = "WorklogListResponseDTO"; queryParameters = "[{\"name\": \"page\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"size\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"direction\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"sortField\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"sessionId\", \"type\": \"Long\", \"required\": false, \"default\": null}, {\"name\": \"planName\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"actionName\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"stepName\", \"type\": \"String\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadChoreographerData::'WorklogListResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerManagement_http_query-executors_10' {
        doc /* Operation query-executors. Wire method: GET; address: /choreographer/mgmt/executors. Query parameters: [{"name": "page", "type": "Integer", "required": false, "default": null}, {"name": "size", "type": "Integer", "required": false, "default": null}, {"name": "direction", "type": "String", "required": false, "default": null}, {"name": "sortField", "type": "String", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/choreographer/mgmt/executors"; requestType = "unspecified"; responseType = "ExecutorListResponseDTO"; queryParameters = "[{\"name\": \"page\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"size\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"direction\", \"type\": \"String\", \"required\": false, \"default\": null}, {\"name\": \"sortField\", \"type\": \"String\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadChoreographerData::'ExecutorListResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerManagement_http_get-executor_11' {
        doc /* Operation get-executor. Wire method: GET; address: /choreographer/mgmt/executors/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/choreographer/mgmt/executors/{id}"; requestType = "unspecified"; responseType = "ExecutorResponseDTO"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadChoreographerData::'ExecutorResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerManagement_http_create-executor_12' {
        doc /* Operation create-executor. Wire method: POST; address: /choreographer/mgmt/executors. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/choreographer/mgmt/executors"; requestType = "ExecutorCreateRequestDTO"; responseType = "ExecutorResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadChoreographerData::'ExecutorCreateRequestDTO'[0..1];
        out item 'response' : ArrowheadChoreographerData::'ExecutorResponseDTO'[0..1];
    }
    action def 'Choreographer_choreographerManagement_http_remove-executor_13' {
        doc /* Operation remove-executor. Wire method: DELETE; address: /choreographer/mgmt/executors/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/choreographer/mgmt/executors/{id}"; requestType = "unspecified"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
    }
    port def Choreographer_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-Choreographer-java-spring/documentation/v5.3.0/Choreographer-v5.3.0-SysD.tex */
    }
    port def Choreographer_generalManagement_HTTP_IDD :> Choreographer_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-Choreographer-java-spring/documentation/v5.3.0/Choreographer-v5.3.0-generalManagement-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/choreographer/general/mgmt";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address choreographer, port 8457 (server.port; the standalone deployment registers 8454) and base path /choreographer/general/mgmt. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
get-log & POST & /logs \\ \hline
get-config & GET & /get-config \\ \hline
\end{longtable}

\newpage */
        doc /* get-log: POST /choreographer/general/mgmt/logs. Input: LogRequestDTO; output: LogEntryListResponseDTO.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
        doc /* get-config: GET /choreographer/general/mgmt/get-config. Input: None; output: KeyValuesDTO.  */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def Choreographer_generalManagement_HTTP_IDD_Implementation :> Choreographer_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'Choreographer_generalManagement_http_get-log_0' {
        doc /* Operation get-log. Wire method: POST; address: /choreographer/general/mgmt/logs. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/choreographer/general/mgmt/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'Choreographer_generalManagement_http_get-config_1' {
        doc /* Operation get-config. Wire method: GET; address: /choreographer/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/choreographer/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def Choreographer_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-Choreographer-java-spring/documentation/v5.3.0/Choreographer-v5.3.0-SysD.tex */
    }
    port def Choreographer_sysMonitor_AMQP_IDD :> Choreographer_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-Choreographer-java-spring/documentation/v5.3.0/Choreographer-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.Choreographer.Choreographer";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, Choreographer registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.Choreographer.Choreographer",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.Choreographer.Choreographer.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadChoreographerData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.Choreographer.Choreographer.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadChoreographerData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.Choreographer.Choreographer.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadChoreographerData::'Observation'[0..1];
    }
    port def Choreographer_sysMonitor_AMQP_IDD_Implementation :> Choreographer_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'Choreographer_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Choreographer.Choreographer.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Choreographer.Choreographer.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadChoreographerData::'Observation'[0..1];
    }
    action def 'Choreographer_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Choreographer.Choreographer.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Choreographer.Choreographer.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadChoreographerData::'Observation'[0..1];
    }
    action def 'Choreographer_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Choreographer.Choreographer.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Choreographer.Choreographer.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadChoreographerData::'Observation'[0..1];
    }
    part def Choreographer_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "Choreographer"; FunctionalProperties = "This document describes the Choreographer support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-Choreographer-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-Choreographer-java-spring/documentation/v5.3.0/Choreographer-v5.3.0-SysD.tex"; }
        doc /* This document describes the Choreographer support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-Choreographer-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.
  \end{abstract} */
        port 'choreographerSession_SD' : Choreographer_choreographerSession_SD { @FullPort; }
        port 'choreographerExecutor_SD' : Choreographer_choreographerExecutor_SD { @FullPort; }
        port 'choreographerManagement_SD' : Choreographer_choreographerManagement_SD { @FullPort; }
        port 'generalManagement_SD' : Choreographer_generalManagement_SD { @FullPort; }
        port 'sysMonitor_SD' : Choreographer_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, ConsumerAuthorization, DynamicServiceOrchestration, Executors, ServiceRegistry. These are external requirements, not assumed co-deployments. */
    }
    part def Choreographer_SysDD :> Choreographer_SysD {
        @SysDD;
        port 'choreographerSession_http' : Choreographer_choreographerSession_HTTP_IDD { @FullPort; }
        port 'choreographerExecutor_http' : Choreographer_choreographerExecutor_HTTP_IDD { @FullPort; }
        port 'choreographerManagement_http' : Choreographer_choreographerManagement_HTTP_IDD { @FullPort; }
        port 'generalManagement_http' : Choreographer_generalManagement_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : Choreographer_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def Choreographer :> Choreographer_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8457;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'Choreographer_Unregistered_0' { doc /* Unregistered HTTP endpoint; POST /choreographer/orchestration-result/{correlationId}; source ah5-Choreographer-java-spring/src/main/java/eu/arrowhead/choreographer/api/http/OrchestrationResultAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/choreographer/orchestration-result/{correlationId}"; } }
}
