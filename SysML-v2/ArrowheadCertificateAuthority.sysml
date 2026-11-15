library package ArrowheadCertificateAuthority {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    private import ArrowheadProfile::*;
    port def CertificateAuthority_certificateAuthorityManagement_SD :> ArrowheadService {
        @SD { MicroserviceName = "certificateAuthorityManagement"; }
        doc /* Service version 1.0.0. Source: ah5-CertificateAuthority-java-spring/documentation/v5.3.0/CertificateAuthority-v5.3.0-SysD.tex */
    }
    port def CertificateAuthority_certificateAuthorityManagement_HTTP_IDD :> CertificateAuthority_certificateAuthorityManagement_SD {
        @IDD { MicroserviceName = "certificateAuthorityManagement"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-CertificateAuthority-java-spring/documentation/v5.3.0/CertificateAuthority-v5.3.0-certificateAuthorityManagement-HTTP-IDD.tex"; }
        attribute basePath : String = "/certificate-authority";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address certificate-authority, port 8448 and base path /certificate-authority. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
list-certificates & GET & /mgmt/certificates \\ \hline
revoke-certificate & DELETE & \texttt{/mgmt/certificates/{id}} \\ \hline
revoke-certificate-by-content & POST & /mgmt/revocations \\ \hline
list-keys & GET & /mgmt/keys \\ \hline
add-key & PUT & /mgmt/keys \\ \hline
delete-key & DELETE & \texttt{/mgmt/keys/{id}} \\ \hline
\end{longtable}

\newpage */
        doc /* list-certificates: GET /certificate-authority/mgmt/certificates. Input: None; output: ResponseEntity<List<Map<String, Object>>>.  */
        out item 'list-certificatesResponse' : JSONMessage[0..*];
        doc /* revoke-certificate: DELETE /certificate-authority/mgmt/certificates/{id}. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'revoke-certificateResponse' : JSONMessage[0..1];
        doc /* revoke-certificate-by-content: POST /certificate-authority/mgmt/revocations. Input: Map<String,; output: ResponseEntity<Map<String, Object>>.  */
        in item 'revoke-certificate-by-contentRequest' : JSONMessage[0..1];
        out item 'revoke-certificate-by-contentResponse' : JSONMessage[0..1];
        doc /* list-keys: GET /certificate-authority/mgmt/keys. Input: None; output: ResponseEntity<List<Map<String, Object>>>.  */
        out item 'list-keysResponse' : JSONMessage[0..*];
        doc /* add-key: PUT /certificate-authority/mgmt/keys. Input: Map<String,; output: ResponseEntity<Map<String, Object>>.  */
        in item 'add-keyRequest' : JSONMessage[0..1];
        out item 'add-keyResponse' : JSONMessage[0..1];
        doc /* delete-key: DELETE /certificate-authority/mgmt/keys/{id}. Input: None; output: ResponseEntity<Map<String, Object>>.  */
        out item 'delete-keyResponse' : JSONMessage[0..1];
    }
    port def CertificateAuthority_certificateAuthorityManagement_HTTP_IDD_Implementation :> CertificateAuthority_certificateAuthorityManagement_HTTP_IDD { @IDD_Implementation; }
    action def 'CertificateAuthority_certificateAuthorityManagement_http_list-certificates_0' {
        doc /* Operation list-certificates. Wire method: GET; address: /certificate-authority/mgmt/certificates. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/certificate-authority/mgmt/certificates"; requestType = "unspecified"; responseType = "ResponseEntity<List<Map<String, Object>>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..*];
    }
    action def 'CertificateAuthority_certificateAuthorityManagement_http_revoke-certificate_1' {
        doc /* Operation revoke-certificate. Wire method: DELETE; address: /certificate-authority/mgmt/certificates/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/certificate-authority/mgmt/certificates/{id}"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    action def 'CertificateAuthority_certificateAuthorityManagement_http_revoke-certificate-by-content_2' {
        doc /* Operation revoke-certificate-by-content. Wire method: POST; address: /certificate-authority/mgmt/revocations. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/certificate-authority/mgmt/revocations"; requestType = "Map<String,"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'CertificateAuthority_certificateAuthorityManagement_http_list-keys_3' {
        doc /* Operation list-keys. Wire method: GET; address: /certificate-authority/mgmt/keys. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/certificate-authority/mgmt/keys"; requestType = "unspecified"; responseType = "ResponseEntity<List<Map<String, Object>>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..*];
    }
    action def 'CertificateAuthority_certificateAuthorityManagement_http_add-key_4' {
        doc /* Operation add-key. Wire method: PUT; address: /certificate-authority/mgmt/keys. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "PUT"; address = "/certificate-authority/mgmt/keys"; requestType = "Map<String,"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'CertificateAuthority_certificateAuthorityManagement_http_delete-key_5' {
        doc /* Operation delete-key. Wire method: DELETE; address: /certificate-authority/mgmt/keys/{id}. Query parameters: []. Path parameters: ["id"]. Status codes: [] */
        @WireOperation { protocol = "http"; method = "DELETE"; address = "/certificate-authority/mgmt/keys/{id}"; requestType = "unspecified"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[\"id\"]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..1];
    }
    port def CertificateAuthority_certificateSigning_SD :> ArrowheadService {
        @SD { MicroserviceName = "certificateSigning"; }
        doc /* Service version 1.0.0. Source: ah5-CertificateAuthority-java-spring/documentation/v5.3.0/CertificateAuthority-v5.3.0-SysD.tex */
    }
    port def CertificateAuthority_certificateSigning_HTTP_IDD :> CertificateAuthority_certificateSigning_SD {
        @IDD { MicroserviceName = "certificateSigning"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-CertificateAuthority-java-spring/documentation/v5.3.0/CertificateAuthority-v5.3.0-certificateSigning-HTTP-IDD.tex"; }
        attribute basePath : String = "/certificate-authority";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address certificate-authority, port 8448 and base path /certificate-authority. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
sign & POST & /sign \\ \hline
\end{longtable}

\newpage */
        doc /* sign: POST /certificate-authority/sign. Input: Map<String,; output: ResponseEntity<Map<String, Object>>.  */
        in item 'signRequest' : JSONMessage[0..1];
        out item 'signResponse' : JSONMessage[0..1];
    }
    port def CertificateAuthority_certificateSigning_HTTP_IDD_Implementation :> CertificateAuthority_certificateSigning_HTTP_IDD { @IDD_Implementation; }
    action def 'CertificateAuthority_certificateSigning_http_sign_0' {
        doc /* Operation sign. Wire method: POST; address: /certificate-authority/sign. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/certificate-authority/sign"; requestType = "Map<String,"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    port def CertificateAuthority_certificateValidation_SD :> ArrowheadService {
        @SD { MicroserviceName = "certificateValidation"; }
        doc /* Service version 1.0.0. Source: ah5-CertificateAuthority-java-spring/documentation/v5.3.0/CertificateAuthority-v5.3.0-SysD.tex */
    }
    port def CertificateAuthority_certificateValidation_HTTP_IDD :> CertificateAuthority_certificateValidation_SD {
        @IDD { MicroserviceName = "certificateValidation"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'http'; }
        @SourceTrace { path = "ah5-CertificateAuthority-java-spring/documentation/v5.3.0/CertificateAuthority-v5.3.0-certificateValidation-HTTP-IDD.tex"; }
        attribute basePath : String = "/certificate-authority";
        attribute templateName : String = "generic_https";
        attribute policy : String = "CERT_AUTH";
        doc /* Registration (source documentation): The service is registered in the ServiceRegistry with the interface template generic_https, policy CERT_AUTH, access address certificate-authority, port 8448 and base path /certificate-authority. The operations property of the interface lists the operations below with their method and path relative to the base path (path parameters are placeholders such as \texttt{{id}} that the consumer fills in):

\noindent\begin{longtable}{| p{5.2cm} | p{1.6cm} | p{8.4cm} |} \hline
\rowcolor{gray!33} Operation & Method & Path \\ \hline \endhead
check-certificate & POST & /checkCertificate \\ \hline
check-trusted-key & POST & /checkTrustedKey \\ \hline
get-crl & GET & /crl \\ \hline
\end{longtable}

\newpage */
        doc /* check-certificate: POST /certificate-authority/checkCertificate. Input: Map<String,; output: ResponseEntity<Map<String, Object>>.  */
        in item 'check-certificateRequest' : JSONMessage[0..1];
        out item 'check-certificateResponse' : JSONMessage[0..1];
        doc /* check-trusted-key: POST /certificate-authority/checkTrustedKey. Input: Map<String,; output: ResponseEntity<Map<String, Object>>.  */
        in item 'check-trusted-keyRequest' : JSONMessage[0..1];
        out item 'check-trusted-keyResponse' : JSONMessage[0..1];
        doc /* get-crl: GET /certificate-authority/crl. Input: None; output: ResponseEntity<byte[]>.  */
        out item 'get-crlResponse' : JSONMessage[0..*];
    }
    port def CertificateAuthority_certificateValidation_HTTP_IDD_Implementation :> CertificateAuthority_certificateValidation_HTTP_IDD { @IDD_Implementation; }
    action def 'CertificateAuthority_certificateValidation_http_check-certificate_0' {
        doc /* Operation check-certificate. Wire method: POST; address: /certificate-authority/checkCertificate. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/certificate-authority/checkCertificate"; requestType = "Map<String,"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'CertificateAuthority_certificateValidation_http_check-trusted-key_1' {
        doc /* Operation check-trusted-key. Wire method: POST; address: /certificate-authority/checkTrustedKey. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "POST"; address = "/certificate-authority/checkTrustedKey"; requestType = "Map<String,"; responseType = "ResponseEntity<Map<String, Object>>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        in item 'request' : JSONMessage[0..1];
        out item 'response' : JSONMessage[0..1];
    }
    action def 'CertificateAuthority_certificateValidation_http_get-crl_2' {
        doc /* Operation get-crl. Wire method: GET; address: /certificate-authority/crl. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "http"; method = "GET"; address = "/certificate-authority/crl"; requestType = "unspecified"; responseType = "ResponseEntity<byte[]>"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : JSONMessage[0..*];
    }
    port def CertificateAuthority_sysMonitor_SD :> ArrowheadService {
        @SD { MicroserviceName = "sysMonitor"; }
        doc /* Service version 1.0.0. Source: ah5-CertificateAuthority-java-spring/documentation/v5.3.0/CertificateAuthority-v5.3.0-SysD.tex */
    }
    port def CertificateAuthority_sysMonitor_AMQP_IDD :> CertificateAuthority_sysMonitor_SD {
        @IDD { MicroserviceName = "sysMonitor"; Protocol = AFPVNDatatypes::ApplicationProtocolKind::'amqp'; }
        @SourceTrace { path = "ah5-CertificateAuthority-java-spring/documentation/v5.3.0/CertificateAuthority-v5.3.0-sysMonitor-AMQP-IDD.tex"; }
        attribute templateName : String = "generic_amqps";
        attribute protocol : String = "amqps";
        attribute policy : String = "CERT_AUTH";
        attribute 'accessPort' : Integer = 5671;
        attribute 'exchange' : String = "arrowhead";
        attribute 'baseRoutingKey' : String = "TestCloud.sysmonitor.CertificateAuthority.CertificateAuthority";
        doc /* Registration (source documentation): With sysmonitor.enabled=true, CertificateAuthority registers the service at start-up with interface template generic_amqps (protocol amqps, policy CERT_AUTH; generic_amqp without TLS) and the following properties and metadata:

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
        "baseRoutingKey": "TestCloud.sysmonitor.CertificateAuthority.CertificateAuthority",
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
        doc /* echo: PUBLISH <Cloud>.sysmonitor.CertificateAuthority.CertificateAuthority.echo. Input: None; output: Observation.  */
        out item 'echoResponse' : ArrowheadCertificateAuthorityData::'Observation'[0..1];
        doc /* power: PUBLISH <Cloud>.sysmonitor.CertificateAuthority.CertificateAuthority.power. Input: None; output: Observation.  */
        out item 'powerResponse' : ArrowheadCertificateAuthorityData::'Observation'[0..1];
        doc /* status: PUBLISH <Cloud>.sysmonitor.CertificateAuthority.CertificateAuthority.status. Input: None; output: Observation.  */
        out item 'statusResponse' : ArrowheadCertificateAuthorityData::'Observation'[0..1];
    }
    port def CertificateAuthority_sysMonitor_AMQP_IDD_Implementation :> CertificateAuthority_sysMonitor_AMQP_IDD { @IDD_Implementation; }
    action def 'CertificateAuthority_sysMonitor_amqp_echo_0' {
        doc /* Operation echo. Wire method: PUBLISH; address: <Cloud>.sysmonitor.CertificateAuthority.CertificateAuthority.echo. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.CertificateAuthority.CertificateAuthority.echo"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCertificateAuthorityData::'Observation'[0..1];
    }
    action def 'CertificateAuthority_sysMonitor_amqp_power_1' {
        doc /* Operation power. Wire method: PUBLISH; address: <Cloud>.sysmonitor.CertificateAuthority.CertificateAuthority.power. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.CertificateAuthority.CertificateAuthority.power"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCertificateAuthorityData::'Observation'[0..1];
    }
    action def 'CertificateAuthority_sysMonitor_amqp_status_2' {
        doc /* Operation status. Wire method: PUBLISH; address: <Cloud>.sysmonitor.CertificateAuthority.CertificateAuthority.status. Query parameters: []. Path parameters: []. Status codes: [] */
        @WireOperation { protocol = "amqp"; method = "PUBLISH"; address = "<Cloud>.sysmonitor.CertificateAuthority.CertificateAuthority.status"; requestType = "unspecified"; responseType = "Observation"; queryParameters = "[]"; pathParameters = "[]"; statusCodes = "[]"; }
        out item 'response' : ArrowheadCertificateAuthorityData::'Observation'[0..1];
    }
    part def CertificateAuthority_SysD :> ArrowheadSystem {
        @SysD { MicrosystemName = "CertificateAuthority"; FunctionalProperties = "This document describes the CertificateAuthority support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-CertificateAuthority-java-spring with an independent local-cloud deployment definition in its own folder.\n  \\end{abstract}"; }
        @SourceTrace { path = "ah5-CertificateAuthority-java-spring/documentation/v5.3.0/CertificateAuthority-v5.3.0-SysD.tex"; }
        doc /* This document describes the CertificateAuthority support system of the Eclipse Arrowhead framework (documentation edition 5.3.0), as implemented in ah5-CertificateAuthority-java-spring with an independent local-cloud deployment definition in its own folder.
  \end{abstract} */
        port 'certificateAuthorityManagement_SD' : CertificateAuthority_certificateAuthorityManagement_SD { @FullPort; }
        port 'certificateSigning_SD' : CertificateAuthority_certificateSigning_SD { @FullPort; }
        port 'certificateValidation_SD' : CertificateAuthority_certificateValidation_SD { @FullPort; }
        port 'sysMonitor_SD' : CertificateAuthority_sysMonitor_SD[0..1] { @FullPort; }
        doc /* Consumed dependencies from SysD: AMQP broker (SysMonitor), Authentication, ServiceRegistry. These are external requirements, not assumed co-deployments. */
    }
    part def CertificateAuthority_SysDD :> CertificateAuthority_SysD {
        @SysDD;
        port 'certificateAuthorityManagement_http' : CertificateAuthority_certificateAuthorityManagement_HTTP_IDD { @FullPort; }
        port 'certificateSigning_http' : CertificateAuthority_certificateSigning_HTTP_IDD { @FullPort; }
        port 'certificateValidation_http' : CertificateAuthority_certificateValidation_HTTP_IDD { @FullPort; }
        port 'sysMonitor_amqp' : CertificateAuthority_sysMonitor_AMQP_IDD[0..1] { @FullPort; }
    }
    part def CertificateAuthority :> CertificateAuthority_SysDD {
        @System_Implementation;
        attribute defaultListeningPort : Integer[0..1] = 8448;
        doc /* Java reference implementation; release/5.3. Native sysMonitor requires sysmonitor.enabled=true. */
    }
    action def 'CertificateAuthority_Unregistered_0' { doc /* Unregistered HTTP endpoint; GET /certificate-authority/health; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/certificate-authority/health"; } }
    action def 'CertificateAuthority_Unregistered_1' { doc /* Unregistered HTTP endpoint; POST /sign; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/sign"; } }
    action def 'CertificateAuthority_Unregistered_2' { doc /* Unregistered HTTP endpoint; POST /checkCertificate; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/checkCertificate"; } }
    action def 'CertificateAuthority_Unregistered_3' { doc /* Unregistered HTTP endpoint; POST /checkTrustedKey; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/checkTrustedKey"; } }
    action def 'CertificateAuthority_Unregistered_4' { doc /* Unregistered HTTP endpoint; GET /crl; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/crl"; } }
    action def 'CertificateAuthority_Unregistered_5' { doc /* Unregistered HTTP endpoint; GET /mgmt/certificates; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/mgmt/certificates"; } }
    action def 'CertificateAuthority_Unregistered_6' { doc /* Unregistered HTTP endpoint; DELETE /mgmt/certificates/{id}; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "DELETE"; address = "/mgmt/certificates/{id}"; } }
    action def 'CertificateAuthority_Unregistered_7' { doc /* Unregistered HTTP endpoint; POST /mgmt/revocations; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/mgmt/revocations"; } }
    action def 'CertificateAuthority_Unregistered_8' { doc /* Unregistered HTTP endpoint; GET /mgmt/keys; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/mgmt/keys"; } }
    action def 'CertificateAuthority_Unregistered_9' { doc /* Unregistered HTTP endpoint; PUT /mgmt/keys; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "PUT"; address = "/mgmt/keys"; } }
    action def 'CertificateAuthority_Unregistered_10' { doc /* Unregistered HTTP endpoint; DELETE /mgmt/keys/{id}; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "DELETE"; address = "/mgmt/keys/{id}"; } }
    action def 'CertificateAuthority_Unregistered_11' { doc /* Unregistered HTTP endpoint; GET /health; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/CertificateAuthorityAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/health"; } }
    action def 'CertificateAuthority_Unregistered_12' { doc /* Unregistered HTTP endpoint; GET /certificate-authority/mgmt/general/status; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/GeneralManagementAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/certificate-authority/mgmt/general/status"; } }
    action def 'CertificateAuthority_Unregistered_13' { doc /* Unregistered HTTP endpoint; POST /certificate-authority/mgmt/general/logs; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/GeneralManagementAPI.java */ @WireOperation { protocol = "http"; method = "POST"; address = "/certificate-authority/mgmt/general/logs"; } }
    action def 'CertificateAuthority_Unregistered_14' { doc /* Unregistered HTTP endpoint; GET /certificate-authority/mgmt/general/get-config; source ah5-CertificateAuthority-java-spring/src/main/java/eu/arrowhead/certificateauthority/api/http/GeneralManagementAPI.java */ @WireOperation { protocol = "http"; method = "GET"; address = "/certificate-authority/mgmt/general/get-config"; } }
}
