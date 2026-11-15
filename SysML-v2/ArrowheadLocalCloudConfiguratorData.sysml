library package ArrowheadLocalCloudConfiguratorData {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    item def 'ApplyRequest' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systems' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ApplyRequest.java */ }
        attribute 'remove' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ApplyRequest.java */ }
        attribute 'reapply' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ApplyRequest.java */ }
        attribute 'smoke' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ApplyRequest.java */ }
        attribute 'expectedPlanHash' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ApplyRequest.java */ }
    }
    item def 'Catalog' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'composeProject' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'colony' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'executorType' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'defaults' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'smoke' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        ref item 'systems' : 'Component'[0..*] { doc /* Source type: List<Component>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
    }
    item def 'Component' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'kind' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'services' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'internalAssets' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'requires' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'provision' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'policies' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
        attribute 'protectedComponent' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Catalog.java */ }
    }
    item def 'Config' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'host' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'port' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'tls' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'colonyName' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'prvKey' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
    }
    item def 'Configuration' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'ConfigurationDraft' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationDraft.java */ }
        attribute 'systems' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationDraft.java */ }
        attribute 'remove' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationDraft.java */ }
        attribute 'reapply' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationDraft.java */ }
        attribute 'smoke' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationDraft.java */ }
        ref item 'layout' : JSONValue[0..1] { doc /* Source type: Map<String, LayoutPoint>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationDraft.java */ }
        attribute 'expectedRevision' : Integer[0..1] { doc /* Source type: Long. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationDraft.java */ }
    }
    item def 'ConfigurationList' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'ConfigurationRecord' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationRecord.java */ }
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationRecord.java */ }
        attribute 'systems' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationRecord.java */ }
        attribute 'remove' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationRecord.java */ }
        attribute 'reapply' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationRecord.java */ }
        attribute 'smoke' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationRecord.java */ }
        ref item 'layout' : JSONValue[0..1] { doc /* Source type: Map<String, LayoutPoint>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationRecord.java */ }
        attribute 'revision' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationRecord.java */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/ConfigurationRecord.java */ }
    }
    item def 'Decision' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'allowed' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/security/ConfiguratorAuthorizationService.java */ }
        attribute 'expiresAt' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/security/ConfiguratorAuthorizationService.java */ }
    }
    item def 'Deployment' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'state' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        ref item 'steps' : 'StepState'[0..*] { doc /* Source type: List<StepState>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
    }
    item def 'DeploymentAccepted' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'LayoutPoint' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'x' : Real[0..1] { doc /* Source type: double. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/LayoutPoint.java */ }
        attribute 'y' : Real[0..1] { doc /* Source type: double. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/dto/LayoutPoint.java */ }
    }
    item def 'Observation' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
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
    item def 'Plan' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Planner.java */ }
        attribute 'catalogHash' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Planner.java */ }
    }
    item def 'PlanRequest' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'PlanResponse' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'Point' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'Process' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'state' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'nodeName' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        ref item 'kwargs' : JSONValue[0..1] { doc /* Source type: Map<String, Object>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'funcName' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        ref item 'output' : JSONValue[0..*] { doc /* Source type: List<Object>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'errors' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
    }
    item def 'Removal' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'Request' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'reapply' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Planner.java */ }
        attribute 'smoke' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Planner.java */ }
    }
    item def 'Result' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'status' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/DeploymentCoordinator.java */ }
        ref item 'body' : JSONValue[0..1] { doc /* Source type: Map<String, Object>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/service/DeploymentCoordinator.java */ }
    }
    item def 'RevisionCheck' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'Status' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'Step' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'kind' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Planner.java */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Planner.java */ }
        attribute 'system' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/Planner.java */ }
    }
    item def 'StepState' :> JSONMessage {
        doc /* Source: ah5-LocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'node' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'processId' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'kind' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'state' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'errors' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
        attribute 'output' : String[0..1] { doc /* Source type: String. Java record component; ah5-LocalCloudConfigurator-java/src/main/java/eu/arrowhead/localcloudconfigurator/colony/ColonyClient.java */ }
    }
}
