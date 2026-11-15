library package ArrowheadGatekeeper {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def Gatekeeper_gatekeeperManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "gatekeeperManagement"; }
        doc /* Service version 1.0.0. Source: ah5-Gatekeeper-java-spring/documentation/v5.3.0/Gatekeeper-v5.3.0-SysD.tex */
    }
    port def Gatekeeper_gatekeeperManagement_HTTP_IDD :> Gatekeeper_gatekeeperManagement_SD {
        @IDD { MicroserviceName = "gatekeeperManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-Gatekeeper-java-spring/documentation/v5.3.0/Gatekeeper-v5.3.0-gatekeeperManagement-HTTP-IDD.tex"; }
        attribute basePath : String = "/gatekeeper";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address gatekeeper, port 8449 and base path /gatekeeper. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
clouds & GET & /mgmt/clouds \\ \hline
relays & GET & /mgmt/relays \\ \hline
status & GET & /mgmt/status \\ \hline
\end{longtable}

\newpage */
        doc /* clouds: GET /gatekeeper/mgmt/clouds. Input: None; output: Map<String, Object>.  */
        out item 'cloudsResponse' : JSONMessage[0..1];
        doc /* relays: GET /gatekeeper/mgmt/relays. Input: None; output: Map<String, Object>.  */
        out item 'relaysResponse' : JSONMessage[0..1];
        doc /* status: GET /gatekeeper/mgmt/status. Input: None; output: Map<String, Object>.  */
        out item 'statusResponse' : JSONMessage[0..1];
    }
    port def Gatekeeper_gatekeeperManagement_HTTP_IDD_Implementation :> Gatekeeper_gatekeeperManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'Gatekeeper_gatekeeperManagement_http_clouds_0' {
        doc /* Operation clouds. Wire method: GET; address: /gatekeeper/mgmt/clouds. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/gatekeeper/mgmt/clouds"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'Gatekeeper_gatekeeperManagement_http_relays_1' {
        doc /* Operation relays. Wire method: GET; address: /gatekeeper/mgmt/relays. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/gatekeeper/mgmt/relays"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'Gatekeeper_gatekeeperManagement_http_status_2' {
        doc /* Operation status. Wire method: GET; address: /gatekeeper/mgmt/status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/gatekeeper/mgmt/status"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    port def Gatekeeper_globalServiceDiscovery_SD :> ArrowheadService {
        @SD { MicroserviceName = "globalServiceDiscovery"; }
        doc /* Service version 1.0.0. Source: ah5-Gatekeeper-java-spring/documentation/v5.3.0/Gatekeeper-v5.3.0-SysD.tex */
    }
    port def Gatekeeper_globalServiceDiscovery_HTTP_IDD :> Gatekeeper_globalServiceDiscovery_SD {
        @IDD { MicroserviceName = "globalServiceDiscovery"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-Gatekeeper-java-spring/documentation/v5.3.0/Gatekeeper-v5.3.0-globalServiceDiscovery-HTTP-IDD.tex"; }
        attribute basePath : String = "/gatekeeper";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address gatekeeper, port 8449 and base path /gatekeeper. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
query & POST & /init_gsd \\ \hline
multi-query & POST & /init_multi_gsd \\ \hline
\end{longtable}

\newpage */
        doc /* query: POST /gatekeeper/init_gsd. Input: None; output: Map<String, Object>.  */
        out item 'queryResponse' : JSONMessage[0..1];
        doc /* multi-query: POST /gatekeeper/init_multi_gsd. Input: None; output: Map<String, Object>.  */
        out item 'multi-queryResponse' : JSONMessage[0..1];
    }
    port def Gatekeeper_globalServiceDiscovery_HTTP_IDD_Implementation :> Gatekeeper_globalServiceDiscovery_HTTP_IDD { @IDD_Implementation; }
    action def 'Gatekeeper_globalServiceDiscovery_http_query_0' {
        doc /* Operation query. Wire method: POST; address: /gatekeeper/init_gsd. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/gatekeeper/init_gsd"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'Gatekeeper_globalServiceDiscovery_http_multi-query_1' {
        doc /* Operation multi-query. Wire method: POST; address: /gatekeeper/init_multi_gsd. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/gatekeeper/init_multi_gsd"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    port def Gatekeeper_interCloudNegotiation_SD :> ArrowheadService {
        @SD { MicroserviceName = "interCloudNegotiation"; }
        doc /* Service version 1.0.0. Source: ah5-Gatekeeper-java-spring/documentation/v5.3.0/Gatekeeper-v5.3.0-SysD.tex */
    }
    port def Gatekeeper_interCloudNegotiation_HTTP_IDD :> Gatekeeper_interCloudNegotiation_SD {
        @IDD { MicroserviceName = "interCloudNegotiation"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-Gatekeeper-java-spring/documentation/v5.3.0/Gatekeeper-v5.3.0-interCloudNegotiation-HTTP-IDD.tex"; }
        attribute basePath : String = "/gatekeeper";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address gatekeeper, port 8449 and base path /gatekeeper. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
negotiate & POST & /init_icn \\ \hline
\end{longtable}

\newpage */
        doc /* negotiate: POST /gatekeeper/init_icn. Input: None; output: Map<String, Object>.  */
        out item 'negotiateResponse' : JSONMessage[0..1];
    }
    port def Gatekeeper_interCloudNegotiation_HTTP_IDD_Implementation :> Gatekeeper_interCloudNegotiation_HTTP_IDD { @IDD_Implementation; }
    action def 'Gatekeeper_interCloudNegotiation_http_negotiate_0' {
        doc /* Operation negotiate. Wire method: POST; address: /gatekeeper/init_icn. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/gatekeeper/init_icn"; requestType = "unspecified"; responseType = "Map<String, Object>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    port def Gatekeeper_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-Gatekeeper-java-spring/documentation/v5.3.0/Gatekeeper-v5.3.0-SysD.tex */
    }
    port def Gatekeeper_sysMonitor_AMQP_IDD :> Gatekeeper_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-Gatekeeper-java-spring/documentation/v5.3.0/Gatekeeper-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.Gatekeeper.Gatekeeper";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, Gatekeeper registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.Gatekeeper.Gatekeeper",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.Gatekeeper.Gatekeeper.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadGatekeeperData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.Gatekeeper.Gatekeeper.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadGatekeeperData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.Gatekeeper.Gatekeeper.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadGatekeeperData::'Observation'[0..1];
    }
    port def Gatekeeper_sysMonitor_AMQP_IDD_Implementation :> Gatekeeper_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'Gatekeeper_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Gatekeeper.Gatekeeper.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Gatekeeper.Gatekeeper.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGatekeeperData::'Observation'[0..1];
    }
    action def 'Gatekeeper_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Gatekeeper.Gatekeeper.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Gatekeeper.Gatekeeper.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGatekeeperData::'Observation'[0..1];
    }
    action def 'Gatekeeper_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.Gatekeeper.Gatekeeper.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.Gatekeeper.Gatekeeper.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadGatekeeperData::'Observation'[0..1];
    }
    part def Gatekeeper_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "Gatekeeper"; FunctionalProperties = "This document describes the Gatekeeper support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-Gatekeeper-java-spring with an independent local-cloud deployment definition in its own folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-Gatekeeper-java-spring/documentation/v5.3.0/Gatekeeper-v5.3.0-SysD.tex"; }
        doc /* This document describes the Gatekeeper support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-Gatekeeper-java-spring with an independent local-cloud deployment definition in its own folder.
  \end{abstract} */
        port 'gatekeeperManagement_SD' : Gatekeeper_gatekeeperManagement_SD { @FullPort; }
        port 'globalServiceDiscovery_SD' : Gatekeeper_globalServiceDiscovery_SD { @FullPort; }
        port 'interCloudNegotiation_SD' : Gatekeeper_interCloudNegotiation_SD { @FullPort; }
        port 'sysMonitor_SD' : Gatekeeper_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, ConsumerAuthorization, GateTunnel, Relay (MQTT), ServiceRegistry. These are external requirements, not assumed co-deployments. */
    }
    part def Gatekeeper_SysDD :> Gatekeeper_SysD {
        @SysDD;
        port 'gatekeeperManagement_http' : Gatekeeper_gatekeeperManagement_HTTP_IDD { @FullPort; }
        port 'globalServiceDiscovery_http' : Gatekeeper_globalServiceDiscovery_HTTP_IDD { @FullPort; }
        port 'interCloudNegotiation_http' : Gatekeeper_interCloudNegotiation_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : Gatekeeper_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def Gatekeeper :> Gatekeeper_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8449;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'Gatekeeper_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /gatekeeper/echo; source ah5-Gatekeeper-java-spring/src/main/java/eu/arrowhead/gatekeeper/api/http/GatekeeperAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gatekeeper/echo"; } }
    action def 'Gatekeeper_Unregistered_1' { doc /* Unregistered HTTP endpoint; GET /gatekeeper/monitor/echo; source ah5-Gatekeeper-java-spring/src/main/java/eu/arrowhead/gatekeeper/api/http/GatekeeperAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gatekeeper/monitor/echo"; } }
    action def 'Gatekeeper_Unregistered_2' { doc /* Unregistered HTTP endpoint; GET /gatekeeper/mgmt/general/status; source ah5-Gatekeeper-java-spring/src/main/java/eu/arrowhead/gatekeeper/api/http/GeneralManagementAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gatekeeper/mgmt/general/status"; } }
    action def 'Gatekeeper_Unregistered_3' { doc /* Unregistered HTTP endpoint; POST /gatekeeper/mgmt/general/logs; source ah5-Gatekeeper-java-spring/src/main/java/eu/arrowhead/gatekeeper/api/http/GeneralManagementAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/gatekeeper/mgmt/general/logs"; } }
    action def 'Gatekeeper_Unregistered_4' { doc /* Unregistered HTTP endpoint; GET /gatekeeper/mgmt/general/get-config; source ah5-Gatekeeper-java-spring/src/main/java/eu/arrowhead/gatekeeper/api/http/GeneralManagementAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/gatekeeper/mgmt/general/get-config"; } }
    action def 'Gatekeeper_Unregistered_5' { doc /* Unregistered HTTP endpoint; POST /gatekeeper/mgmt/clouds; source ah5-Gatekeeper-java-spring/src/main/java/eu/arrowhead/gatekeeper/api/http/ManagementAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/gatekeeper/mgmt/clouds"; } }
    action def 'Gatekeeper_Unregistered_6' { doc /* Unregistered HTTP endpoint; DELETE /gatekeeper/mgmt/clouds/**; source ah5-Gatekeeper-java-spring/src/main/java/eu/arrowhead/gatekeeper/api/http/ManagementAPI.java */ @WireOperation { protocol = "http"; method = "DELETE"; address = "/gatekeeper/mgmt/clouds/**"; } }
    action def 'Gatekeeper_Unregistered_7' { doc /* Unregistered HTTP endpoint; POST /gatekeeper/mgmt/relays; source ah5-Gatekeeper-java-spring/src/main/java/eu/arrowhead/gatekeeper/api/http/ManagementAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/gatekeeper/mgmt/relays"; } }
}
