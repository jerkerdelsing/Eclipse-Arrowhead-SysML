library package ArrowheadGraphDBManager {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def GraphDBManager_graphDataProxy_SD :> ArrowheadService {
        @SD { MicroserviceName = "graphDataProxy"; }
        doc /* Service version 1.0.0. Source: ah5-GraphDBManager-java-spring/documentation/v5.3.0/GraphDBManager-v5.3.0-SysD.tex */
    }
    port def GraphDBManager_graphDataProxy_HTTP_IDD :> GraphDBManager_graphDataProxy_SD {
        @IDD { MicroserviceName = "graphDataProxy"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-GraphDBManager-java-spring/documentation/v5.3.0/GraphDBManager-v5.3.0-graphDataProxy-HTTP-IDD.tex"; }
        attribute basePath : String = "/graphdbmanager/data-proxy";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address graphdbmanager, port 8467 and base path /graphdbmanager/data-proxy. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
list-systems & GET & /systems \\ \hline
list-services & GET & \texttt{/systems/{systemName}/services} \\ \hline
get-data & GET & \texttt{/systems/{systemName}/services/{serviceName}/data} \\ \hline
put-data & PUT & \texttt{/systems/{systemName}/services/{serviceName}/data} \\ \hline
\end{longtable}

\newpage */
        doc /* list-systems: GET /graphdbmanager/data-proxy/systems. Input: None; output: SystemListResponseDTO.  */
        out item 'list-systemsResponse' : ArrowheadGraphDBManagerData::'SystemListResponseDTO'[0..1];
        doc /* list-services: GET /graphdbmanager/data-proxy/systems/{systemName}/services. Input: None; output: ServiceListResponseDTO.  */
        out item 'list-servicesResponse' : ArrowheadGraphDBManagerData::'ServiceListResponseDTO'[0..1];
        doc /* get-data: GET /graphdbmanager/data-proxy/systems/{systemName}/services/{serviceName}/data. Input: None; output: List<SenMLRecordDTO>.  */
        out item 'get-dataResponse' : ArrowheadGraphDBManagerData::'SenMLRecordDTO'[0..*];
        doc /* put-data: PUT /graphdbmanager/data-proxy/systems/{systemName}/services/{serviceName}/data. Input: List<SenMLRecordDTO>; output: ResponseEntity<Void>.  */
        in item 'put-dataRequest' : ArrowheadGraphDBManagerData::'SenMLRecordDTO'[0..*];
    }
    port def GraphDBManager_graphDataProxy_HTTP_IDD_Implementation :> GraphDBManager_graphDataProxy_HTTP_IDD { @IDD_Implementation; }
    action def 'GraphDBManager_graphDataProxy_http_list-systems_0' {
        doc /* Operation list-systems. Wire method: GET; address: /graphdbmanager/data-proxy/systems. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/graphdbmanager/data-proxy/systems"; requestType = "unspecified"; responseType = "SystemListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGraphDBManagerData::'SystemListResponseDTO'[0..1];
    }
    action def 'GraphDBManager_graphDataProxy_http_list-services_1' {
        doc /* Operation list-services. Wire method: GET; address: /graphdbmanager/data-proxy/systems/{systemName}/services. Query parameters: []. Path parameters: ["systemName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/graphdbmanager/data-proxy/systems/{systemName}/services"; requestType = "unspecified"; responseType = "ServiceListResponseDTO"; queryParameters = "[]"; pathParameters = "[\"systemName\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGraphDBManagerData::'ServiceListResponseDTO'[0..1];
    }
    action def 'GraphDBManager_graphDataProxy_http_get-data_2' {
        doc /* Operation get-data. Wire method: GET; address: /graphdbmanager/data-proxy/systems/{systemName}/services/{serviceName}/data. Query parameters: []. Path parameters: ["systemName", "serviceName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/graphdbmanager/data-proxy/systems/{systemName}/services/{serviceName}/data"; requestType = "unspecified"; responseType = "List<SenMLRecordDTO>"; queryParameters = "[]"; pathParameters = "[\"systemName\", \"serviceName\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGraphDBManagerData::'SenMLRecordDTO'[0..*];
    }
    action def 'GraphDBManager_graphDataProxy_http_put-data_3' {
        doc /* Operation put-data. Wire method: PUT; address: /graphdbmanager/data-proxy/systems/{systemName}/services/{serviceName}/data. Query parameters: []. Path parameters: ["systemName", "serviceName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/graphdbmanager/data-proxy/systems/{systemName}/services/{serviceName}/data"; requestType = "List<SenMLRecordDTO>"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"systemName\", \"serviceName\"]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadGraphDBManagerData::'SenMLRecordDTO'[0..*];
    }
    port def GraphDBManager_graphDataHistorian_SD :> ArrowheadService {
        @SD { MicroserviceName = "graphDataHistorian"; }
        doc /* Service version 1.0.0. Source: ah5-GraphDBManager-java-spring/documentation/v5.3.0/GraphDBManager-v5.3.0-SysD.tex */
    }
    port def GraphDBManager_graphDataHistorian_HTTP_IDD :> GraphDBManager_graphDataHistorian_SD {
        @IDD { MicroserviceName = "graphDataHistorian"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-GraphDBManager-java-spring/documentation/v5.3.0/GraphDBManager-v5.3.0-graphDataHistorian-HTTP-IDD.tex"; }
        attribute basePath : String = "/graphdbmanager/data-historian";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address graphdbmanager, port 8467 and base path /graphdbmanager/data-historian. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
list-systems & GET & /systems \\ \hline
list-services & GET & \texttt{/systems/{systemName}/services} \\ \hline
get-data & GET & \texttt{/systems/{systemName}/services/{serviceName}/data} \\ \hline
put-data & PUT & \texttt{/systems/{systemName}/services/{serviceName}/data} \\ \hline
\end{longtable}

\newpage */
        doc /* list-systems: GET /graphdbmanager/data-historian/systems. Input: None; output: SystemListResponseDTO.  */
        out item 'list-systemsResponse' : ArrowheadGraphDBManagerData::'SystemListResponseDTO'[0..1];
        doc /* list-services: GET /graphdbmanager/data-historian/systems/{systemName}/services. Input: None; output: ServiceListResponseDTO.  */
        out item 'list-servicesResponse' : ArrowheadGraphDBManagerData::'ServiceListResponseDTO'[0..1];
        doc /* get-data: GET /graphdbmanager/data-historian/systems/{systemName}/services/{serviceName}/data. Input: None; output: List<SenMLRecordDTO>.  */
        out item 'get-dataResponse' : ArrowheadGraphDBManagerData::'SenMLRecordDTO'[0..*];
        doc /* put-data: PUT /graphdbmanager/data-historian/systems/{systemName}/services/{serviceName}/data. Input: List<SenMLRecordDTO>; output: ResponseEntity<Void>.  */
        in item 'put-dataRequest' : ArrowheadGraphDBManagerData::'SenMLRecordDTO'[0..*];
    }
    port def GraphDBManager_graphDataHistorian_HTTP_IDD_Implementation :> GraphDBManager_graphDataHistorian_HTTP_IDD { @IDD_Implementation; }
    action def 'GraphDBManager_graphDataHistorian_http_list-systems_0' {
        doc /* Operation list-systems. Wire method: GET; address: /graphdbmanager/data-historian/systems. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/graphdbmanager/data-historian/systems"; requestType = "unspecified"; responseType = "SystemListResponseDTO"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGraphDBManagerData::'SystemListResponseDTO'[0..1];
    }
    action def 'GraphDBManager_graphDataHistorian_http_list-services_1' {
        doc /* Operation list-services. Wire method: GET; address: /graphdbmanager/data-historian/systems/{systemName}/services. Query parameters: []. Path parameters: ["systemName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/graphdbmanager/data-historian/systems/{systemName}/services"; requestType = "unspecified"; responseType = "ServiceListResponseDTO"; queryParameters = "[]"; pathParameters = "[\"systemName\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGraphDBManagerData::'ServiceListResponseDTO'[0..1];
    }
    action def 'GraphDBManager_graphDataHistorian_http_get-data_2' {
        doc /* Operation get-data. Wire method: GET; address: /graphdbmanager/data-historian/systems/{systemName}/services/{serviceName}/data. Query parameters: [{"name": "from", "type": "Double", "required": false, "default": null}, {"name": "to", "type": "Double", "required": false, "default": null}, {"name": "count", "type": "Integer", "required": false, "default": null}, {"name": "signals", "type": "List<String>", "required": false, "default": null}, {"name": "signalCount", "type": "Integer", "required": false, "default": null}]. Path parameters: ["systemName", "serviceName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/graphdbmanager/data-historian/systems/{systemName}/services/{serviceName}/data"; requestType = "unspecified"; responseType = "List<SenMLRecordDTO>"; queryParameters = "[{\"name\": \"from\", \"type\": \"Double\", \"required\": false, \"default\": null}, {\"name\": \"to\", \"type\": \"Double\", \"required\": false, \"default\": null}, {\"name\": \"count\", \"type\": \"Integer\", \"required\": false, \"default\": null}, {\"name\": \"signals\", \"type\": \"List<String>\", \"required\": false, \"default\": null}, {\"name\": \"signalCount\", \"type\": \"Integer\", \"required\": false, \"default\": null}]"; pathParameters = "[\"systemName\", \"serviceName\"]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGraphDBManagerData::'SenMLRecordDTO'[0..*];
    }
    action def 'GraphDBManager_graphDataHistorian_http_put-data_3' {
        doc /* Operation put-data. Wire method: PUT; address: /graphdbmanager/data-historian/systems/{systemName}/services/{serviceName}/data. Query parameters: []. Path parameters: ["systemName", "serviceName"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/graphdbmanager/data-historian/systems/{systemName}/services/{serviceName}/data"; requestType = "List<SenMLRecordDTO>"; responseType = "ResponseEntity<Void>"; queryParameters = "[]"; pathParameters = "[\"systemName\", \"serviceName\"]"; statusCodes = "[]"; }
        in item 'request' : ArrowheadGraphDBManagerData::'SenMLRecordDTO'[0..*];
    }
    port def GraphDBManager_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-GraphDBManager-java-spring/documentation/v5.3.0/GraphDBManager-v5.3.0-SysD.tex */
    }
    port def GraphDBManager_sysMonitor_AMQP_IDD :> GraphDBManager_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-GraphDBManager-java-spring/documentation/v5.3.0/GraphDBManager-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.GraphDBManager.GraphDBManager";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, GraphDBManager registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.GraphDBManager.GraphDBManager",
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
        out item 'echoResponse' : ArrowheadGraphDBManagerData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.DataManager.DataManager.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadGraphDBManagerData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.DataManager.DataManager.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadGraphDBManagerData::'Observation'[0..1];
    }
    port def GraphDBManager_sysMonitor_AMQP_IDD_Implementation :> GraphDBManager_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'GraphDBManager_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DataManager.DataManager.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DataManager.DataManager.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGraphDBManagerData::'Observation'[0..1];
    }
    action def 'GraphDBManager_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DataManager.DataManager.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DataManager.DataManager.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGraphDBManagerData::'Observation'[0..1];
    }
    action def 'GraphDBManager_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.DataManager.DataManager.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.DataManager.DataManager.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGraphDBManagerData::'Observation'[0..1];
    }
    part def GraphDBManager_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "GraphDBManager"; FunctionalProperties = "This document describes the GraphDBManager support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-GraphDBManager-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-GraphDBManager-java-spring/documentation/v5.3.0/GraphDBManager-v5.3.0-SysD.tex"; }
        doc /* This document describes the GraphDBManager support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-GraphDBManager-java-spring of the primary Java source tree (Eclipse-Arrowhead-java) and deployed with the standalone Compose definition of that folder.
  \end{abstract} */
        port 'graphDataProxy_SD' : GraphDBManager_graphDataProxy_SD { @FullPort; }
        port 'graphDataHistorian_SD' : GraphDBManager_graphDataHistorian_SD { @FullPort; }
        port 'sysMonitor_SD' : GraphDBManager_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, ConsumerAuthorization, ServiceRegistry, GraphDB repository (RDF4J HTTP). These are external requirements, not assumed co-deployments. */
    }
    part def GraphDBManager_SysDD :> GraphDBManager_SysD {
        @SysDD;
        port 'graphDataProxy_http' : GraphDBManager_graphDataProxy_HTTP_IDD { @FullPort; }
        port 'graphDataHistorian_http' : GraphDBManager_graphDataHistorian_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : GraphDBManager_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def GraphDBManager :> GraphDBManager_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8467;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
}
