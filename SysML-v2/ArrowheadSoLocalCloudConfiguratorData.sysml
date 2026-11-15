library package ArrowheadSoLocalCloudConfiguratorData {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    item def 'Capabilities' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'consumers' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
        ref item 'exports' : 'Export'[0..*] { doc /* Source type: List<Export>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
    }
    item def 'Check' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'service' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'expected' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Cloud' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'organization' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'intercloud' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'missing' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'consumers' : String[0..*] { doc /* Source type: Set<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        ref item 'exports' : 'Export'[0..*] { doc /* Source type: List<Export>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'CloudConfig' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        ref item 'neighbours' : 'Neighbour'[0..*] { doc /* Source type: List<Neighbour>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        ref item 'removeNeighbours' : 'Neighbour'[0..*] { doc /* Source type: List<Neighbour>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        ref item 'grants' : 'Grant'[0..*] { doc /* Source type: List<Grant>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'revokes' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        ref item 'preconditions' : 'Check'[0..*] { doc /* Source type: List<Check>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        ref item 'verify' : 'Check'[0..*] { doc /* Source type: List<Check>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        ref item 'discovery' : 'Discovery'[0..*] { doc /* Source type: List<Discovery>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'exportServices' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Decision' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'allowed' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/security/SolcAuthorizationService.java */ }
        attribute 'expiresAt' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/security/SolcAuthorizationService.java */ }
    }
    item def 'DesignDraft' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'design' : 'SolcDesign'[0..1] { doc /* Source type: SolcDesign. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/DesignDraft.java */ }
        attribute 'expectedRevision' : Integer[0..1] { doc /* Source type: Long. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/DesignDraft.java */ }
        attribute 'designId' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/DesignDraft.java */ }
    }
    item def 'DesignRecord' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/DesignRecord.java */ }
        attribute 'revision' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/DesignRecord.java */ }
        attribute 'updatedBy' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/DesignRecord.java */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/DesignRecord.java */ }
        ref item 'design' : 'SolcDesign'[0..1] { doc /* Source type: SolcDesign. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/DesignRecord.java */ }
    }
    item def 'Discovery' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'service' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'targetCloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Download' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'fileName' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/PackageService.java */ }
        attribute 'sha256' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/PackageService.java */ }
        ref item 'content' : JSONValue[0..*] { doc /* Source type: byte[]. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/PackageService.java */ }
    }
    item def 'Evaluation' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'solc' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'members' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        ref item 'violations' : 'Violation'[0..*] { doc /* Source type: List<Violation>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        ref item 'clouds' : JSONValue[0..1] { doc /* Source type: Map<String, CloudConfig>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        ref item 'relay' : 'RelayConfig'[0..1] { doc /* Source type: RelayConfig. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Exchange' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'consumerCloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'providerCloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'service' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'operations' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
    }
    item def 'Export' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
        attribute 'service' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
        attribute 'operations' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
        attribute 'services' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
    }
    item def 'Grant' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'service' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'consumers' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Input' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'designId' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        attribute 'designRevision' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        ref item 'design' : 'SolcDesign'[0..1] { doc /* Source type: SolcDesign. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        ref item 'evaluation' : JSONValue[0..1] { doc /* Source type: PolicyEngine.Evaluation. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        ref item 'lcCatalog' : JSONValue[0..1] { doc /* Source type: JsonNode. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        attribute 'sourceRepository' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        attribute 'sourceCommit' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
    }
    item def 'LcDesignRef' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'revision' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'components' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
    }
    item def 'Member' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        ref item 'lcDesign' : 'LcDesignRef'[0..1] { doc /* Source type: LcDesignRef. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'host' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'architecture' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'portOffset' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'intercloud' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
    }
    item def 'Neighbour' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'operator' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'PackageRecord' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRecord.java */ }
        attribute 'designId' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRecord.java */ }
        attribute 'designName' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRecord.java */ }
        attribute 'designRevision' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRecord.java */ }
        attribute 'imageMode' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRecord.java */ }
        attribute 'architectures' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRecord.java */ }
        attribute 'fileName' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRecord.java */ }
        attribute 'sha256' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRecord.java */ }
        attribute 'sizeBytes' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRecord.java */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRecord.java */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRecord.java */ }
    }
    item def 'PackageRequest' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'designId' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRequest.java */ }
        attribute 'expectedRevision' : Integer[0..1] { doc /* Source type: Long. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/service/dto/PackageRequest.java */ }
    }
    item def 'Packaging' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'imageMode' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'architectures' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
    }
    item def 'Point' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'x' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'y' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
    }
    item def 'PolicyCatalog' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'organization' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
        attribute 'forbiddenConsumers' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
        attribute 'intercloudComponents' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
        ref item 'components' : JSONValue[0..1] { doc /* Source type: Map<String, Capabilities>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
        attribute 'architectures' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
        attribute 'relayPort' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/catalog/PolicyCatalog.java */ }
    }
    item def 'Relay' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'host' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'port' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
    }
    item def 'RelayConfig' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'clouds' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'subjects' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
    }
    item def 'Result' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'root' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        attribute 'fileName' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        ref item 'content' : JSONValue[0..*] { doc /* Source type: byte[]. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        attribute 'sha256' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
        ref item 'files' : JSONValue[0..1] { doc /* Source type: Map<String, String>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/packaging/PackageBuilder.java */ }
    }
    item def 'SolcDesign' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'organization' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        ref item 'relay' : 'Relay'[0..1] { doc /* Source type: Relay. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        ref item 'members' : 'Member'[0..*] { doc /* Source type: List<Member>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        ref item 'exchanges' : 'Exchange'[0..*] { doc /* Source type: List<Exchange>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        attribute 'verifyDiscovery' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        ref item 'packaging' : 'Packaging'[0..1] { doc /* Source type: Packaging. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
        ref item 'layout' : JSONValue[0..1] { doc /* Source type: Map<String, Point>. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/design/SolcDesign.java */ }
    }
    item def 'Violation' :> JSONMessage {
        doc /* Source: ah5-SoLocalCloudConfigurator-java source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'rule' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
        attribute 'message' : String[0..1] { doc /* Source type: String. Java record component; ah5-SoLocalCloudConfigurator-java/src/main/java/eu/arrowhead/solocalcloudconfigurator/policy/PolicyEngine.java */ }
    }
}
