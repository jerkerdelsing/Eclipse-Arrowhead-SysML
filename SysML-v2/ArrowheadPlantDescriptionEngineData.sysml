library package ArrowheadPlantDescriptionEngineData {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    item def 'ActivePlant' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'description' : JSONValue[0..1] { doc /* Source type: PlantDescription. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/PlantDescriptionService.java */ }
        ref item 'systems' : 'PdeSystemDTO'[0..*] { doc /* Source type: List<PdeSystemDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/PlantDescriptionService.java */ }
        ref item 'connections' : 'ConnectionDTO'[0..*] { doc /* Source type: List<ConnectionDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/PlantDescriptionService.java */ }
    }
    item def 'CloudView' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'registered' : ArrowheadCoreData::'SystemResponseDTO'[0..*] { doc /* Source type: List<SystemResponseDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/MonitorService.java */ }
        ref item 'lastObservations' : JSONValue[0..1] { doc /* Source type: Map<String, String>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/MonitorService.java */ }
    }
    item def 'Connection' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'consumer' : 'SystemPort'[0..1] { doc /* Source type: SystemPort. The consumer port of the connection. */ }
        ref item 'producer' : 'SystemPort'[0..1] { doc /* Source type: SystemPort. The producer port of the connection. */ }
        attribute 'priority' : Real[0..1] { doc /* Source type: Number. Priority of the resulting orchestration rules (1 highest). */ }
    }
    item def 'ConnectionDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'consumer' : 'SystemPortDTO'[0..1] { doc /* Source type: SystemPortDTO. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/ConnectionDTO.java */ }
        ref item 'producer' : 'SystemPortDTO'[0..1] { doc /* Source type: SystemPortDTO. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/ConnectionDTO.java */ }
        attribute 'priority' : Integer[0..1] { doc /* Source type: Integer. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/ConnectionDTO.java */ }
    }
    item def 'Decision' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'allowed' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/security/PlantDescriptionEngineAuthorizationService.java */ }
        attribute 'expiresAt' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/security/PlantDescriptionEngineAuthorizationService.java */ }
    }
    item def 'Detected' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemId' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/AlarmDetector.java */ }
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/AlarmDetector.java */ }
        ref item 'cause' : JSONValue[0..1] { doc /* Source type: Cause. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/AlarmDetector.java */ }
        attribute 'description' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/AlarmDetector.java */ }
    }
    item def 'ErrorMessage' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'errorMessage' : String[0..1] { doc /* Source type: String. Error text, if the event is an error. */ }
        attribute 'errorCode' : Real[0..1] { doc /* Source type: Number.  */ }
        attribute 'exceptionType' : ArrowheadCoreData::'ExceptionType'[0..1] { doc /* Source type: ExceptionType.  */ }
        attribute 'origin' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'KeyValues' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'map' : JSONValue[0..1] { doc /* Source type: Object<String>. The configuration keys and values; secrets are not returned. */ }
    }
    item def 'LogEntry' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'logId' : String[0..1] { doc /* Source type: String. Identifier of the log entry. */ }
        ref item 'entryDate' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the log entry. */ }
        attribute 'logger' : String[0..1] { doc /* Source type: String. Logger (Java class) that wrote the entry; as filter, its name. */ }
        attribute 'severity' : String[0..1] { doc /* Source type: String. Log level, e.g. INFO, WARN, ERROR; as filter, the minimum level. */ }
        attribute 'message' : String[0..1] { doc /* Source type: String. Text of the log entry or status message of the job. */ }
        attribute 'exception' : String[0..1] { doc /* Source type: String. Stack trace or exception text of the log entry, if any. */ }
    }
    item def 'LogEntryListResponse' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'LogEntry'[0..*] { doc /* Source type: Array<LogEntry>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'LogRequest' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        ref item 'from' : JSONValue[0..1] { doc /* Source type: DateTime. Return entries from this UTC time. */ }
        ref item 'to' : JSONValue[0..1] { doc /* Source type: DateTime. Return entries until this UTC time. */ }
        attribute 'severity' : String[0..1] { doc /* Source type: String. Minimum log level to return. */ }
        attribute 'logger' : String[0..1] { doc /* Source type: String. Logger (Java class) that wrote the entry; as filter, its name. */ }
    }
    item def 'MonitorPlantDescriptionListResponse' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'MonitorPlantDescriptionResponse'[0..*] { doc /* Source type: Array<MonitorPlantDescriptionResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'MonitorPlantDescriptionListResponseDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'MonitorPlantDescriptionResponseDTO'[0..*] { doc /* Source type: List<MonitorPlantDescriptionResponseDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorPlantDescriptionListResponseDTO.java */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorPlantDescriptionListResponseDTO.java */ }
    }
    item def 'MonitorPlantDescriptionResponse' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : Real[0..1] { doc /* Source type: Number. Identifier of the plant description. */ }
        attribute 'plantDescription' : String[0..1] { doc /* Source type: String. Name of the plant description. */ }
        attribute 'active' : Boolean[0..1] { doc /* Source type: Boolean. Whether the entry is in force. */ }
        attribute 'include' : Real[0..*] { doc /* Source type: Array<Number>. Identifiers of included plant descriptions. */ }
        ref item 'systems' : 'MonitorSystem'[0..*] { doc /* Source type: Array<MonitorSystem>. Systems to create or update. */ }
        ref item 'connections' : 'Connection'[0..*] { doc /* Source type: Array<Connection>. Connections between consumer and producer ports. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
        ref item 'updatedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the last change. */ }
    }
    item def 'MonitorPlantDescriptionResponseDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorPlantDescriptionResponseDTO.java */ }
        attribute 'plantDescription' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorPlantDescriptionResponseDTO.java */ }
        attribute 'active' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorPlantDescriptionResponseDTO.java */ }
        attribute 'include' : Integer[0..*] { doc /* Source type: List<Long>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorPlantDescriptionResponseDTO.java */ }
        ref item 'systems' : 'MonitorSystemDTO'[0..*] { doc /* Source type: List<MonitorSystemDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorPlantDescriptionResponseDTO.java */ }
        ref item 'connections' : 'ConnectionDTO'[0..*] { doc /* Source type: List<ConnectionDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorPlantDescriptionResponseDTO.java */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorPlantDescriptionResponseDTO.java */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorPlantDescriptionResponseDTO.java */ }
    }
    item def 'MonitorSystem' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemId' : String[0..1] { doc /* Source type: String. Identifier of the system within the plant description. */ }
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Name of the system, PascalCase (e.g. TemperatureSensor). */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object<String>. Metadata the registered system must have. */ }
        ref item 'ports' : 'Port'[0..*] { doc /* Source type: Array<Port>. Services the system consumes or produces. */ }
        attribute 'registeredSystemName' : String[0..1] { doc /* Source type: String. Name of the registered system matched to this plant system. */ }
        ref item 'monitoring' : JSONValue[0..1] { doc /* Source type: Object. Latest monitoring information from SysMonitor. */ }
        ref item 'lastObservationTime' : JSONValue[0..1] { doc /* Source type: DateTime. Time of the latest stored observation of the system. */ }
    }
    item def 'MonitorSystemDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemId' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorSystemDTO.java */ }
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorSystemDTO.java */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, String>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorSystemDTO.java */ }
        ref item 'ports' : 'PortDTO'[0..*] { doc /* Source type: List<PortDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorSystemDTO.java */ }
        attribute 'registeredSystemName' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorSystemDTO.java */ }
        ref item 'monitoring' : JSONValue[0..1] { doc /* Source type: Map<String, Object>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorSystemDTO.java */ }
        attribute 'lastObservationTime' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/MonitorSystemDTO.java */ }
    }
    item def 'Observation' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
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
    item def 'Page' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'page' : Real[0..1] { doc /* Source type: Number. Zero-based page number. */ }
        attribute 'size' : Real[0..1] { doc /* Source type: Number. Number of records per page (at most max.page.size, default 1000). */ }
        attribute 'direction' : String[0..1] { doc /* Source type: String. Sort direction, ASC or DESC. */ }
        attribute 'sortField' : String[0..1] { doc /* Source type: String. Field to sort by. */ }
    }
    item def 'PdeAlarmListResponse' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'PdeAlarmResponse'[0..*] { doc /* Source type: Array<PdeAlarmResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'PdeAlarmListResponseDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'PdeAlarmResponseDTO'[0..*] { doc /* Source type: List<PdeAlarmResponseDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmListResponseDTO.java */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmListResponseDTO.java */ }
    }
    item def 'PdeAlarmResponse' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : Real[0..1] { doc /* Source type: Number. Identifier of the alarm. */ }
        attribute 'systemId' : String[0..1] { doc /* Source type: String. Identifier of the system within the plant description. */ }
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Name of the system the alarm concerns. */ }
        attribute 'acknowledged' : Boolean[0..1] { doc /* Source type: Boolean. Whether an operator acknowledged the alarm. */ }
        attribute 'severity' : String[0..1] { doc /* Source type: String. Severity of the alarm. */ }
        attribute 'cause' : String[0..1] { doc /* Source type: String. Alarm cause: SYSTEM_NOT_REGISTERED, MULTIPLE_MATCHES, SYSTEM_NOT_IN_DESCRIPTION, NOT_MONITORED or NO_RECENT_OBSERVATION. */ }
        attribute 'description' : String[0..1] { doc /* Source type: String. Human-readable alarm text. */ }
        ref item 'raisedAt' : JSONValue[0..1] { doc /* Source type: DateTime. Time the alarm was raised. */ }
        ref item 'updatedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the last change. */ }
        ref item 'clearedAt' : JSONValue[0..1] { doc /* Source type: DateTime. Time the alarm was cleared, if cleared. */ }
        ref item 'acknowledgedAt' : JSONValue[0..1] { doc /* Source type: DateTime. Time of the acknowledgement. */ }
    }
    item def 'PdeAlarmResponseDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmResponseDTO.java */ }
        attribute 'systemId' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmResponseDTO.java */ }
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmResponseDTO.java */ }
        attribute 'acknowledged' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmResponseDTO.java */ }
        attribute 'severity' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmResponseDTO.java */ }
        attribute 'cause' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmResponseDTO.java */ }
        attribute 'description' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmResponseDTO.java */ }
        attribute 'raisedAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmResponseDTO.java */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmResponseDTO.java */ }
        attribute 'clearedAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmResponseDTO.java */ }
        attribute 'acknowledgedAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmResponseDTO.java */ }
    }
    item def 'PdeAlarmUpdate' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'acknowledged' : Boolean[0..1] { doc /* Source type: Boolean. Set to true to acknowledge the alarm. */ }
    }
    item def 'PdeAlarmUpdateDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'acknowledged' : Boolean[0..1] { doc /* Source type: Boolean. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeAlarmUpdateDTO.java */ }
    }
    item def 'PdeSystem' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemId' : String[0..1] { doc /* Source type: String. Identifier of the system within the plant description. */ }
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Name of the registered system (optional; metadata may identify it instead). */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object<String>. Metadata the registered system must have. */ }
        ref item 'ports' : 'Port'[0..*] { doc /* Source type: Array<Port>. Services the system consumes or produces. */ }
    }
    item def 'PdeSystemDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemId' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeSystemDTO.java */ }
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeSystemDTO.java */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, String>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeSystemDTO.java */ }
        ref item 'ports' : 'PortDTO'[0..*] { doc /* Source type: List<PortDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PdeSystemDTO.java */ }
    }
    item def 'PlantDescriptionBody' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'include' : Integer[0..*] { doc /* Source type: List<Long>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/PlantDescriptionBody.java */ }
        ref item 'systems' : 'PdeSystemDTO'[0..*] { doc /* Source type: List<PdeSystemDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/PlantDescriptionBody.java */ }
        ref item 'connections' : 'ConnectionDTO'[0..*] { doc /* Source type: List<ConnectionDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/PlantDescriptionBody.java */ }
    }
    item def 'PlantDescriptionChangedEvent' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'plantDescriptionId' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/PlantDescriptionChangedEvent.java */ }
    }
    item def 'PlantDescriptionListResponse' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'PlantDescriptionResponse'[0..*] { doc /* Source type: Array<PlantDescriptionResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'PlantDescriptionListResponseDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'PlantDescriptionResponseDTO'[0..*] { doc /* Source type: List<PlantDescriptionResponseDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionListResponseDTO.java */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionListResponseDTO.java */ }
    }
    item def 'PlantDescriptionRequest' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'plantDescription' : String[0..1] { doc /* Source type: String. Name of the plant description. */ }
        attribute 'active' : Boolean[0..1] { doc /* Source type: Boolean. Make this the active plant description. */ }
        attribute 'include' : Real[0..*] { doc /* Source type: Array<Number>. Identifiers of included plant descriptions. */ }
        ref item 'systems' : 'PdeSystem'[0..*] { doc /* Source type: Array<PdeSystem>. Systems to create or update. */ }
        ref item 'connections' : 'Connection'[0..*] { doc /* Source type: Array<Connection>. Connections between consumer and producer ports. */ }
    }
    item def 'PlantDescriptionRequestDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'plantDescription' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionRequestDTO.java */ }
        attribute 'active' : Boolean[0..1] { doc /* Source type: Boolean. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionRequestDTO.java */ }
        attribute 'include' : Integer[0..*] { doc /* Source type: List<Long>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionRequestDTO.java */ }
        ref item 'systems' : 'PdeSystemDTO'[0..*] { doc /* Source type: List<PdeSystemDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionRequestDTO.java */ }
        ref item 'connections' : 'ConnectionDTO'[0..*] { doc /* Source type: List<ConnectionDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionRequestDTO.java */ }
    }
    item def 'PlantDescriptionResponse' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : Real[0..1] { doc /* Source type: Number. Identifier of the plant description. */ }
        attribute 'plantDescription' : String[0..1] { doc /* Source type: String. Name of the plant description. */ }
        attribute 'active' : Boolean[0..1] { doc /* Source type: Boolean. Whether this is the active plant description. */ }
        attribute 'include' : Real[0..*] { doc /* Source type: Array<Number>. Identifiers of included plant descriptions. */ }
        ref item 'systems' : 'PdeSystem'[0..*] { doc /* Source type: Array<PdeSystem>. Systems to create or update. */ }
        ref item 'connections' : 'Connection'[0..*] { doc /* Source type: Array<Connection>. Connections between consumer and producer ports. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
        ref item 'updatedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the last change. */ }
    }
    item def 'PlantDescriptionResponseDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionResponseDTO.java */ }
        attribute 'plantDescription' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionResponseDTO.java */ }
        attribute 'active' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionResponseDTO.java */ }
        attribute 'include' : Integer[0..*] { doc /* Source type: List<Long>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionResponseDTO.java */ }
        ref item 'systems' : 'PdeSystemDTO'[0..*] { doc /* Source type: List<PdeSystemDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionResponseDTO.java */ }
        ref item 'connections' : 'ConnectionDTO'[0..*] { doc /* Source type: List<ConnectionDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionResponseDTO.java */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionResponseDTO.java */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionResponseDTO.java */ }
    }
    item def 'PlantDescriptionUpdate' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'plantDescription' : String[0..1] { doc /* Source type: String. Name of the plant description. */ }
        attribute 'active' : Boolean[0..1] { doc /* Source type: Boolean. Make this the active plant description. */ }
        attribute 'include' : Real[0..*] { doc /* Source type: Array<Number>. Identifiers of included plant descriptions. */ }
        ref item 'systems' : 'PdeSystem'[0..*] { doc /* Source type: Array<PdeSystem>. Systems to create or update. */ }
        ref item 'connections' : 'Connection'[0..*] { doc /* Source type: Array<Connection>. Connections between consumer and producer ports. */ }
    }
    item def 'PlantDescriptionUpdateDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'plantDescription' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionUpdateDTO.java */ }
        attribute 'active' : Boolean[0..1] { doc /* Source type: Boolean. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionUpdateDTO.java */ }
        attribute 'include' : Integer[0..*] { doc /* Source type: List<Long>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionUpdateDTO.java */ }
        ref item 'systems' : 'PdeSystemDTO'[0..*] { doc /* Source type: List<PdeSystemDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionUpdateDTO.java */ }
        ref item 'connections' : 'ConnectionDTO'[0..*] { doc /* Source type: List<ConnectionDTO>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PlantDescriptionUpdateDTO.java */ }
    }
    item def 'Port' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'portName' : String[0..1] { doc /* Source type: String. Name of the port within its system. */ }
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String. Service definition name. */ }
        attribute 'serviceInterface' : String[0..1] { doc /* Source type: String. Required interface template of the port, if any. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object<String>. Metadata the service instance must have. */ }
        attribute 'consumer' : Boolean[0..1] { doc /* Source type: Boolean. True for a consumed service, false for a produced one. */ }
    }
    item def 'PortDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'portName' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PortDTO.java */ }
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PortDTO.java */ }
        attribute 'serviceInterface' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PortDTO.java */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, String>. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PortDTO.java */ }
        attribute 'consumer' : Boolean[0..1] { doc /* Source type: Boolean. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/PortDTO.java */ }
    }
    item def 'Rule' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/RuleResolver.java */ }
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/RuleResolver.java */ }
        attribute 'priority' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/RuleResolver.java */ }
    }
    item def 'ServiceOperation' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/security/PlantDescriptionEngineOperationResolver.java */ }
        attribute 'operation' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/security/PlantDescriptionEngineOperationResolver.java */ }
    }
    item def 'SyncState' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'ok' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/PlantSynchronizer.java */ }
        attribute 'detail' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/PlantSynchronizer.java */ }
        attribute 'time' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/PlantSynchronizer.java */ }
        attribute 'rules' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/service/PlantSynchronizer.java */ }
    }
    item def 'SystemPort' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemId' : String[0..1] { doc /* Source type: String. Identifier of the system within the plant description. */ }
        attribute 'portName' : String[0..1] { doc /* Source type: String. Name of the port within its system. */ }
    }
    item def 'SystemPortDTO' :> JSONMessage {
        doc /* Source: ah5-PlantDescriptionEngine-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemId' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/SystemPortDTO.java */ }
        attribute 'portName' : String[0..1] { doc /* Source type: String. Java record component; ah5-PlantDescriptionEngine-java-spring/src/main/java/eu/arrowhead/plantdescriptionengine/api/dto/SystemPortDTO.java */ }
    }
}
