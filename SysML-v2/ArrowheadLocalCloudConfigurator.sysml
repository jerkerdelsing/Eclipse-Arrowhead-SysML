library package ArrowheadLocalCloudConfigurator {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def LocalCloudConfigurator_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-LocalCloudConfigurator-java/documentation/v5.3.0/LocalCloudConfigurator-v5.3.0-SysD.tex */
    }
    port def LocalCloudConfigurator_generalManagement_HTTP_IDD :> LocalCloudConfigurator_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/LocalCloudConfiguratorSystemInfo.java"; }
        attribute basePath : String = "/localcloudconfigurator/general/mgmt";
        doc /* get-log: POST /localcloudconfigurator/general/mgmt/logs. Input: LogRequestDTO; output: LogEntryListResponseDTO.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
        doc /* get-config: GET /localcloudconfigurator/general/mgmt/get-config. Input: None; output: KeyValuesDTO.  */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def LocalCloudConfigurator_generalManagement_HTTP_IDD_Implementation :> LocalCloudConfigurator_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'LocalCloudConfigurator_generalManagement_http_get-log_0' {
        doc /* Operation get-log. Wire method: POST; address: /localcloudconfigurator/general/mgmt/logs. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/localcloudconfigurator/general/mgmt/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'LocalCloudConfigurator_generalManagement_http_get-config_1' {
        doc /* Operation get-config. Wire method: GET; address: /localcloudconfigurator/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/localcloudconfigurator/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def LocalCloudConfigurator_localCloudConfiguration_SD :> ArrowheadService {
        @SD { MicroserviceName = "localCloudConfiguration"; }
        doc /* Service version 1.0.0. Source: ah5-LocalCloudConfigurator-java/documentation/v5.3.0/LocalCloudConfigurator-v5.3.0-SysD.tex */
    }
    port def LocalCloudConfigurator_localCloudConfiguration_HTTP_IDD :> LocalCloudConfigurator_localCloudConfiguration_SD {
        @IDD { MicroserviceName = "localCloudConfiguration"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-LocalCloudConfigurator-java/documentation/v5.3.0/LocalCloudConfigurator-v5.3.0-localCloudConfiguration-HTTP-IDD.tex"; }
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        attribute basePath : String = "/api";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, port 8492, base path /api and the service metadata systemVersion=5.2.2. Path parameters are templates (\texttt{{id}}):

\noindent\begin{longtable}{| p{5.2cm} | p{1.8cm} | p{8.2cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
catalog & GET & \texttt{/\allowbreak{}catalog} \\ \hline
status & GET & \texttt{/\allowbreak{}status} \\ \hline
plan & POST & \texttt{/\allowbreak{}plan} \\ \hline
submit-deployment & POST & \texttt{/\allowbreak{}deployments} \\ \hline
get-deployment & GET & \texttt{/\allowbreak{}deployments/\allowbreak{}{id}} \\ \hline
list-configurations & GET & \texttt{/\allowbreak{}configurations} \\ \hline
create-configuration & POST & \texttt{/\allowbreak{}configurations} \\ \hline
get-configuration & GET & \texttt{/\allowbreak{}configurations/\allowbreak{}{id}} \\ \hline
update-configuration & PUT & \texttt{/\allowbreak{}configurations/\allowbreak{}{id}} \\ \hline
remove-configuration & DELETE & \texttt{/\allowbreak{}configurations/\allowbreak{}{id}} \\ \hline
\end{longtable}

\newpage */
        doc /* catalog: GET /api/catalog. Input: None; output: Catalog.  */
        out item 'catalogResponse' : ArrowheadLocalCloudConfiguratorData::'Catalog'[0..1];
        doc /* status: GET /api/status. Input: None; output: Map<String, Object>.  */
        out item 'statusResponse' : JSONMessage[0..1];
        doc /* plan: POST /api/plan. Input: None; output: Map<String, Object>.  */
        out item 'planResponse' : JSONMessage[0..1];
        doc /* submit-deployment: POST /api/deployments. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'submit-deploymentResponse' : JSONMessage[0..1];
        doc /* get-deployment: GET /api/deployments/{id}. Input: Identifier; output: Deployment.  */
        in item 'get-deploymentRequest' : JSONMessage[0..1];
        out item 'get-deploymentResponse' : ArrowheadLocalCloudConfiguratorData::'Deployment'[0..1];
        doc /* list-configurations: GET /api/configurations. Input: None; output: Map<String, Object>.  */
        out item 'list-configurationsResponse' : JSONMessage[0..1];
        doc /* create-configuration: POST /api/configurations. Input: None; output: ResponseEntity<ConfigurationRecord>.  */
        out item 'create-configurationResponse' : ArrowheadLocalCloudConfiguratorData::'ConfigurationRecord'[0..1];
        doc /* get-configuration: GET /api/configurations/{id}. Input: Identifier; output: Configuration.  */
        in item 'get-configurationRequest' : JSONMessage[0..1];
        out item 'get-configurationResponse' : ArrowheadLocalCloudConfiguratorData::'Configuration'[0..1];
        doc /* update-configuration: PUT /api/configurations/{id}. Input: ConfigurationDraft; output: Configuration.  */
        in item 'update-configurationRequest' : ArrowheadLocalCloudConfiguratorData::'ConfigurationDraft'[0..1];
        out item 'update-configurationResponse' : ArrowheadLocalCloudConfiguratorData::'Configuration'[0..1];
        doc /* remove-configuration: DELETE /api/configurations/{id}. Input: RevisionCheck; output: Removal.  */
        in item 'remove-configurationRequest' : ArrowheadLocalCloudConfiguratorData::'RevisionCheck'[0..1];
        out item 'remove-configurationResponse' : ArrowheadLocalCloudConfiguratorData::'Removal'[0..1];
    }
    port def LocalCloudConfigurator_localCloudConfiguration_HTTP_IDD_Implementation :> LocalCloudConfigurator_localCloudConfiguration_HTTP_IDD { @IDD_Implementation; }
    action def 'LocalCloudConfigurator_localCloudConfiguration_http_catalog_0' {
        doc /* Operation catalog. Wire method: GET; address: /api/catalog. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/catalog"; requestType = "unspecified"; responseType = "Catalog"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudConfiguratorData::'Catalog'[0..1];
    }
    action def 'LocalCloudConfigurator_localCloudConfiguration_http_status_1' {
        doc /* Operation status. Wire method: GET; address: /api/status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/status"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'LocalCloudConfigurator_localCloudConfiguration_http_plan_2' {
        doc /* Operation plan. Wire method: POST; address: /api/plan. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/api/plan"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'LocalCloudConfigurator_localCloudConfiguration_http_submit-deployment_3' {
        doc /* Operation submit-deployment. Wire method: POST; address: /api/deployments. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/api/deployments"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'LocalCloudConfigurator_localCloudConfiguration_http_get-deployment_4' {
        doc /* Operation get-deployment. Wire method: GET; address: /api/deployments/{id}. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/deployments/{id}"; requestType = "Identifier"; responseType = "Deployment"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : ArrowheadLocalCloudConfiguratorData::'Deployment'[0..1];
    }
    action def 'LocalCloudConfigurator_localCloudConfiguration_http_list-configurations_5' {
        doc /* Operation list-configurations. Wire method: GET; address: /api/configurations. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/configurations"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'LocalCloudConfigurator_localCloudConfiguration_http_create-configuration_6' {
        doc /* Operation create-configuration. Wire method: POST; address: /api/configurations. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/api/configurations"; requestType = "unspecified"; responseType = "ResponseEntity<ConfigurationRecord>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudConfiguratorData::'ConfigurationRecord'[0..1];
    }
    action def 'LocalCloudConfigurator_localCloudConfiguration_http_get-configuration_7' {
        doc /* Operation get-configuration. Wire method: GET; address: /api/configurations/{id}. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/configurations/{id}"; requestType = "Identifier"; responseType = "Configuration"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : ArrowheadLocalCloudConfiguratorData::'Configuration'[0..1];
    }
    action def 'LocalCloudConfigurator_localCloudConfiguration_http_update-configuration_8' {
        doc /* Operation update-configuration. Wire method: PUT; address: /api/configurations/{id}. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/api/configurations/{id}"; requestType = "ConfigurationDraft"; responseType = "Configuration"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadLocalCloudConfiguratorData::'ConfigurationDraft'[0..1];
        out item 'response' : ArrowheadLocalCloudConfiguratorData::'Configuration'[0..1];
    }
    action def 'LocalCloudConfigurator_localCloudConfiguration_http_remove-configuration_9' {
        doc /* Operation remove-configuration. Wire method: DELETE; address: /api/configurations/{id}. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/api/configurations/{id}"; requestType = "RevisionCheck"; responseType = "Removal"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadLocalCloudConfiguratorData::'RevisionCheck'[0..1];
        out item 'response' : ArrowheadLocalCloudConfiguratorData::'Removal'[0..1];
    }
    port def LocalCloudConfigurator_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-LocalCloudConfigurator-java/documentation/v5.3.0/LocalCloudConfigurator-v5.3.0-SysD.tex */
    }
    port def LocalCloudConfigurator_sysMonitor_AMQP_IDD :> LocalCloudConfigurator_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-LocalCloudConfigurator-java/documentation/v5.3.0/LocalCloudConfigurator-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.LocalCloudConfigurator.LocalCloudConfigurator";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, the common sysMonitor publisher of LocalCloudConfigurator registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.LocalCloudConfigurator.LocalCloudConfigurator",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.LocalCloudConfigurator.LocalCloudConfigurator.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadLocalCloudConfiguratorData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.LocalCloudConfigurator.LocalCloudConfigurator.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadLocalCloudConfiguratorData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.LocalCloudConfigurator.LocalCloudConfigurator.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadLocalCloudConfiguratorData::'Observation'[0..1];
    }
    port def LocalCloudConfigurator_sysMonitor_AMQP_IDD_Implementation :> LocalCloudConfigurator_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'LocalCloudConfigurator_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.LocalCloudConfigurator.LocalCloudConfigurator.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.LocalCloudConfigurator.LocalCloudConfigurator.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudConfiguratorData::'Observation'[0..1];
    }
    action def 'LocalCloudConfigurator_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.LocalCloudConfigurator.LocalCloudConfigurator.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.LocalCloudConfigurator.LocalCloudConfigurator.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudConfiguratorData::'Observation'[0..1];
    }
    action def 'LocalCloudConfigurator_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.LocalCloudConfigurator.LocalCloudConfigurator.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.LocalCloudConfigurator.LocalCloudConfigurator.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadLocalCloudConfiguratorData::'Observation'[0..1];
    }
    part def LocalCloudConfigurator_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "LocalCloudConfigurator"; FunctionalProperties = "This document describes the LocalCloudConfigurator support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-LocalCloudConfigurator-java of the primary Java source tree (Eclipse-Arrowhead-java, Java-Spring with the vendored Eclipse Arrowhead common library) and deployed with the standalone Compose definition of that folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-LocalCloudConfigurator-java/documentation/v5.3.0/LocalCloudConfigurator-v5.3.0-SysD.tex"; }
        doc /* This document describes the LocalCloudConfigurator support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-LocalCloudConfigurator-java of the primary Java source tree (Eclipse-Arrowhead-java, Java-Spring with the vendored Eclipse Arrowhead common library) and deployed with the standalone Compose definition of that folder.
  \end{abstract} */
        port 'generalManagement_SD' : LocalCloudConfigurator_generalManagement_SD { @FullPort; }
        port 'localCloudConfiguration_SD' : LocalCloudConfigurator_localCloudConfiguration_SD { @FullPort; }
        port 'sysMonitor_SD' : LocalCloudConfigurator_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: ServiceRegistry, Authentication, ConsumerAuthorization, host worker (loopback, mTLS), ColonyOS (legacy backend). These are external requirements, not assumed co-deployments. */
    }
    part def LocalCloudConfigurator_SysDD :> LocalCloudConfigurator_SysD {
        @SysDD;
        port 'generalManagement_http' : LocalCloudConfigurator_generalManagement_HTTP_IDD { @FullPort; }
        port 'localCloudConfiguration_http' : LocalCloudConfigurator_localCloudConfiguration_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : LocalCloudConfigurator_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def LocalCloudConfigurator :> LocalCloudConfigurator_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8492;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'LocalCloudConfigurator_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /api/deployments/{id:[A-Za-z0-9-]{1,128}}; source ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/api/http/LocalCloudConfigurationAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/api/deployments/{id:[A-Za-z0-9-]{1,128}}"; } }
    action def 'LocalCloudConfigurator_Unregistered_1' { doc /* Unregistered HTTP endpoint; GET /api/configurations/{id:[a-f0-9-]{36}}; source ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/api/http/LocalCloudConfigurationAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/api/configurations/{id:[a-f0-9-]{36}}"; } }
    action def 'LocalCloudConfigurator_Unregistered_2' { doc /* Unregistered HTTP endpoint; PUT /api/configurations/{id:[a-f0-9-]{36}}; source ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/api/http/LocalCloudConfigurationAPI.java */ @WireOperation { protocol = "http"; method = "PUT"; address = "/api/configurations/{id:[a-f0-9-]{36}}"; } }
    action def 'LocalCloudConfigurator_Unregistered_3' { doc /* Unregistered HTTP endpoint; DELETE /api/configurations/{id:[a-f0-9-]{36}}; source ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/api/http/LocalCloudConfigurationAPI.java */ @WireOperation { protocol = "http"; method = "DELETE"; address = "/api/configurations/{id:[a-f0-9-]{36}}"; } }
}
