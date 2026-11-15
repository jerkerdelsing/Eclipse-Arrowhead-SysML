library package ArrowheadAIGymData {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    item def 'Endpoint' :> JSONMessage {
        doc /* Source: ah5-AIGym-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'url' : String[0..1] { doc /* Source type: String. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ArrowheadGateway.java */ }
        attribute 'method' : String[0..1] { doc /* Source type: String. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ArrowheadGateway.java */ }
        attribute 'expiresAt' : Integer[0..1] { doc /* Source type: long. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ArrowheadGateway.java */ }
    }
    item def 'Observation' :> JSONMessage {
        doc /* Source: ah5-AIGym-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'schemaVersion' : String[0..1] { doc /* Source type: String. 1.0. */ }
        attribute 'observationId' : String[0..1] { doc /* Source type: String. <System>-<type>-<epoch ms>-<sequence>. */ }
        attribute 'providerSystem' : String[0..1] { doc /* Source type: String. The publishing system. */ }
        attribute 'serviceInstance' : String[0..1] { doc /* Source type: String. Service instance, default the system name. */ }
        attribute 'observationType' : String[0..1] { doc /* Source type: String. echo, power, status, trainingSample, inference. */ }
        attribute 'sourceTime' : String[0..1] { doc /* Source type: String. ISO 8601 UTC time with milliseconds. */ }
        attribute 'sequence' : Real[0..1] { doc /* Source type: Number. Sequence number per publisher. */ }
        ref item 'value' : JSONValue[0..1] { doc /* Source type: Object. Observed value, see the operations. */ }
        attribute 'unit' : String[0..1] { doc /* Source type: String. 1 for power and status; absent for echo. */ }
        attribute 'quality' : String[0..1] { doc /* Source type: String. good or uncertain. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. \texttt{{"publisherMode": "native"}}. */ }
    }
    item def 'Prediction' :> JSONMessage {
        doc /* Source: ah5-AIGym-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'model' : String[0..1] { doc /* Source type: String. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ModelStore.java */ }
        attribute 'value' : Real[0..1] { doc /* Source type: double. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ModelStore.java */ }
        attribute 'neighbours' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ModelStore.java */ }
        attribute 'trainingSamples' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ModelStore.java */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: Instant. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ModelStore.java */ }
    }
    item def 'PredictionRequest' :> JSONMessage {
        doc /* Source: ah5-AIGym-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'model' : String[0..1] { doc /* Source type: String. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/AiGymController.java */ }
        ref item 'features' : JSONValue[0..1] { doc /* Source type: Map<String,Double>. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/AiGymController.java */ }
        attribute 'neighbours' : Integer[0..1] { doc /* Source type: Integer. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/AiGymController.java */ }
    }
    item def 'Sample' :> JSONMessage {
        doc /* Source: ah5-AIGym-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ModelStore.java */ }
        attribute 'model' : String[0..1] { doc /* Source type: String. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ModelStore.java */ }
        ref item 'features' : JSONValue[0..1] { doc /* Source type: Map<String, Double>. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ModelStore.java */ }
        attribute 'target' : Real[0..1] { doc /* Source type: double. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ModelStore.java */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: Instant. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/ModelStore.java */ }
    }
    item def 'SampleRequest' :> JSONMessage {
        doc /* Source: ah5-AIGym-java-spring source and v5.3.0 IDDs. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'model' : String[0..1] { doc /* Source type: String. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/AiGymController.java */ }
        ref item 'features' : JSONValue[0..1] { doc /* Source type: Map<String,Double>. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/AiGymController.java */ }
        attribute 'target' : Real[0..1] { doc /* Source type: Double. Java record component; ah5-AIGym-java-spring/src/main/java/eu/arrowhead/aigym/AiGymController.java */ }
    }
}
