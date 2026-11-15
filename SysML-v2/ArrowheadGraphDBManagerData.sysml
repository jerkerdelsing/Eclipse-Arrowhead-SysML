library package ArrowheadGraphDBManagerData {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    item def 'Decision' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'allowed' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/security/GraphDBManagerAuthorizationService.java */ }
        attribute 'expiresAt' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/security/GraphDBManagerAuthorizationService.java */ }
    }
    item def 'EndpointKey' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/service/ProxyService.java */ }
        attribute 'serviceName' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/service/ProxyService.java */ }
    }
    item def 'ErrorMessage' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'errorMessage' : String[0..1] { doc /* Source type: String. Error text, if the event is an error. */ }
        attribute 'errorCode' : Real[0..1] { doc /* Source type: Number.  */ }
        attribute 'exceptionType' : ArrowheadCoreData::'ExceptionType'[0..1] { doc /* Source type: ExceptionType.  */ }
        attribute 'origin' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'HistorianPack' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: UUID. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        attribute 'serviceName' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        attribute 'baseTime' : Real[0..1] { doc /* Source type: double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        attribute 'minTime' : Real[0..1] { doc /* Source type: double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        attribute 'maxTime' : Real[0..1] { doc /* Source type: double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        attribute 'payload' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        ref item 'measurements' : 'Measurement'[0..*] { doc /* Source type: List<Measurement>. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
    }
    item def 'Measurement' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        attribute 'unit' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        attribute 'value' : Real[0..1] { doc /* Source type: Double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        attribute 'stringValue' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        attribute 'booleanValue' : Boolean[0..1] { doc /* Source type: Boolean. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
        attribute 'time' : Real[0..1] { doc /* Source type: double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/graphdb/HistorianPack.java */ }
    }
    item def 'Observation' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
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
    item def 'SenMLRecord' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'bn' : String[0..1] { doc /* Source type: String. SenML base name. */ }
        ref item 'bt' : JSONValue[0..1] { doc /* Source type: Object. SenML base time (seconds). */ }
        attribute 'bu' : String[0..1] { doc /* Source type: String. SenML base unit. */ }
        ref item 'bv' : JSONValue[0..1] { doc /* Source type: Object. SenML base value. */ }
        ref item 'bs' : JSONValue[0..1] { doc /* Source type: Object. SenML base sum. */ }
        ref item 'bver' : JSONValue[0..1] { doc /* Source type: Object. SenML base version. */ }
        attribute 'n' : String[0..1] { doc /* Source type: String. SenML name. */ }
        attribute 'u' : String[0..1] { doc /* Source type: String. SenML unit. */ }
        ref item 'v' : JSONValue[0..1] { doc /* Source type: Object. SenML numeric value. */ }
        attribute 'vs' : String[0..1] { doc /* Source type: String. SenML string value. */ }
        attribute 'vb' : Boolean[0..1] { doc /* Source type: Boolean. SenML Boolean value. */ }
        attribute 'vd' : String[0..1] { doc /* Source type: String. SenML data value (Base64). */ }
        ref item 's' : JSONValue[0..1] { doc /* Source type: Object. SenML sum. */ }
        ref item 't' : JSONValue[0..1] { doc /* Source type: Object. SenML time (seconds, relative to the base time). */ }
        ref item 'ut' : JSONValue[0..1] { doc /* Source type: Object. SenML update time (seconds). */ }
    }
    item def 'SenMLRecordDTO' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'bn' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 'bt' : Real[0..1] { doc /* Source type: Double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 'bu' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 'bv' : Real[0..1] { doc /* Source type: Double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 'bs' : Real[0..1] { doc /* Source type: Double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        ref item 'bver' : JSONValue[0..1] { doc /* Source type: Short. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 'n' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 'u' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 'v' : Real[0..1] { doc /* Source type: Double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 'vs' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 'vb' : Boolean[0..1] { doc /* Source type: Boolean. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 'vd' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 's' : Real[0..1] { doc /* Source type: Double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 't' : Real[0..1] { doc /* Source type: Double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
        attribute 'ut' : Real[0..1] { doc /* Source type: Double. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SenMLRecordDTO.java */ }
    }
    item def 'ServiceListResponse' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'services' : String[0..*] { doc /* Source type: Array<String>. Service names with stored data. */ }
    }
    item def 'ServiceListResponseDTO' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'services' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/ServiceListResponseDTO.java */ }
    }
    item def 'ServiceOperation' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/security/GraphDBManagerOperationResolver.java */ }
        attribute 'operation' : String[0..1] { doc /* Source type: String. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/security/GraphDBManagerOperationResolver.java */ }
    }
    item def 'SystemListResponse' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systems' : String[0..*] { doc /* Source type: Array<String>. System names with stored data. */ }
    }
    item def 'SystemListResponseDTO' :> JSONMessage {
        doc /* Source: ah5-GraphDBManager-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systems' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-GraphDBManager-java-spring/src/main/java/eu/arrowhead/graphdbmanager/api/dto/SystemListResponseDTO.java */ }
    }
}
