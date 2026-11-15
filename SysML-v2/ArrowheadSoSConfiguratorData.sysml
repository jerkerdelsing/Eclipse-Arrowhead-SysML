library package ArrowheadSoSConfiguratorData {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    item def 'Catalog' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'organization' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'colony' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        ref item 'relay' : 'Relay'[0..1] { doc /* Source type: Relay. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'forbiddenConsumers' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        ref item 'clouds' : 'Cloud'[0..*] { doc /* Source type: List<Cloud>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
    }
    item def 'Check' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'service' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'expected' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Cloud' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'organization' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'implementation' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'dir' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'composeProject' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'executorType' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        ref item 'intercloud' : 'Intercloud'[0..1] { doc /* Source type: Intercloud. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        ref item 'ports' : 'Ports'[0..1] { doc /* Source type: Ports. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'consumers' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        ref item 'exports' : 'Export'[0..*] { doc /* Source type: List<Export>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
    }
    item def 'CloudConfig' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        ref item 'neighbours' : 'Neighbour'[0..*] { doc /* Source type: List<Neighbour>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        ref item 'removeNeighbours' : 'Neighbour'[0..*] { doc /* Source type: List<Neighbour>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        ref item 'grants' : 'Grant'[0..*] { doc /* Source type: List<Grant>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'revokes' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        ref item 'preconditions' : 'Check'[0..*] { doc /* Source type: List<Check>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        ref item 'verify' : 'Check'[0..*] { doc /* Source type: List<Check>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        ref item 'discovery' : 'Discovery'[0..*] { doc /* Source type: List<Discovery>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'exportServices' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Config' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'host' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'port' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'tls' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'colonyName' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'prvKey' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
    }
    item def 'Decision' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'allowed' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/security/SosAuthorizationService.java */ }
        attribute 'expiresAt' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/security/SosAuthorizationService.java */ }
    }
    item def 'Deployment' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'state' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        ref item 'steps' : 'StepState'[0..*] { doc /* Source type: List<StepState>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
    }
    item def 'Discovery' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'service' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'targetCloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Evaluation' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'sos' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'members' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        ref item 'violations' : 'Violation'[0..*] { doc /* Source type: List<Violation>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        ref item 'clouds' : JSONValue[0..1] { doc /* Source type: Map<String, CloudConfig>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        ref item 'relay' : 'RelayConfig'[0..1] { doc /* Source type: RelayConfig. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Exchange' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'consumerCloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/SosRequest.java */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/SosRequest.java */ }
        attribute 'providerCloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/SosRequest.java */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/SosRequest.java */ }
        attribute 'service' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/SosRequest.java */ }
        attribute 'operations' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/SosRequest.java */ }
    }
    item def 'Export' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'service' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'operations' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'services' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
    }
    item def 'Grant' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'service' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'consumers' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Intercloud' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'supported' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'gatekeeperService' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'gatetunnelService' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'reason' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
    }
    item def 'Login' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'result' : JSONValue[0..1] { doc /* Source type: LoginResult. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/console/ConsoleAuth.java */ }
        attribute 'session' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/console/ConsoleAuth.java */ }
    }
    item def 'Neighbour' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'operator' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Observation' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
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
    item def 'Parsed' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'request' : 'SosRequest'[0..1] { doc /* Source type: SosRequest. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/api/http/SosConfigurationAPI.java */ }
        ref item 'error' : JSONValue[0..1] { doc /* Source type: ResponseEntity<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/api/http/SosConfigurationAPI.java */ }
    }
    item def 'Plan' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'sos' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/planner/Planner.java */ }
        attribute 'members' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/planner/Planner.java */ }
        attribute 'allowed' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/planner/Planner.java */ }
        ref item 'violations' : JSONValue[0..*] { doc /* Source type: List<PolicyEngine.Violation>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/planner/Planner.java */ }
        ref item 'steps' : 'Step'[0..*] { doc /* Source type: List<Step>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/planner/Planner.java */ }
        attribute 'notes' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/planner/Planner.java */ }
        ref item 'evaluation' : 'Evaluation'[0..1] { doc /* Source type: Evaluation. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/planner/Planner.java */ }
    }
    item def 'Ports' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'authentication' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'authorization' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'gatekeeper' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
    }
    item def 'Process' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'state' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'nodeName' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        ref item 'kwargs' : JSONValue[0..1] { doc /* Source type: Map<String, Object>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'funcName' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        ref item 'output' : JSONValue[0..*] { doc /* Source type: List<Object>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'errors' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
    }
    item def 'Relay' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'dir' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'composeProject' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'service' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'executorType' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'aclFile' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
        attribute 'clouds' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/catalog/Catalog.java */ }
    }
    item def 'RelayConfig' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'clouds' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'subjects' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Result' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'exit' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/runner/StepRunner.java */ }
        attribute 'output' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/runner/StepRunner.java */ }
    }
    item def 'SosRequest' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/SosRequest.java */ }
        attribute 'clouds' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/SosRequest.java */ }
        ref item 'exchanges' : 'Exchange'[0..*] { doc /* Source type: List<Exchange>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/SosRequest.java */ }
        attribute 'verifyDiscovery' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/SosRequest.java */ }
    }
    item def 'Step' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'kind' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/planner/Planner.java */ }
        attribute 'role' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/planner/Planner.java */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/planner/Planner.java */ }
    }
    item def 'StepState' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'node' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'processId' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'kind' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'state' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'errors' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
        attribute 'output' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/colony/ColonyClient.java */ }
    }
    item def 'Violation' :> JSONMessage {
        doc /* Source: ah5-SoSConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'rule' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
        attribute 'message' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoSConfigurator-java/src/main/java/eu/arrowhead/sosconfigurator/policy/PolicyEngine.java */ }
    }
}
