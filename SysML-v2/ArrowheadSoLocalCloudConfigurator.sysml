library package ArrowheadSoLocalCloudConfigurator {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def SoLocalCloudConfigurator_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-SoLocalCloudConfigurator-java/README.md */
    }
    port def SoLocalCloudConfigurator_generalManagement_HTTP_IDD :> SoLocalCloudConfigurator_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/SoLocalCloudConfiguratorSystemInfo.java"; }
        attribute basePath : String = "/solocalcloudconfigurator/general/mgmt";
        doc /* get-log: POST /solocalcloudconfigurator/general/mgmt/logs. Input: LogRequestDTO; output: LogEntryListResponseDTO.  */
        in item 'get-logRequest' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'get-logResponse' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
        doc /* get-config: GET /solocalcloudconfigurator/general/mgmt/get-config. Input: None; output: KeyValuesDTO.  */
        out item 'get-configResponse' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def SoLocalCloudConfigurator_generalManagement_HTTP_IDD_Implementation :> SoLocalCloudConfigurator_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'SoLocalCloudConfigurator_generalManagement_http_get-log_0' {
        doc /* Operation get-log. Wire method: POST; address: /solocalcloudconfigurator/general/mgmt/logs. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/solocalcloudconfigurator/general/mgmt/logs"; requestType = "LogRequestDTO"; responseType = "LogEntryListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadCoreData::'LogRequestDTO'[0..1];
        out item 'response' : ArrowheadCoreData::'LogEntryListResponseDTO'[0..1];
    }
    action def 'SoLocalCloudConfigurator_generalManagement_http_get-config_1' {
        doc /* Operation get-config. Wire method: GET; address: /solocalcloudconfigurator/general/mgmt/get-config. Query parameters: [{"name": "keys", "type": "List<String>", "required": false, "default": null}]. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/solocalcloudconfigurator/general/mgmt/get-config"; requestType = "unspecified"; responseType = "KeyValuesDTO"; queryParameters = "[{\"name\": \"keys\", \"type\": \"List<String>\", \"required\": false, \"default\": null}]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'KeyValuesDTO'[0..1];
    }
    port def SoLocalCloudConfigurator_soLocalCloudConfiguration_SD :> ArrowheadService {
        @SD { MicroserviceName = "soLocalCloudConfiguration"; }
        doc /* Service version 1.0.0. Source: ah5-SoLocalCloudConfigurator-java/README.md */
    }
    port def SoLocalCloudConfigurator_soLocalCloudConfiguration_HTTP_IDD :> SoLocalCloudConfigurator_soLocalCloudConfiguration_SD {
        @IDD { MicroserviceName = "soLocalCloudConfiguration"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/SoLocalCloudConfiguratorSystemInfo.java"; }
        attribute basePath : String = "/api";
        doc /* catalog: GET /api/catalog. Input: None; output: PolicyCatalog.  */
        out item 'catalogResponse' : ArrowheadSoLocalCloudConfiguratorData::'PolicyCatalog'[0..1];
        doc /* list-lc-designs: GET /api/lc-designs. Input: None; output: Map<String, Object>.  */
        out item 'list-lc-designsResponse' : JSONMessage[0..1];
        doc /* list-designs: GET /api/designs. Input: None; output: Map<String, Object>.  */
        out item 'list-designsResponse' : JSONMessage[0..1];
        doc /* get-design: GET /api/designs/{id}. Input: None; output: None.  */
        doc /* create-design: POST /api/designs. Input: None; output: ResponseEntity<DesignRecord>.  */
        out item 'create-designResponse' : ArrowheadSoLocalCloudConfiguratorData::'DesignRecord'[0..1];
        doc /* update-design: PUT /api/designs/{id}. Input: None; output: None.  */
        doc /* remove-design: DELETE /api/designs/{id}. Input: None; output: None.  */
        doc /* plan: POST /api/plan. Input: None; output: Map<String, Object>.  */
        out item 'planResponse' : JSONMessage[0..1];
        doc /* build-package: POST /api/packages. Input: None; output: ResponseEntity<PackageRecord>.  */
        out item 'build-packageResponse' : ArrowheadSoLocalCloudConfiguratorData::'PackageRecord'[0..1];
        doc /* list-packages: GET /api/packages. Input: None; output: Map<String, Object>.  */
        out item 'list-packagesResponse' : JSONMessage[0..1];
        doc /* get-package: GET /api/packages/{id}. Input: None; output: None.  */
        doc /* remove-package: DELETE /api/packages/{id}. Input: None; output: None.  */
    }
    port def SoLocalCloudConfigurator_soLocalCloudConfiguration_HTTP_IDD_Implementation :> SoLocalCloudConfigurator_soLocalCloudConfiguration_HTTP_IDD { @IDD_Implementation; }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_catalog_0' {
        doc /* Operation catalog. Wire method: GET; address: /api/catalog. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/catalog"; requestType = "unspecified"; responseType = "PolicyCatalog"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadSoLocalCloudConfiguratorData::'PolicyCatalog'[0..1];
    }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_list-lc-designs_1' {
        doc /* Operation list-lc-designs. Wire method: GET; address: /api/lc-designs. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/lc-designs"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_list-designs_2' {
        doc /* Operation list-designs. Wire method: GET; address: /api/designs. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/designs"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_get-design_3' {
        doc /* Operation get-design. Wire method: GET; address: /api/designs/{id}. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/designs/{id}"; requestType = "unspecified"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
    }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_create-design_4' {
        doc /* Operation create-design. Wire method: POST; address: /api/designs. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/api/designs"; requestType = "unspecified"; responseType = "ResponseEntity<DesignRecord>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadSoLocalCloudConfiguratorData::'DesignRecord'[0..1];
    }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_update-design_5' {
        doc /* Operation update-design. Wire method: PUT; address: /api/designs/{id}. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/api/designs/{id}"; requestType = "unspecified"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
    }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_remove-design_6' {
        doc /* Operation remove-design. Wire method: DELETE; address: /api/designs/{id}. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/api/designs/{id}"; requestType = "unspecified"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
    }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_plan_7' {
        doc /* Operation plan. Wire method: POST; address: /api/plan. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/api/plan"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_build-package_8' {
        doc /* Operation build-package. Wire method: POST; address: /api/packages. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/api/packages"; requestType = "unspecified"; responseType = "ResponseEntity<PackageRecord>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadSoLocalCloudConfiguratorData::'PackageRecord'[0..1];
    }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_list-packages_9' {
        doc /* Operation list-packages. Wire method: GET; address: /api/packages. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/packages"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_get-package_10' {
        doc /* Operation get-package. Wire method: GET; address: /api/packages/{id}. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/api/packages/{id}"; requestType = "unspecified"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
    }
    action def 'SoLocalCloudConfigurator_soLocalCloudConfiguration_http_remove-package_11' {
        doc /* Operation remove-package. Wire method: DELETE; address: /api/packages/{id}. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/api/packages/{id}"; requestType = "unspecified"; responseType = "unspecified"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
    }
    port def SoLocalCloudConfigurator_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-SoLocalCloudConfigurator-java/README.md */
    }
    port def SoLocalCloudConfigurator_sysMonitor_AMQP_IDD :> SoLocalCloudConfigurator_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-core-java-spring/serviceregistry/documentation/v5.3.0/ServiceRegistry-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.ServiceRegistry.ServiceRegistry";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, ServiceRegistry registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.ServiceRegistry.ServiceRegistry",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.ServiceRegistry.ServiceRegistry.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadCoreData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.ServiceRegistry.ServiceRegistry.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadCoreData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.ServiceRegistry.ServiceRegistry.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadCoreData::'Observation'[0..1];
    }
    port def SoLocalCloudConfigurator_sysMonitor_AMQP_IDD_Implementation :> SoLocalCloudConfigurator_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'SoLocalCloudConfigurator_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.ServiceRegistry.ServiceRegistry.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.ServiceRegistry.ServiceRegistry.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    action def 'SoLocalCloudConfigurator_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.ServiceRegistry.ServiceRegistry.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.ServiceRegistry.ServiceRegistry.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    action def 'SoLocalCloudConfigurator_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.ServiceRegistry.ServiceRegistry.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.ServiceRegistry.ServiceRegistry.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCoreData::'Observation'[0..1];
    }
    part def SoLocalCloudConfigurator_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "SoLocalCloudConfigurator"; FunctionalProperties = "Arrowhead 5.3 support system for **Systems of LocalClouds (SoLC)**: several local clouds, each built from a local-cloud\ndesign stored in LocalCloudConfigurator, federated through an organisation relay, with the inter-cloud service exchanges\nbetween them. It replaces the console's former SoS view and absorbs SoSConfigurator's policy engine and inter-cloud\nplanner (SoSConfigurator stays as legacy)."; }
        @SourceTrace { path = "ah5-SoLocalCloudConfigurator-java/README.md"; }
        doc /* Arrowhead 5.3 support system for **Systems of LocalClouds (SoLC)**: several local clouds, each built from a local-cloud
design stored in LocalCloudConfigurator, federated through an organisation relay, with the inter-cloud service exchanges
between them. It replaces the console's former SoS view and absorbs SoSConfigurator's policy engine and inter-cloud
planner (SoSConfigurator stays as legacy). */
        port 'generalManagement_SD' : SoLocalCloudConfigurator_generalManagement_SD { @FullPort; }
        port 'soLocalCloudConfiguration_SD' : SoLocalCloudConfigurator_soLocalCloudConfiguration_SD { @FullPort; }
        port 'sysMonitor_SD' : SoLocalCloudConfigurator_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: localCloudConfiguration, serviceOrchestration, authorization, identity, serviceDiscovery. These are external requirements, not assumed co-deployments. */
    }
    part def SoLocalCloudConfigurator_SysDD :> SoLocalCloudConfigurator_SysD {
        @SysDD;
        port 'generalManagement_http' : SoLocalCloudConfigurator_generalManagement_HTTP_IDD { @FullPort; }
        port 'soLocalCloudConfiguration_http' : SoLocalCloudConfigurator_soLocalCloudConfiguration_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : SoLocalCloudConfigurator_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def SoLocalCloudConfigurator :> SoLocalCloudConfigurator_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8496;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'SoLocalCloudConfigurator_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /api/designs/{id:[a-f0-9-]{36}}; source ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/api/http/SoLocalCloudConfigurationAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/api/designs/{id:[a-f0-9-]{36}}"; } }
    action def 'SoLocalCloudConfigurator_Unregistered_1' { doc /* Unregistered HTTP endpoint; PUT /api/designs/{id:[a-f0-9-]{36}}; source ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/api/http/SoLocalCloudConfigurationAPI.java */ @WireOperation { protocol = "http"; method = "PUT"; address = "/api/designs/{id:[a-f0-9-]{36}}"; } }
    action def 'SoLocalCloudConfigurator_Unregistered_2' { doc /* Unregistered HTTP endpoint; DELETE /api/designs/{id:[a-f0-9-]{36}}; source ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/api/http/SoLocalCloudConfigurationAPI.java */ @WireOperation { protocol = "http"; method = "DELETE"; address = "/api/designs/{id:[a-f0-9-]{36}}"; } }
    action def 'SoLocalCloudConfigurator_Unregistered_3' { doc /* Unregistered HTTP endpoint; GET /api/packages/{id:[a-f0-9-]{36}}; source ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/api/http/SoLocalCloudConfigurationAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/api/packages/{id:[a-f0-9-]{36}}"; } }
    action def 'SoLocalCloudConfigurator_Unregistered_4' { doc /* Unregistered HTTP endpoint; DELETE /api/packages/{id:[a-f0-9-]{36}}; source ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/api/http/SoLocalCloudConfigurationAPI.java */ @WireOperation { protocol = "http"; method = "DELETE"; address = "/api/packages/{id:[a-f0-9-]{36}}"; } }
}
