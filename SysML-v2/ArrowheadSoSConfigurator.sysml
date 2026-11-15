library package ArrowheadSoSConfigurator {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def SoSConfigurator_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-SoSConfigurator-java/documentation/v5.3.0/SoSConfigurator-v5.3.0-SysD.tex */
    }
    port def SoSConfigurator_generalManagement_HTTP_IDD :> SoSConfigurator_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/SoSConfiguratorSystemInfo.java"; }
        attribute basePath : String = "/sosconfigurator/general/mgmt";
        doc /* get-log: POST /sosconfigurator/general/mgmt/logs. Input: LogRequestDTO; output: LogEntryListResponseDTO.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
        doc /* get-config: GET /sosconfigurator/general/mgmt/get-config. Input: None; output: KeyValuesDTO.  */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def SoSConfigurator_generalManagement_HTTP_IDD_Implementation :> SoSConfigurator_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'SoSConfigurator_generalManagement_http_get-log_0' {
        doc /* Operation get-log. Wire method: POST; address: /sosconfigurator/general/mgmt/logs. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/sosconfigurator/general/mgmt/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'SoSConfigurator_generalManagement_http_get-config_1' {
        doc /* Operation get-config. Wire method: GET; address: /sosconfigurator/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/sosconfigurator/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def SoSConfigurator_sosConfiguration_SD :> ArrowheadService {
        @SD { MicroserviceName = "sosConfiguration"; }
        doc /* Service version 1.0.0. Source: ah5-SoSConfigurator-java/documentation/v5.3.0/SoSConfigurator-v5.3.0-SysD.tex */
    }
    port def SoSConfigurator_sosConfiguration_HTTP_IDD :> SoSConfigurator_sosConfiguration_SD {
        @IDD { MicroserviceName = "sosConfiguration"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/SoSConfiguratorSystemInfo.java"; }
        attribute basePath : String = "/api";
        doc /* catalog: GET /api/catalog. Input: None; output: ResponseEntity<String>.  */
        out attribute 'catalogResponse' : ScalarValues::String[0..1];
        doc /* status: GET /api/status. Input: None; output: ResponseEntity<String>.  */
        out attribute 'statusResponse' : ScalarValues::String[0..1];
        doc /* plan: POST /api/plan. Input: final; output: ResponseEntity<String>.  */
        in item 'planRequest' : JSONMessage[0..1];
        out attribute 'planResponse' : ScalarValues::String[0..1];
        doc /* submit-deployment: POST /api/deployments. Input: final; output: ResponseEntity<String>.  */
        in item 'submit-deploymentRequest' : JSONMessage[0..1];
        out attribute 'submit-deploymentResponse' : ScalarValues::String[0..1];
        doc /* list-deployments: GET /api/deployments. Input: None; output: ResponseEntity<String>.  */
        out attribute 'list-deploymentsResponse' : ScalarValues::String[0..1];
        doc /* get-deployment: GET /api/deployments/{id}. Input: None; output: ResponseEntity<String>.  */
        out attribute 'get-deploymentResponse' : ScalarValues::String[0..1];
    }
    port def SoSConfigurator_sosConfiguration_HTTP_IDD_Implementation :> SoSConfigurator_sosConfiguration_HTTP_IDD { @IDD_Implementation; }
    action def 'SoSConfigurator_sosConfiguration_http_catalog_0' {
        doc /* Operation catalog. Wire method: GET; address: /api/catalog. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/catalog"; requestType = "unspecified"; responseType = "ResponseEntity<String>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out attribute 'response' : ScalarValues::String[0..1];
    }
    action def 'SoSConfigurator_sosConfiguration_http_status_1' {
        doc /* Operation status. Wire method: GET; address: /api/status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/status"; requestType = "unspecified"; responseType = "ResponseEntity<String>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out attribute 'response' : ScalarValues::String[0..1];
    }
    action def 'SoSConfigurator_sosConfiguration_http_plan_2' {
        doc /* Operation plan. Wire method: POST; address: /api/plan. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/api/plan"; requestType = "final"; responseType = "ResponseEntity<String>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out attribute 'response' : ScalarValues::String[0..1];
    }
    action def 'SoSConfigurator_sosConfiguration_http_submit-deployment_3' {
        doc /* Operation submit-deployment. Wire method: POST; address: /api/deployments. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/api/deployments"; requestType = "final"; responseType = "ResponseEntity<String>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out attribute 'response' : ScalarValues::String[0..1];
    }
    action def 'SoSConfigurator_sosConfiguration_http_list-deployments_4' {
        doc /* Operation list-deployments. Wire method: GET; address: /api/deployments. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/deployments"; requestType = "unspecified"; responseType = "ResponseEntity<String>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out attribute 'response' : ScalarValues::String[0..1];
    }
    action def 'SoSConfigurator_sosConfiguration_http_get-deployment_5' {
        doc /* Operation get-deployment. Wire method: GET; address: /api/deployments/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/deployments/{id}"; requestType = "unspecified"; responseType = "ResponseEntity<String>"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        out attribute 'response' : ScalarValues::String[0..1];
    }
    port def SoSConfigurator_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-SoSConfigurator-java/documentation/v5.3.0/SoSConfigurator-v5.3.0-SysD.tex */
    }
    port def SoSConfigurator_sysMonitor_AMQP_IDD :> SoSConfigurator_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-SoSConfigurator-java/documentation/v5.3.0/SoSConfigurator-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.SoSConfigurator.SoSConfigurator";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, the common sysMonitor publisher of SoSConfigurator registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.SoSConfigurator.SoSConfigurator",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.SoSConfigurator.SoSConfigurator.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadSoSConfiguratorData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.SoSConfigurator.SoSConfigurator.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadSoSConfiguratorData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.SoSConfigurator.SoSConfigurator.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadSoSConfiguratorData::'Observation'[0..1];
    }
    port def SoSConfigurator_sysMonitor_AMQP_IDD_Implementation :> SoSConfigurator_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'SoSConfigurator_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.SoSConfigurator.SoSConfigurator.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.SoSConfigurator.SoSConfigurator.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadSoSConfiguratorData::'Observation'[0..1];
    }
    action def 'SoSConfigurator_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.SoSConfigurator.SoSConfigurator.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.SoSConfigurator.SoSConfigurator.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadSoSConfiguratorData::'Observation'[0..1];
    }
    action def 'SoSConfigurator_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.SoSConfigurator.SoSConfigurator.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.SoSConfigurator.SoSConfigurator.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadSoSConfiguratorData::'Observation'[0..1];
    }
    part def SoSConfigurator_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "SoSConfigurator"; FunctionalProperties = "Java release 5.3 support system SoSConfigurator Legacy system; superseded by SoLocalCloudConfigurator."; }
        @SourceTrace { path = "ah5-SoSConfigurator-java/documentation/v5.3.0/SoSConfigurator-v5.3.0-SysD.tex"; }
        doc /* Java release 5.3 support system SoSConfigurator Legacy system; superseded by SoLocalCloudConfigurator. */
        port 'generalManagement_SD' : SoSConfigurator_generalManagement_SD { @FullPort; }
        port 'sosConfiguration_SD' : SoSConfigurator_sosConfiguration_SD { @FullPort; }
        port 'sysMonitor_SD' : SoSConfigurator_sysMonitor_SD[0..1] { @FullPort; }
    }
    part def SoSConfigurator_SysDD :> SoSConfigurator_SysD {
        @SysDD;
        port 'generalManagement_http' : SoSConfigurator_generalManagement_HTTP_IDD { @FullPort; }
        port 'sosConfiguration_http' : SoSConfigurator_sosConfiguration_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : SoSConfigurator_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def SoSConfigurator :> SoSConfigurator_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8494;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'SoSConfigurator_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /index.html; source ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/console/ConsoleController.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/index.html"; } }
    action def 'SoSConfigurator_Unregistered_1' { doc /* Unregistered HTTP endpoint; GET /app.js; source ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/console/ConsoleController.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/app.js"; } }
    action def 'SoSConfigurator_Unregistered_2' { doc /* Unregistered HTTP endpoint; GET /healthz; source ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/console/ConsoleController.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/healthz"; } }
    action def 'SoSConfigurator_Unregistered_3' { doc /* Unregistered HTTP endpoint; POST /api/session; source ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/console/ConsoleController.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/api/session"; } }
    action def 'SoSConfigurator_Unregistered_4' { doc /* Unregistered HTTP endpoint; DELETE /api/session; source ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/console/ConsoleController.java */ @WireOperation { protocol = "http"; method = "DELETE"; address = "/api/session"; } }
}
