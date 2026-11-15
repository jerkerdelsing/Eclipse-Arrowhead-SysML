library package ArrowheadDataManager {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def DataManager_dataProxy_SD :> ArrowheadService {
        @SD { MicroserviceName = "dataProxy"; }
        doc /* Service version 1.0.0. Source: ah5-DataManager-java-spring/documentation/v5.3.0/DataManager-v5.3.0-SysD.tex */
    }
    port def DataManager_dataProxy_HTTP_IDD :> DataManager_dataProxy_SD {
        @IDD { MicroserviceName = "dataProxy"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-DataManager-java-spring/documentation/v5.3.0/DataManager-v5.3.0-dataProxy-HTTP-IDD.tex"; }
        attribute basePath : String = "/datamanager/data-proxy";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address datamanager, port 8461 and base path /datamanager/data-proxy. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
list-systems & GET & /systems \\ \hline
list-services & GET & \texttt{/systems/{systemName}/services} \\ \hline
get-data & GET & \texttt{/systems/{systemName}/services/{serviceName}/data} \\ \hline
put-data & PUT & \texttt{/systems/{systemName}/services/{serviceName}/data} \\ \hline
\end{longtable}

\newpage */
        doc /* list-systems: GET /datamanager/data-proxy/systems. Input: None; output: SystemListResponseDTO.  */
        out item 'list-systemsResponse' : ArrowheadDataManagerData::'SystemListResponseDTO'[0..1];
        doc /* list-services: GET /datamanager/data-proxy/systems/{systemName}/services. Input: None; output: ServiceListResponseDTO.  */
        out item 'list-servicesResponse' : ArrowheadDataManagerData::'ServiceListResponseDTO'[0..1];
        doc /* get-data: GET /datamanager/data-proxy/systems/{systemName}/services/{serviceName}/data. Input: None; output: List<SenMLRecordDTO>.  */
        out item 'get-dataResponse' : ArrowheadDataManagerData::'SenMLRecordDTO'[0..*];
        doc /* put-data: PUT /datamanager/data-proxy/systems/{systemName}/services/{serviceName}/data. Input: List<SenMLRecordDTO>; output: ResponseEntity<Void>.  */
        in item 'put-dataRequest' : ArrowheadDataManagerData::'SenMLRecordDTO'[0..*];
    }
    port def DataManager_dataProxy_HTTP_IDD_Implementation :> DataManager_dataProxy_HTTP_IDD { @IDD_Implementation; }
    action def 'DataManager_dataProxy_http_list-systems_0' {
        doc /* Operation list-systems. Wire method: GET; address: /datamanager/data-proxy/systems. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/datamanager/data-proxy/systems"; requestType = "unspecified"; responseType = "SystemListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDataManagerData::'SystemListResponseDTO'[0..1];
    }
    action def 'DataManager_dataProxy_http_list-services_1' {
        doc /* Operation list-services. Wire method: GET; address: /datamanager/data-proxy/systems/{systemName}/services. Query parameters: []. Path parameters: ["systemName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/datamanager/data-proxy/systems/{systemName}/services"; requestType = "unspecified"; responseType = "ServiceListResponseDTO"; queryParameters = "[]"; pathParameters = "[\"systemName\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDataManagerData::'ServiceListResponseDTO'[0..1];
    }
    action def 'DataManager_dataProxy_http_get-data_2' {
        doc /* Operation get-data. Wire method: GET; address: /datamanager/data-proxy/systems/{systemName}/services/{serviceName}/data. Query parameters: []. Path parameters: ["systemName", "serviceName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/datamanager/data-proxy/systems/{systemName}/services/{serviceName}/data"; requestType = "unspecified"; responseType = "List<SenMLRecordDTO>"; queryParameters = "[]"; pathParameters = "[\"systemName\", \"serviceName\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDataManagerData::'SenMLRecordDTO'[0..*];
    }
    action def 'DataManager_dataProxy_http_put-data_3' {
        doc /* Operation put-data. Wire method: PUT; address: /datamanager/data-proxy/systems/{systemName}/services/{serviceName}/data. Query parameters: []. Path parameters: ["systemName", "serviceName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/datamanager/data-proxy/systems/{systemName}/services/{serviceName}/data"; requestType = "List<SenMLRecordDTO>"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"systemName\", \"serviceName\"]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadDataManagerData::'SenMLRecordDTO'[0..*];
    }
    port def DataManager_dataHistorian_SD :> ArrowheadService {
        @SD { MicroserviceName = "dataHistorian"; }
        doc /* Service version 1.0.0. Source: ah5-DataManager-java-spring/documentation/v5.3.0/DataManager-v5.3.0-SysD.tex */
    }
    port def DataManager_dataHistorian_HTTP_IDD :> DataManager_dataHistorian_SD {
        @IDD { MicroserviceName = "dataHistorian"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-DataManager-java-spring/documentation/v5.3.0/DataManager-v5.3.0-dataHistorian-HTTP-IDD.tex"; }
        attribute basePath : String = "/datamanager/data-historian";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address datamanager, port 8461 and base path /datamanager/data-historian. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
list-systems & GET & /systems \\ \hline
list-services & GET & \texttt{/systems/{systemName}/services} \\ \hline
get-data & GET & \texttt{/systems/{systemName}/services/{serviceName}/data} \\ \hline
put-data & PUT & \texttt{/systems/{systemName}/services/{serviceName}/data} \\ \hline
\end{longtable}

\newpage */
        doc /* list-systems: GET /datamanager/data-historian/systems. Input: None; output: SystemListResponseDTO.  */
        out item 'list-systemsResponse' : ArrowheadDataManagerData::'SystemListResponseDTO'[0..1];
        doc /* list-services: GET /datamanager/data-historian/systems/{systemName}/services. Input: None; output: ServiceListResponseDTO.  */
        out item 'list-servicesResponse' : ArrowheadDataManagerData::'ServiceListResponseDTO'[0..1];
        doc /* get-data: GET /datamanager/data-historian/systems/{systemName}/services/{serviceName}/data. Input: None; output: List<SenMLRecordDTO>.  */
        out item 'get-dataResponse' : ArrowheadDataManagerData::'SenMLRecordDTO'[0..*];
        doc /* put-data: PUT /datamanager/data-historian/systems/{systemName}/services/{serviceName}/data. Input: List<SenMLRecordDTO>; output: ResponseEntity<Void>.  */
        in item 'put-dataRequest' : ArrowheadDataManagerData::'SenMLRecordDTO'[0..*];
    }
    port def DataManager_dataHistorian_HTTP_IDD_Implementation :> DataManager_dataHistorian_HTTP_IDD { @IDD_Implementation; }
    action def 'DataManager_dataHistorian_http_list-systems_0' {
        doc /* Operation list-systems. Wire method: GET; address: /datamanager/data-historian/systems. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/datamanager/data-historian/systems"; requestType = "unspecified"; responseType = "SystemListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDataManagerData::'SystemListResponseDTO'[0..1];
    }
    action def 'DataManager_dataHistorian_http_list-services_1' {
        doc /* Operation list-services. Wire method: GET; address: /datamanager/data-historian/systems/{systemName}/services. Query parameters: []. Path parameters: ["systemName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/datamanager/data-historian/systems/{systemName}/services"; requestType = "unspecified"; responseType = "ServiceListResponseDTO"; queryParameters = "[]"; pathParameters = "[\"systemName\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDataManagerData::'ServiceListResponseDTO'[0..1];
    }
    action def 'DataManager_dataHistorian_http_get-data_2' {
        doc /* Operation get-data. Wire method: GET; address: /datamanager/data-historian/systems/{systemName}/services/{serviceName}/data. Query parameters: [{"name": "from", "type": "Double", "required": false, "default": null}, {"name": "to", "type": "Double", "required": false, "default": null}, {"name": "count", "type": "Integer", "required": false, "default": null}, {"name": "signals", "type": "List<String>", "required": false, "default": null}, {"name": "signalCount", "type": "Integer", "required": false, "default": null}]. Path parameters: ["systemName", "serviceName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/datamanager/data-historian/systems/{systemName}/services/{serviceName}/data"; requestType = "unspecified"; responseType = "List<SenMLRecordDTO>"; queryParameters = "[{\"name\": \"from\", \"type\": \"Double\", \"required\": false, \"default\": null}, {\"name\": \"to\", \"type\": \"Double\", \"required\": false, \"default\": null}, {\"name\": \"count\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"signals\", \"type\": \"List<String>\", \"required\": false, \"default\": null}, {\"name\": \"signalCount\", \"type\": \"Integer\", \"required\": false, \"default\": null}]"; pathParameters = "[\"systemName\", \"serviceName\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDataManagerData::'SenMLRecordDTO'[0..*];
    }
    action def 'DataManager_dataHistorian_http_put-data_3' {
        doc /* Operation put-data. Wire method: PUT; address: /datamanager/data-historian/systems/{systemName}/services/{serviceName}/data. Query parameters: []. Path parameters: ["systemName", "serviceName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/datamanager/data-historian/systems/{systemName}/services/{serviceName}/data"; requestType = "List<SenMLRecordDTO>"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"systemName\", \"serviceName\"]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadDataManagerData::'SenMLRecordDTO'[0..*];
    }
    port def DataManager_generalManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "generalManagement"; }
        doc /* Service version 1.0.0. Source: ah5-DataManager-java-spring/documentation/v5.3.0/DataManager-v5.3.0-SysD.tex */
    }
    port def DataManager_generalManagement_HTTP_IDD :> DataManager_generalManagement_SD {
        @IDD { MicroserviceName = "generalManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-DataManager-java-spring/src/main/java/eu/arrowhead/datamanager/DataManagerSystemInfo.java"; }
        attribute basePath : String = "/datamanager/mgmt/general";
        doc /* status: GET /datamanager/mgmt/general/status. Input: None; output: Map<String, Object>.  */
        out item 'statusResponse' : JSONMessage[0..1];
    }
    port def DataManager_generalManagement_HTTP_IDD_Implementation :> DataManager_generalManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'DataManager_generalManagement_http_status_0' {
        doc /* Operation status. Wire method: GET; address: /datamanager/mgmt/general/status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/datamanager/mgmt/general/status"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    port def DataManager_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-DataManager-java-spring/documentation/v5.3.0/DataManager-v5.3.0-SysD.tex */
    }
    port def DataManager_sysMonitor_AMQP_IDD :> DataManager_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-DataManager-java-spring/documentation/v5.3.0/DataManager-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.DataManager.DataManager";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, DataManager registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.DataManager.DataManager",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.DataManager.DataManager.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadDataManagerData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.DataManager.DataManager.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadDataManagerData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.DataManager.DataManager.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadDataManagerData::'Observation'[0..1];
    }
    port def DataManager_sysMonitor_AMQP_IDD_Implementation :> DataManager_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'DataManager_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DataManager.DataManager.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DataManager.DataManager.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDataManagerData::'Observation'[0..1];
    }
    action def 'DataManager_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DataManager.DataManager.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DataManager.DataManager.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDataManagerData::'Observation'[0..1];
    }
    action def 'DataManager_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DataManager.DataManager.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DataManager.DataManager.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadDataManagerData::'Observation'[0..1];
    }
    part def DataManager_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "DataManager"; FunctionalProperties = "This document describes the DataManager support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-DataManager-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-DataManager-java-spring/documentation/v5.3.0/DataManager-v5.3.0-SysD.tex"; }
        doc /* This document describes the DataManager support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-DataManager-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.
  \end{abstract} */
        port 'dataProxy_SD' : DataManager_dataProxy_SD { @FullPort; }
        port 'dataHistorian_SD' : DataManager_dataHistorian_SD { @FullPort; }
        port 'generalManagement_SD' : DataManager_generalManagement_SD { @FullPort; }
        port 'sysMonitor_SD' : DataManager_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, ConsumerAuthorization, ServiceRegistry. These are external requirements, not assumed co-deployments. */
    }
    part def DataManager_SysDD :> DataManager_SysD {
        @SysDD;
        port 'dataProxy_http' : DataManager_dataProxy_HTTP_IDD { @FullPort; }
        port 'dataHistorian_http' : DataManager_dataHistorian_HTTP_IDD { @FullPort; }
        port 'generalManagement_http' : DataManager_generalManagement_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : DataManager_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def DataManager :> DataManager_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8461;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
}
