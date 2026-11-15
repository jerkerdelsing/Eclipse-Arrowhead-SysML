library package ArrowheadLocalCloudManagerData {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    item def 'Client' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'http' : JSONValue[0..1] { doc /* Source type: HttpClient. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/client/OrchestratedProviderGateway.java */ }
        ref item 'crlStamp' : JSONValue[0..1] { doc /* Source type: Object. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/client/OrchestratedProviderGateway.java */ }
    }
    item def 'Credential' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'salt' : JSONValue[0..*] { doc /* Source type: byte[]. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/console/ConsoleAuth.java */ }
        ref item 'hash' : JSONValue[0..*] { doc /* Source type: byte[]. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/console/ConsoleAuth.java */ }
    }
    item def 'Decision' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'allowed' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/security/ManagerAuthorizationService.java */ }
        attribute 'expiresAt' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/security/ManagerAuthorizationService.java */ }
    }
    item def 'Download' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'status' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/client/ProviderGateway.java */ }
        attribute 'contentType' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/client/ProviderGateway.java */ }
        attribute 'disposition' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/client/ProviderGateway.java */ }
        attribute 'sha256' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/client/ProviderGateway.java */ }
        ref item 'body' : JSONValue[0..*] { doc /* Source type: byte[]. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/client/ProviderGateway.java */ }
    }
    item def 'Features' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'localCloudConfiguration' : Boolean[0..1] { doc /* Source type: Boolean. Local-cloud configuration view enabled. */ }
        attribute 'chipletFloorplans' : Boolean[0..1] { doc /* Source type: Boolean. Chiplet floorplan view enabled. */ }
        attribute 'managerName' : String[0..1] { doc /* Source type: String. LocalCloudManager, or ChipletLocalCloudManager with floorplans. */ }
    }
    item def 'Health' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'LifecycleResult' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'service' : String[0..1] { doc /* Source type: String. Compose service. */ }
        attribute 'action' : String[0..1] { doc /* Source type: String. start, stop or restart. */ }
        attribute 'accepted' : Boolean[0..1] { doc /* Source type: Boolean. Forwarded to the Docker proxy. */ }
        attribute 'at' : String[0..1] { doc /* Source type: String. Time of the action. */ }
    }
    item def 'LogLines' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'service' : String[0..1] { doc /* Source type: String. Compose service. */ }
        attribute 'lines' : String[0..*] { doc /* Source type: Array<String>. Log lines (tail latest). */ }
        ref item 'collectedAt' : JSONValue[0..1] { doc /* Source type: DateTime. Collection time. */ }
    }
    item def 'Login' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'password' : String[0..1] { doc /* Source type: String. Console password (JSON only; 204 on success, 401 wrong, 429 locked). */ }
    }
    item def 'ManagementPolicy' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceId' : String[0..1] { doc /* Source type: String. Policy instance (assigned by ConsumerAuthorization). */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Registered local provider. */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String. SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Service definition or event type. */ }
        attribute 'description' : String[0..1] { doc /* Source type: String. At most 1000 characters. */ }
        ref item 'defaultPolicy' : JSONValue[0..1] { doc /* Source type: Object. policyType (ALL, WHITELIST, BLACKLIST) and policyList of local system names. */ }
        ref item 'scopedPolicies' : JSONValue[0..1] { doc /* Source type: Object. Per operation, a policy like defaultPolicy (at most 100). */ }
    }
    item def 'Observation' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'schemaVersion' : String[0..1] { doc /* Source type: String. 1.0. */ }
        attribute 'observationId' : String[0..1] { doc /* Source type: String. <System>-<type>-<epoch ms>-<sequence>. */ }
        attribute 'providerSystem' : String[0..1] { doc /* Source type: String. The publishing system. */ }
        attribute 'serviceInstance' : String[0..1] { doc /* Source type: String. Service instance, default the system name. */ }
        attribute 'observationType' : String[0..1] { doc /* Source type: String. echo, power, status. */ }
        attribute 'sourceTime' : String[0..1] { doc /* Source type: String. ISO 8601 UTC time with milliseconds. */ }
        attribute 'sequence' : Real[0..1] { doc /* Source type: Number. Sequence number per publisher. */ }
        ref item 'value' : JSONValue[0..1] { doc /* Source type: Object. Observed value, see the operations. */ }
        attribute 'unit' : String[0..1] { doc /* Source type: String. 1 for power and status; absent for echo. */ }
        attribute 'quality' : String[0..1] { doc /* Source type: String. good or uncertain. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. \texttt{{"publisherMode": "native"}}. */ }
    }
    item def 'OrchestrationRule' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Consumer system. */ }
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String. Service instance. */ }
        attribute 'priority' : Real[0..1] { doc /* Source type: Number. Priority (1 highest). */ }
    }
    item def 'PlantDescription' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item '*' : JSONValue[0..1] { doc /* Source type: Object. Plant description as in PlantDescriptionEngine plantDescriptionManagement. */ }
    }
    item def 'PolicyChange' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'policy' : 'ManagementPolicy'[0..1] { doc /* Source type: ManagementPolicy. Policy to grant (POST). */ }
        ref item 'expected' : 'ManagementPolicy'[0..1] { doc /* Source type: ManagementPolicy. Stored policy as last read; required to replace or revoke. */ }
    }
    item def 'PolicyView' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : JSONValue[0..1] { doc /* Source type: Array. Editable local management policies. */ }
        ref item 'readOnlyEntries' : JSONValue[0..1] { doc /* Source type: Array. Provider-owned local policies. */ }
        ref item 'collectedAt' : JSONValue[0..1] { doc /* Source type: DateTime. Collection time. */ }
    }
    item def 'Removal' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'removed' : JSONValue[0..1] { doc /* Source type: Object. Identifier of, or true for, the removed entry. */ }
        attribute 'id' : String[0..1] { doc /* Source type: String. Removed policy (policies only). */ }
    }
    item def 'Response' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'status' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/client/ProviderGateway.java */ }
        ref item 'body' : JSONValue[0..1] { doc /* Source type: JsonNode. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/client/ProviderGateway.java */ }
    }
    item def 'Result' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'status' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/service/PolicyEditor.java */ }
        ref item 'body' : JSONValue[0..1] { doc /* Source type: JsonNode. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/service/PolicyEditor.java */ }
    }
    item def 'RulePriorityChange' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'priority' : Real[0..1] { doc /* Source type: Number. New priority, 1 to 2147483647. */ }
        ref item 'expected' : 'OrchestrationRule'[0..1] { doc /* Source type: OrchestrationRule. Rule as last read (409 if changed, 428 if missing). */ }
    }
    item def 'Session' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'authenticated' : Boolean[0..1] { doc /* Source type: Boolean. Whether the request carries a valid console session. */ }
        attribute 'configured' : Boolean[0..1] { doc /* Source type: Boolean. Whether a console password is configured. */ }
    }
    item def 'Settled' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'ok' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/service/ManagerService.java */ }
        ref item 'value' : JSONValue[0..1] { doc /* Source type: JsonNode. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/service/ManagerService.java */ }
        attribute 'error' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/service/ManagerService.java */ }
    }
    item def 'SoSChange' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'configuration' : JSONValue[0..1] { doc /* Source type: Object. SoS model: plantDescription (name), active, include, systems with ports, connections. */ }
        ref item 'expected' : JSONValue[0..1] { doc /* Source type: Object. Stored composition as last read (replace and remove). */ }
        attribute 'activationConfirmed' : Boolean[0..1] { doc /* Source type: Boolean. Must be true to save an active composition (428 otherwise). */ }
    }
    item def 'Subnet' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'address' : JSONValue[0..*] { doc /* Source type: byte[]. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/console/ConsoleClients.java */ }
        attribute 'prefix' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-LocalCloudManager-java-spring/src/main/java/eu/arrowhead/localcloudmanager/console/ConsoleClients.java */ }
    }
    item def 'SysMonitorSubscriptionRequest' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'observationTypes' : String[0..*] { doc /* Source type: Array<String>. Types to receive, * for all. */ }
        attribute 'enabled' : Boolean[0..1] { doc /* Source type: Boolean. Default true. */ }
    }
    item def 'View' :> JSONMessage {
        doc /* Source: ah5-LocalCloudManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item '*' : JSONValue[0..1] { doc /* Source type: Object. View document assembled from the providing systems; a failing source is reported in the document instead of failing the request. */ }
    }
}
