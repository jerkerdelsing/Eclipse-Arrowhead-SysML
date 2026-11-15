library package ArrowheadCoreData {
    private import ScalarValues::*;
    private import ArrowheadFoundation::*;
    enum def 'AddressType' {
        enum 'HOSTNAME';
        enum 'IPV4';
        enum 'IPV6';
        enum 'MAC';
    }
    enum def 'AuthenticationMethod' {
        enum 'PASSWORD';
    }
    enum def 'AuthorizationLevel' {
        enum 'MGMT';
        enum 'PROVIDER';
    }
    enum def 'AuthorizationPolicyType' {
        enum 'ALL';
        enum 'WHITELIST';
        enum 'BLACKLIST';
        enum 'SYS_METADATA';
    }
    enum def 'AuthorizationTargetType' {
        enum 'SERVICE_DEF';
        enum 'EVENT_TYPE';
    }
    enum def 'AuthorizationTokenType' {
        enum 'TIME_LIMITED_TOKEN';
        enum 'USAGE_LIMITED_TOKEN';
        enum 'SELF_CONTAINED_TOKEN';
        enum 'TRANSLATION_BRIDGE_TOKEN';
    }
    enum def 'DataModelTranslationTaskStatus' {
        enum 'PENDING';
        enum 'IN_PROGRESS';
        enum 'DONE';
        enum 'ERROR';
    }
    enum def 'ExceptionType' {
        enum 'ARROWHEAD';
        enum 'INVALID_PARAMETER';
        enum 'AUTH';
        enum 'FORBIDDEN';
        enum 'DATA_NOT_FOUND';
        enum 'TIMEOUT';
        enum 'LOCKED';
        enum 'INTERNAL_SERVER_ERROR';
        enum 'EXTERNAL_SERVER_ERROR';
    }
    enum def 'Mode' {
        enum 'ALL';
        enum 'ACTIVES';
        enum 'INACTIVES';
    }
    enum def 'NotifyProtocol' {
        enum 'HTTP';
        enum 'HTTPS';
        enum 'MQTT';
        enum 'MQTTS';
    }
    enum def 'OrchestrationFlag' {
        enum 'MATCHMAKING';
        enum 'ONLY_PREFERRED';
        enum 'ONLY_EXCLUSIVE';
        enum 'ALLOW_TRANSLATION';
        enum 'ALLOW_INTERCLOUD';
        enum 'ONLY_INTERCLOUD';
    }
    enum def 'OrchestrationType' {
        enum 'PULL';
        enum 'PUSH';
    }
    enum def 'QoSOperation' {
        enum 'FILTER';
        enum 'SORT';
    }
    enum def 'ServiceInterfacePolicy' {
        enum 'NONE';
        enum 'CERT_AUTH';
        enum 'TIME_LIMITED_TOKEN_AUTH';
        enum 'USAGE_LIMITED_TOKEN_AUTH';
        enum 'BASE64_SELF_CONTAINED_TOKEN_AUTH';
        enum 'RSA_SHA256_JSON_WEB_TOKEN_AUTH';
        enum 'RSA_SHA512_JSON_WEB_TOKEN_AUTH';
        enum 'TRANSLATION_BRIDGE_TOKEN_AUTH';
    }
    enum def 'TranslationBridgeEventState' {
        enum 'USED';
        enum 'INTERNAL_CLOSED';
        enum 'INTERNAL_ERROR';
        enum 'EXTERNAL_ERROR';
    }
    enum def 'TranslationBridgeStatus' {
        enum 'NEW';
        enum 'DISCOVERED';
        enum 'PENDING';
        enum 'INITIALIZED';
        enum 'USED';
        enum 'ABORTED';
        enum 'CLOSED';
        enum 'ERROR';
    }
    enum def 'TranslationDiscoveryFlag' {
        enum 'CONSUMER_BLACKLIST_CHECK';
        enum 'CANDIDATES_BLACKLIST_CHECK';
        enum 'TRANSLATORS_BLACKLIST_CHECK';
        enum 'CANDIDATES_AUTH_CHECK';
        enum 'TRANSLATORS_AUTH_CHECK';
    }
    item def 'Address' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'type' : String[0..1] { doc /* Source type: String. Address type: HOSTNAME, IPV4, IPV6 or MAC. */ }
        attribute 'address' : String[0..1] { doc /* Source type: String. One network address (host name, IPv4, IPv6 or MAC address). */ }
    }
    item def 'AddressDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'type' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'address' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationEncryptionKeyRegistrationRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'key' : String[0..1] { doc /* Source type: String. AES key of the provider (at least 16 bytes). */ }
        attribute 'algorithm' : String[0..1] { doc /* Source type: String. Encryption algorithm of the key, e.g. AES/ECB/PKCS5Padding or AES/CBC/PKCS5Padding. */ }
    }
    item def 'AuthorizationEncryptionKeyRegistrationRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'key' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'algorithm' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationGrantRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Cloud identifier of the consumer cloud the policy applies to; LOCAL for the own cloud. */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String. Target type: SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Service definition (or event type) the policy protects. */ }
        attribute 'description' : String[0..1] { doc /* Source type: String. Free-text description. */ }
        ref item 'defaultPolicy' : 'AuthorizationPolicyRequest'[0..1] { doc /* Source type: AuthorizationPolicyRequest. Policy that applies to all operations without a scoped policy. */ }
        ref item 'scopedPolicies' : JSONValue[0..1] { doc /* Source type: Object<AuthorizationPolicyRequest>. Policies for individual operations, keyed by operation name. */ }
    }
    item def 'AuthorizationGrantRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'cloud' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'target' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'description' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'defaultPolicy' : 'AuthorizationPolicyRequestDTO'[0..1] { doc /* Source type: AuthorizationPolicyRequestDTO.  */ }
        ref item 'scopedPolicies' : JSONValue[0..1] { doc /* Source type: Map<String, AuthorizationPolicyRequestDTO>.  */ }
    }
    item def 'AuthorizationLookupRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceIds' : String[0..*] { doc /* Source type: Array<String>. Policy instance identifiers to match. */ }
        attribute 'cloudIdentifiers' : String[0..*] { doc /* Source type: Array<String>. Cloud identifiers to match. */ }
        attribute 'targetNames' : String[0..*] { doc /* Source type: Array<String>. Target names to match. */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String. Target type: SERVICE_DEF or EVENT_TYPE. */ }
    }
    item def 'AuthorizationLookupRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceIds' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'cloudIdentifiers' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'targetNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationMgmtEncryptionKeyListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'AuthorizationMgmtEncryptionKeyResponse'[0..*] { doc /* Source type: Array<AuthorizationMgmtEncryptionKeyResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'AuthorizationMgmtEncryptionKeyListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'AuthorizationMgmtEncryptionKeyResponseDTO'[0..*] { doc /* Source type: List<AuthorizationMgmtEncryptionKeyResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'AuthorizationMgmtEncryptionKeyRegistrationListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'list' : 'AuthorizationMgmtEncryptionKeyRegistrationRequest'[0..*] { doc /* Source type: Array<AuthorizationMgmtEncryptionKeyRegistrationRequest>. The list of request items. */ }
    }
    item def 'AuthorizationMgmtEncryptionKeyRegistrationListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'list' : 'AuthorizationMgmtEncryptionKeyRegistrationRequestDTO'[0..*] { doc /* Source type: List<AuthorizationMgmtEncryptionKeyRegistrationRequestDTO>.  */ }
    }
    item def 'AuthorizationMgmtEncryptionKeyRegistrationRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Provider system the key belongs to. */ }
        attribute 'key' : String[0..1] { doc /* Source type: String. The encryption key, as a string. */ }
        attribute 'algorithm' : String[0..1] { doc /* Source type: String. Encryption algorithm of the key, e.g. AES/ECB/PKCS5Padding or AES/CBC/PKCS5Padding. */ }
    }
    item def 'AuthorizationMgmtEncryptionKeyRegistrationRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'key' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'algorithm' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationMgmtEncryptionKeyResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Name of the system, PascalCase (e.g. TemperatureSensor). */ }
        attribute 'rawKey' : String[0..1] { doc /* Source type: String. The registered encryption key. */ }
        attribute 'algorithm' : String[0..1] { doc /* Source type: String. Encryption algorithm of the key, e.g. AES/ECB/PKCS5Padding or AES/CBC/PKCS5Padding. */ }
        attribute 'keyAdditive' : String[0..1] { doc /* Source type: String. Initialization vector (CBC mode), Base64; empty for ECB. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
    }
    item def 'AuthorizationMgmtEncryptionKeyResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'rawKey' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'algorithm' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'keyAdditive' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationMgmtGrantListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'list' : 'AuthorizationMgmtGrantRequest'[0..*] { doc /* Source type: Array<AuthorizationMgmtGrantRequest>. The list of request items. */ }
    }
    item def 'AuthorizationMgmtGrantListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'list' : 'AuthorizationMgmtGrantRequestDTO'[0..*] { doc /* Source type: List<AuthorizationMgmtGrantRequestDTO>.  */ }
    }
    item def 'AuthorizationMgmtGrantRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Cloud identifier of the consumer cloud the policy applies to; LOCAL for the own cloud. */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Provider system the policy is set for. */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String. Target type: SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Target of the policy or token: a service definition or event type. */ }
        attribute 'description' : String[0..1] { doc /* Source type: String. Free-text description. */ }
        ref item 'defaultPolicy' : 'AuthorizationPolicyRequest'[0..1] { doc /* Source type: AuthorizationPolicyRequest. Policy that applies to all operations without a scoped policy. */ }
        ref item 'scopedPolicies' : JSONValue[0..1] { doc /* Source type: Object<AuthorizationPolicyRequest>. Policies for individual operations, keyed by operation name. */ }
    }
    item def 'AuthorizationMgmtGrantRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'cloud' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'target' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'description' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'defaultPolicy' : 'AuthorizationPolicyRequestDTO'[0..1] { doc /* Source type: AuthorizationPolicyRequestDTO.  */ }
        ref item 'scopedPolicies' : JSONValue[0..1] { doc /* Source type: Map<String, AuthorizationPolicyRequestDTO>.  */ }
    }
    item def 'AuthorizationPolicy' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'policyType' : 'AuthorizationPolicyType'[0..1] { doc /* Source type: AuthorizationPolicyType. Policy type: ALL, WHITELIST, BLACKLIST or SYS_METADATA. */ }
        attribute 'policyList' : String[0..*] { doc /* Source type: Array<String>. System names of the white- or blacklist. */ }
        ref item 'policyMetadataRequirement' : 'MetadataRequirement'[0..1] { doc /* Source type: MetadataRequirement. Metadata the consumer system must have (SYS_METADATA). */ }
    }
    item def 'AuthorizationPolicyDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'policyType' : 'AuthorizationPolicyType'[0..1] { doc /* Source type: AuthorizationPolicyType.  */ }
        attribute 'policyList' : String[0..*] { doc /* Source type: List<String>.  */ }
        ref item 'policyMetadataRequirement' : JSONValue[0..1] { doc /* Source type: MetadataRequirementDTO.  */ }
    }
    item def 'AuthorizationPolicyListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'AuthorizationPolicyResponse'[0..*] { doc /* Source type: Array<AuthorizationPolicyResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'AuthorizationPolicyListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'AuthorizationPolicyResponseDTO'[0..*] { doc /* Source type: List<AuthorizationPolicyResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'AuthorizationPolicyRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'policyType' : String[0..1] { doc /* Source type: String. Policy type: ALL, WHITELIST, BLACKLIST or SYS_METADATA. */ }
        attribute 'policyList' : String[0..*] { doc /* Source type: Array<String>. System names of the white- or blacklist. */ }
        ref item 'policyMetadataRequirement' : 'MetadataRequirement'[0..1] { doc /* Source type: MetadataRequirement. Metadata the consumer system must have (SYS_METADATA). */ }
    }
    item def 'AuthorizationPolicyRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'policyType' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'policyList' : String[0..*] { doc /* Source type: List<String>.  */ }
        ref item 'policyMetadataRequirement' : JSONValue[0..1] { doc /* Source type: MetadataRequirementDTO.  */ }
    }
    item def 'AuthorizationPolicyResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceId' : String[0..1] { doc /* Source type: String. Policy instance identifier \texttt{<MGMT or PR>\textbar{}<cloud>\textbar{}<provider>\textbar{}<targetType>\textbar{}<target>}. */ }
        attribute 'level' : 'AuthorizationLevel'[0..1] { doc /* Source type: AuthorizationLevel. Policy level: MGMT (set by an operator) or PROVIDER (set by the provider itself). */ }
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Cloud identifier of the consumer cloud the policy applies to; LOCAL for the own cloud. */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Provider system the policy protects. */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType. Target type: SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Target of the policy or token: a service definition or event type. */ }
        attribute 'description' : String[0..1] { doc /* Source type: String. Free-text description. */ }
        ref item 'defaultPolicy' : 'AuthorizationPolicy'[0..1] { doc /* Source type: AuthorizationPolicy. Policy that applies to all operations without a scoped policy. */ }
        ref item 'scopedPolicies' : JSONValue[0..1] { doc /* Source type: Object<AuthorizationPolicy>. Policies for individual operations, keyed by operation name. */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String. Name of the system that created the record. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
    }
    item def 'AuthorizationPolicyResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'level' : 'AuthorizationLevel'[0..1] { doc /* Source type: AuthorizationLevel.  */ }
        attribute 'cloud' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType.  */ }
        attribute 'target' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'description' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'defaultPolicy' : 'AuthorizationPolicyDTO'[0..1] { doc /* Source type: AuthorizationPolicyDTO.  */ }
        ref item 'scopedPolicies' : JSONValue[0..1] { doc /* Source type: Map<String, AuthorizationPolicyDTO>.  */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'level' : String[0..1] { doc /* Source type: String. Policy level to match, MGMT or PROVIDER. */ }
        attribute 'providers' : String[0..*] { doc /* Source type: Array<String>. Provider system names to match. */ }
        attribute 'instanceIds' : String[0..*] { doc /* Source type: Array<String>. Policy instance identifiers to match. */ }
        attribute 'cloudIdentifiers' : String[0..*] { doc /* Source type: Array<String>. Cloud identifiers to match. */ }
        attribute 'targetNames' : String[0..*] { doc /* Source type: Array<String>. Target names to match. */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String. Target type: SERVICE_DEF or EVENT_TYPE. */ }
    }
    item def 'AuthorizationQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'level' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'providers' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'instanceIds' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'cloudIdentifiers' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'targetNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationTokenGenerationMgmtListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'list' : 'AuthorizationTokenGenerationMgmtRequest'[0..*] { doc /* Source type: Array<AuthorizationTokenGenerationMgmtRequest>. The list of request items. */ }
    }
    item def 'AuthorizationTokenGenerationMgmtListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'list' : 'AuthorizationTokenGenerationMgmtRequestDTO'[0..*] { doc /* Source type: List<AuthorizationTokenGenerationMgmtRequestDTO>.  */ }
    }
    item def 'AuthorizationTokenGenerationMgmtRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'tokenVariant' : String[0..1] { doc /* Source type: String. Requested token variant, as interface security policy (e.g. TIME_LIMITED_TOKEN_AUTH, RSA_SHA512_JSON_WEB_TOKEN_AUTH). */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String. Target type: SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'consumerCloud' : String[0..1] { doc /* Source type: String. Cloud identifier of the consumer system. */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Name of the consumer system. */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Name of the provider system. */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Target of the policy or token: a service definition or event type. */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String. Operation the token or policy is limited to; empty for all operations. */ }
        ref item 'expiresAt' : JSONValue[0..1] { doc /* Source type: DateTime. Requested expiry; default token.time.limit from now. */ }
        attribute 'usageLimit' : Real[0..1] { doc /* Source type: Number. Requested uses; default simple.token.usage.limit. */ }
    }
    item def 'AuthorizationTokenGenerationMgmtRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'tokenVariant' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'consumerCloud' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'target' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expiresAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'usageLimit' : Integer[0..1] { doc /* Source type: Integer.  */ }
    }
    item def 'AuthorizationTokenGenerationRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'tokenVariant' : String[0..1] { doc /* Source type: String. Requested token variant, as interface security policy (e.g. TIME_LIMITED_TOKEN_AUTH, RSA_SHA512_JSON_WEB_TOKEN_AUTH). */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Provider system the token is for. */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String. Target type: SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Service definition (or event type). */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String. Operation the token is for. */ }
    }
    item def 'AuthorizationTokenGenerationRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'tokenVariant' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'target' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationTokenGenerationResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'tokenType' : 'AuthorizationTokenType'[0..1] { doc /* Source type: AuthorizationTokenType. Token type: TIME_LIMITED_TOKEN, USAGE_LIMITED_TOKEN, SELF_CONTAINED_TOKEN or TRANSLATION_BRIDGE_TOKEN. */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType. Target type: SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'token' : String[0..1] { doc /* Source type: String. The token (opaque string, Base64 or JSON Web Token). */ }
        attribute 'usageLimit' : Real[0..1] { doc /* Source type: Number. Number of allowed uses (usage-limited tokens). */ }
        ref item 'expiresAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC expiry of time-limited tokens. */ }
    }
    item def 'AuthorizationTokenGenerationResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'tokenType' : 'AuthorizationTokenType'[0..1] { doc /* Source type: AuthorizationTokenType.  */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType.  */ }
        attribute 'token' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'usageLimit' : Integer[0..1] { doc /* Source type: Integer.  */ }
        attribute 'expiresAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationTokenMgmtListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'AuthorizationTokenResponse'[0..*] { doc /* Source type: Array<AuthorizationTokenResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'AuthorizationTokenMgmtListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'AuthorizationTokenResponseDTO'[0..*] { doc /* Source type: List<AuthorizationTokenResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'AuthorizationTokenQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'requester' : String[0..1] { doc /* Source type: String. Name of the system that requested the token. */ }
        attribute 'tokenType' : String[0..1] { doc /* Source type: String. Token type to match. */ }
        attribute 'consumerCloud' : String[0..1] { doc /* Source type: String. Cloud identifier of the consumer system. */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Name of the consumer system. */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Name of the provider system. */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String. Target type: SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Target of the policy or token: a service definition or event type. */ }
    }
    item def 'AuthorizationTokenQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'requester' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'tokenType' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'consumerCloud' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'target' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationTokenResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'tokenType' : 'AuthorizationTokenType'[0..1] { doc /* Source type: AuthorizationTokenType. Token type: TIME_LIMITED_TOKEN, USAGE_LIMITED_TOKEN, SELF_CONTAINED_TOKEN or TRANSLATION_BRIDGE_TOKEN. */ }
        attribute 'variant' : String[0..1] { doc /* Source type: String. Token variant (interface security policy). */ }
        attribute 'token' : String[0..1] { doc /* Source type: String. The token, for simple tokens only in hashed form. */ }
        attribute 'tokenReference' : String[0..1] { doc /* Source type: String. Reference of the token, used to revoke it. */ }
        attribute 'requester' : String[0..1] { doc /* Source type: String. Name of the system that requested the token. */ }
        attribute 'consumerCloud' : String[0..1] { doc /* Source type: String. Cloud identifier of the consumer system. */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Name of the consumer system. */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String. Name of the provider system. */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType. Target type: SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Target of the policy or token: a service definition or event type. */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String. Operation the token or policy is limited to; empty for all operations. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
        attribute 'usageLimit' : Real[0..1] { doc /* Source type: Number. Number of allowed uses (usage-limited tokens). */ }
        attribute 'usageLeft' : Real[0..1] { doc /* Source type: Number. Remaining uses of a usage-limited token. */ }
        ref item 'expiresAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC expiry time; no value means no expiry. */ }
    }
    item def 'AuthorizationTokenResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'tokenType' : 'AuthorizationTokenType'[0..1] { doc /* Source type: AuthorizationTokenType.  */ }
        attribute 'variant' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'token' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'tokenReference' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'requester' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'consumerCloud' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType.  */ }
        attribute 'target' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'usageLimit' : Integer[0..1] { doc /* Source type: Integer.  */ }
        attribute 'usageLeft' : Integer[0..1] { doc /* Source type: Integer.  */ }
        attribute 'expiresAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationTokenVerifyResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'verified' : Boolean[0..1] { doc /* Source type: Boolean. True when the token is valid. */ }
        attribute 'consumerCloud' : String[0..1] { doc /* Source type: String. Cloud identifier of the consumer system. */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Name of the consumer system. */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType. Target type: SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Target of the policy or token: a service definition or event type. */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String. Operation the token or policy is limited to; empty for all operations. */ }
    }
    item def 'AuthorizationTokenVerifyResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'verified' : Boolean[0..1] { doc /* Source type: boolean.  */ }
        attribute 'consumerCloud' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType.  */ }
        attribute 'target' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationVerifyListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'list' : 'AuthorizationVerifyRequest'[0..*] { doc /* Source type: Array<AuthorizationVerifyRequest>. The list of request items. */ }
    }
    item def 'AuthorizationVerifyListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'list' : 'AuthorizationVerifyRequestDTO'[0..*] { doc /* Source type: List<AuthorizationVerifyRequestDTO>.  */ }
    }
    item def 'AuthorizationVerifyListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'AuthorizationVerifyResponse'[0..*] { doc /* Source type: Array<AuthorizationVerifyResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'AuthorizationVerifyListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'AuthorizationVerifyResponseDTO'[0..*] { doc /* Source type: List<AuthorizationVerifyResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'AuthorizationVerifyRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'provider' : String[0..1] { doc /* Source type: String. Provider system; for verify defaults to the requester. */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Consumer system; for verify defaults to the requester. */ }
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Cloud of the consumer, LOCAL by default. */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String. Target type: SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Target of the policy or token: a service definition or event type. */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String. Operation to check; empty checks the default policy. */ }
    }
    item def 'AuthorizationVerifyRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'provider' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'cloud' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetType' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'target' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'AuthorizationVerifyResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'provider' : String[0..1] { doc /* Source type: String. Name of the provider system. */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Name of the consumer system. */ }
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Cloud of the consumer. */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType. Target type: SERVICE_DEF or EVENT_TYPE. */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Target of the policy or token: a service definition or event type. */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String. The checked operation. */ }
        attribute 'granted' : Boolean[0..1] { doc /* Source type: Boolean. Result of the check: true when the consumer is authorized. */ }
    }
    item def 'AuthorizationVerifyResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'provider' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'cloud' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType.  */ }
        attribute 'target' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'granted' : Boolean[0..1] { doc /* Source type: boolean.  */ }
    }
    item def 'BlacklistCreateListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entities' : 'BlacklistCreateRequestDTO'[0..*] { doc /* Source type: List<BlacklistCreateRequestDTO>.  */ }
    }
    item def 'BlacklistCreateRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expiresAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'reason' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'BlacklistEntryDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'revokedBy' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'reason' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expiresAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'active' : Boolean[0..1] { doc /* Source type: boolean.  */ }
    }
    item def 'BlacklistEntryListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'BlacklistEntryDTO'[0..*] { doc /* Source type: List<BlacklistEntryDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'BlacklistQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'systemNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'mode' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'issuers' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'revokers' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'reason' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'alivesAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'ConfigListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'names' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'DataModelFactoryTranslatorInitiaizationResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'dataModelTranslatorName' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'interfaceProperties' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
    }
    item def 'DataModelTranslationInitRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'inputModelId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'outputModelId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'payload' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'settings' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
    }
    item def 'DataModelTranslationResultResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'status' : 'DataModelTranslationTaskStatus'[0..1] { doc /* Source type: DataModelTranslationTaskStatus.  */ }
        attribute 'result' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'mimeType' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'DataModelTranslatorFactoryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'fromModelId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'toModelId' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'DeviceListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'devices' : 'DeviceRequest'[0..*] { doc /* Source type: Array<DeviceRequest>. Devices to create or update. */ }
    }
    item def 'DeviceListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'devices' : 'DeviceRequestDTO'[0..*] { doc /* Source type: List<DeviceRequestDTO>.  */ }
    }
    item def 'DeviceListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'DeviceResponse'[0..*] { doc /* Source type: Array<DeviceResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'DeviceListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'DeviceResponseDTO'[0..*] { doc /* Source type: List<DeviceResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'DeviceLookupRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'deviceNames' : String[0..*] { doc /* Source type: Array<String>. Device names to match. */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: Array<String>. Network addresses of the entity. */ }
        attribute 'addressType' : String[0..1] { doc /* Source type: String. Address type filter: HOSTNAME, IPV4, IPV6 or MAC. */ }
        ref item 'metadataRequirementList' : 'MetadataRequirement'[0..*] { doc /* Source type: Array<MetadataRequirement>. Metadata requirements; each map is one alternative. */ }
    }
    item def 'DeviceLookupRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'deviceNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'addressType' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadataRequirementList' : JSONValue[0..*] { doc /* Source type: List<MetadataRequirementDTO>.  */ }
    }
    item def 'DeviceQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'deviceNames' : String[0..*] { doc /* Source type: Array<String>. Device names to match. */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: Array<String>. Network addresses of the entity. */ }
        attribute 'addressType' : String[0..1] { doc /* Source type: String. Address type filter: HOSTNAME, IPV4, IPV6 or MAC. */ }
        ref item 'metadataRequirementList' : 'MetadataRequirement'[0..*] { doc /* Source type: Array<MetadataRequirement>. Metadata requirements; each map is one alternative. */ }
    }
    item def 'DeviceQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'deviceNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'addressType' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadataRequirementList' : JSONValue[0..*] { doc /* Source type: List<MetadataRequirementDTO>.  */ }
    }
    item def 'DeviceRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Device name, PascalCase. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. Free-form metadata (JSON object). */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: Array<String>. Network addresses of the entity. */ }
    }
    item def 'DeviceRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'DeviceResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Device name. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. Free-form metadata (JSON object). */ }
        ref item 'addresses' : 'Address'[0..*] { doc /* Source type: Array<Address>. Network addresses with their types. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
        ref item 'updatedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the last change. */ }
    }
    item def 'DeviceResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        ref item 'addresses' : 'AddressDTO'[0..*] { doc /* Source type: List<AddressDTO>.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'ErrorMessage' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'errorMessage' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'errorCode' : Real[0..1] { doc /* Source type: Number.  */ }
        attribute 'exceptionType' : 'ExceptionType'[0..1] { doc /* Source type: ExceptionType.  */ }
        attribute 'origin' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'ErrorMessageDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'errorMessage' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'errorCode' : Integer[0..1] { doc /* Source type: int.  */ }
        attribute 'exceptionType' : 'ExceptionType'[0..1] { doc /* Source type: ExceptionType.  */ }
        attribute 'origin' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'ExtraInterface' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/init/ServiceRegistryApplicationInitListener.java */ }
        attribute 'templateName' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/init/ServiceRegistryApplicationInitListener.java */ }
        attribute 'protocol' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/init/ServiceRegistryApplicationInitListener.java */ }
        attribute 'policy' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/init/ServiceRegistryApplicationInitListener.java */ }
        attribute 'address' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/init/ServiceRegistryApplicationInitListener.java */ }
        attribute 'port' : Integer[0..1] { doc /* Source type: Integer. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/init/ServiceRegistryApplicationInitListener.java */ }
    }
    item def 'IdentityChangeRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Name of the system, PascalCase (e.g. TemperatureSensor). */ }
        ref item 'credentials' : JSONValue[0..1] { doc /* Source type: Object<String>. Credentials of the authentication method, for PASSWORD the key password. */ }
        ref item 'newCredentials' : JSONValue[0..1] { doc /* Source type: Object<String>. The new credentials. */ }
    }
    item def 'IdentityChangeRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'credentials' : JSONValue[0..1] { doc /* Source type: Map<String, String>.  */ }
        ref item 'newCredentials' : JSONValue[0..1] { doc /* Source type: Map<String, String>.  */ }
    }
    item def 'IdentityData' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'system' : JSONValue[0..1] { doc /* Source type: System. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/IdentityData.java */ }
        ref item 'credentials' : JSONValue[0..1] { doc /* Source type: Map<String, String>. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/IdentityData.java */ }
        attribute 'sysop' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/IdentityData.java */ }
    }
    item def 'IdentityListMgmtCreateRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'authenticationMethod' : String[0..1] { doc /* Source type: String. Authentication method of the identities; PASSWORD is the only implemented method. */ }
        ref item 'identities' : 'IdentityMgmtRequest'[0..*] { doc /* Source type: Array<IdentityMgmtRequest>. Identities to create, update or return. */ }
    }
    item def 'IdentityListMgmtCreateRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'authenticationMethod' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'identities' : 'IdentityMgmtRequestDTO'[0..*] { doc /* Source type: List<IdentityMgmtRequestDTO>.  */ }
    }
    item def 'IdentityListMgmtResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'identities' : 'IdentityMgmtResponse'[0..*] { doc /* Source type: Array<IdentityMgmtResponse>. Identities to create, update or return. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'IdentityListMgmtResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'identities' : 'IdentityMgmtResponseDTO'[0..*] { doc /* Source type: List<IdentityMgmtResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'IdentityListMgmtUpdateRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'identities' : 'IdentityMgmtRequest'[0..*] { doc /* Source type: Array<IdentityMgmtRequest>. Identities to create, update or return. */ }
    }
    item def 'IdentityListMgmtUpdateRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'identities' : 'IdentityMgmtRequestDTO'[0..*] { doc /* Source type: List<IdentityMgmtRequestDTO>.  */ }
    }
    item def 'IdentityLoginData' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'normalizedRequest' : 'IdentityRequestDTO'[0..1] { doc /* Source type: IdentityRequestDTO. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/IdentityLoginData.java */ }
        ref item 'system' : JSONValue[0..1] { doc /* Source type: System. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/IdentityLoginData.java */ }
        ref item 'response' : 'IdentityLoginResponseDTO'[0..1] { doc /* Source type: IdentityLoginResponseDTO. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/IdentityLoginData.java */ }
    }
    item def 'IdentityLoginResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'token' : String[0..1] { doc /* Source type: String. The identity token, used as Bearer IDENTITY-TOKEN//<token>. */ }
        ref item 'expirationTime' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time when the identity token expires. */ }
    }
    item def 'IdentityLoginResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'token' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expirationTime' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'IdentityMgmtRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Name of the system, PascalCase (e.g. TemperatureSensor). */ }
        ref item 'credentials' : JSONValue[0..1] { doc /* Source type: Object<String>. Credentials of the authentication method, for PASSWORD the key password. */ }
        attribute 'sysop' : Boolean[0..1] { doc /* Source type: Boolean. Whether the identity is a system operator (default false). */ }
    }
    item def 'IdentityMgmtRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'credentials' : JSONValue[0..1] { doc /* Source type: Map<String, String>.  */ }
        attribute 'sysop' : Boolean[0..1] { doc /* Source type: Boolean.  */ }
    }
    item def 'IdentityMgmtResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Name of the system, PascalCase (e.g. TemperatureSensor). */ }
        attribute 'authenticationMethod' : String[0..1] { doc /* Source type: String. Authentication method of the identities; PASSWORD is the only implemented method. */ }
        attribute 'sysop' : Boolean[0..1] { doc /* Source type: Boolean. Whether the identity is a system operator (bypasses the management filters). */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String. Name of the system that created the record. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
        attribute 'updatedBy' : String[0..1] { doc /* Source type: String. Name of the system that changed the record last. */ }
        ref item 'updatedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the last change. */ }
    }
    item def 'IdentityMgmtResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'authenticationMethod' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'sysop' : Boolean[0..1] { doc /* Source type: boolean.  */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'updatedBy' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'IdentityQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'namePart' : String[0..1] { doc /* Source type: String. Part of the system name to match. */ }
        attribute 'isSysop' : Boolean[0..1] { doc /* Source type: Boolean. Only sysop (true) or non-sysop (false) identities. */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String. Name of the system that created the record. */ }
        ref item 'creationFrom' : JSONValue[0..1] { doc /* Source type: DateTime. Lower bound of the creation time. */ }
        ref item 'creationTo' : JSONValue[0..1] { doc /* Source type: DateTime. Upper bound of the creation time. */ }
        attribute 'hasSession' : Boolean[0..1] { doc /* Source type: Boolean. Only identities with (true) or without (false) an active session. */ }
    }
    item def 'IdentityQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'namePart' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'isSysop' : Boolean[0..1] { doc /* Source type: Boolean.  */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'creationFrom' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'creationTo' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'hasSession' : Boolean[0..1] { doc /* Source type: Boolean.  */ }
    }
    item def 'IdentityRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Name of the system, PascalCase (e.g. TemperatureSensor). */ }
        ref item 'credentials' : JSONValue[0..1] { doc /* Source type: Object<String>. Credentials of the authentication method, for PASSWORD the key password. */ }
    }
    item def 'IdentityRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'credentials' : JSONValue[0..1] { doc /* Source type: Map<String, String>.  */ }
    }
    item def 'IdentitySessionListMgmtResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'sessions' : 'IdentitySessionResponse'[0..*] { doc /* Source type: Array<IdentitySessionResponse>. Active sessions. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'IdentitySessionListMgmtResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'sessions' : 'IdentitySessionResponseDTO'[0..*] { doc /* Source type: List<IdentitySessionResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'IdentitySessionQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'namePart' : String[0..1] { doc /* Source type: String. Part of the system name to match. */ }
        ref item 'loginFrom' : JSONValue[0..1] { doc /* Source type: DateTime. Lower bound of the login time. */ }
        ref item 'loginTo' : JSONValue[0..1] { doc /* Source type: DateTime. Upper bound of the login time. */ }
    }
    item def 'IdentitySessionQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'namePart' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'loginFrom' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'loginTo' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'IdentitySessionResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Name of the system, PascalCase (e.g. TemperatureSensor). */ }
        ref item 'loginTime' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the login. */ }
        ref item 'expirationTime' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time when the identity token expires. */ }
    }
    item def 'IdentitySessionResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'loginTime' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expirationTime' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'IdentityVerifyResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'verified' : Boolean[0..1] { doc /* Source type: Boolean. True when the token is valid. */ }
        attribute 'systemName' : String[0..1] { doc /* Source type: String. System the token belongs to. */ }
        attribute 'sysop' : Boolean[0..1] { doc /* Source type: Boolean. Whether that system is a system operator. */ }
        ref item 'loginTime' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the login. */ }
        ref item 'expirationTime' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time when the identity token expires. */ }
    }
    item def 'IdentityVerifyResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'verified' : Boolean[0..1] { doc /* Source type: boolean.  */ }
        attribute 'systemName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'sysop' : Boolean[0..1] { doc /* Source type: Boolean.  */ }
        attribute 'loginTime' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expirationTime' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'KeyValues' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'map' : JSONValue[0..1] { doc /* Source type: Object<String>. The configuration keys and values; secrets are not returned. */ }
    }
    item def 'KeyValuesDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'map' : JSONValue[0..1] { doc /* Source type: Map<String, String>.  */ }
    }
    item def 'LogEntry' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'logId' : String[0..1] { doc /* Source type: String. Identifier of the log entry. */ }
        ref item 'entryDate' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the log entry. */ }
        attribute 'logger' : String[0..1] { doc /* Source type: String. Logger (Java class) that wrote the entry; as filter, its name. */ }
        attribute 'severity' : String[0..1] { doc /* Source type: String. Log level, e.g. INFO, WARN, ERROR; as filter, the minimum level. */ }
        attribute 'message' : String[0..1] { doc /* Source type: String. Text of the log entry or status message of the job. */ }
        attribute 'exception' : String[0..1] { doc /* Source type: String. Stack trace or exception text of the log entry, if any. */ }
    }
    item def 'LogEntryDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'logId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'entryDate' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'logger' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'severity' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'message' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'exception' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'LogEntryListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'LogEntry'[0..*] { doc /* Source type: Array<LogEntry>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'LogEntryListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'LogEntryDTO'[0..*] { doc /* Source type: List<LogEntryDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'LogRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        ref item 'from' : JSONValue[0..1] { doc /* Source type: DateTime. Return entries from this UTC time. */ }
        ref item 'to' : JSONValue[0..1] { doc /* Source type: DateTime. Return entries until this UTC time. */ }
        attribute 'severity' : String[0..1] { doc /* Source type: String. Minimum log level to return. */ }
        attribute 'logger' : String[0..1] { doc /* Source type: String. Logger (Java class) that wrote the entry; as filter, its name. */ }
    }
    item def 'LogRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'from' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'to' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'severity' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'logger' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'MetadataRequirement' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'MqttNotifyTemplate' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'receiver' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'sender' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'payload' : JSONValue[0..1] { doc /* Source type: Object.  */ }
    }
    item def 'MqttPublishTemplate' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'sender' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'payload' : JSONValue[0..1] { doc /* Source type: Object.  */ }
    }
    item def 'MqttRequestTemplate' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'traceId' : String[0..1] { doc /* Source type: String. Identifier chosen by the requester, returned in the response. */ }
        attribute 'authentication' : String[0..1] { doc /* Source type: String. Identity of the requester (see Section \ref{sec:operations}). */ }
        attribute 'responseTopic' : String[0..1] { doc /* Source type: String. Topic on which the response is published. */ }
        attribute 'qosRequirement' : Real[0..1] { doc /* Source type: Number. MQTT QoS of the response (0, 1 or 2). */ }
        ref item 'params' : JSONValue[0..1] { doc /* Source type: Object<String>. Optional parameters (the query parameters of the HTTP binding). */ }
        ref item 'payload' : JSONValue[0..1] { doc /* Source type: Object. The operation input. */ }
    }
    item def 'MqttResponseTemplate' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'status' : Real[0..1] { doc /* Source type: Number. Status code. */ }
        attribute 'traceId' : String[0..1] { doc /* Source type: String. The trace identifier of the request. */ }
        attribute 'receiver' : String[0..1] { doc /* Source type: String. Name of the requester. */ }
        ref item 'payload' : JSONValue[0..1] { doc /* Source type: Object. The operation output, or an ErrorMessage. */ }
    }
    item def 'NormalizedAuthorizationPolicyRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'policyType' : 'AuthorizationPolicyType'[0..1] { doc /* Source type: AuthorizationPolicyType. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/NormalizedAuthorizationPolicyRequest.java */ }
        attribute 'policyList' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/NormalizedAuthorizationPolicyRequest.java */ }
        ref item 'policyMetadataRequirement' : JSONValue[0..1] { doc /* Source type: MetadataRequirementDTO. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/NormalizedAuthorizationPolicyRequest.java */ }
    }
    item def 'NormalizedDeviceRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/service/dto/NormalizedDeviceRequestDTO.java */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/service/dto/NormalizedDeviceRequestDTO.java */ }
        ref item 'addresses' : 'AddressDTO'[0..*] { doc /* Source type: List<AddressDTO>. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/service/dto/NormalizedDeviceRequestDTO.java */ }
    }
    item def 'NormalizedIdentityListMgmtRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'authenticationMethod' : JSONValue[0..1] { doc /* Source type: IAuthenticationMethod. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityListMgmtRequestDTO.java */ }
        ref item 'identities' : 'NormalizedIdentityMgmtRequestDTO'[0..*] { doc /* Source type: List<NormalizedIdentityMgmtRequestDTO>. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityListMgmtRequestDTO.java */ }
    }
    item def 'NormalizedIdentityMgmtRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityMgmtRequestDTO.java */ }
        ref item 'credentials' : JSONValue[0..1] { doc /* Source type: Map<String, String>. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityMgmtRequestDTO.java */ }
        attribute 'sysop' : Boolean[0..1] { doc /* Source type: boolean. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityMgmtRequestDTO.java */ }
    }
    item def 'NormalizedIdentityQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pageRequest' : JSONValue[0..1] { doc /* Source type: PageRequest. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityQueryRequestDTO.java */ }
        attribute 'namePart' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityQueryRequestDTO.java */ }
        attribute 'isSysop' : Boolean[0..1] { doc /* Source type: Boolean. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityQueryRequestDTO.java */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityQueryRequestDTO.java */ }
        attribute 'creationFrom' : String[0..1] { doc /* Source type: ZonedDateTime. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityQueryRequestDTO.java */ }
        attribute 'creationTo' : String[0..1] { doc /* Source type: ZonedDateTime. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityQueryRequestDTO.java */ }
        attribute 'hasSession' : Boolean[0..1] { doc /* Source type: Boolean. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentityQueryRequestDTO.java */ }
    }
    item def 'NormalizedIdentitySessionQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pageRequest' : JSONValue[0..1] { doc /* Source type: PageRequest. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentitySessionQueryRequestDTO.java */ }
        attribute 'namePart' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentitySessionQueryRequestDTO.java */ }
        attribute 'loginFrom' : String[0..1] { doc /* Source type: ZonedDateTime. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentitySessionQueryRequestDTO.java */ }
        attribute 'loginTo' : String[0..1] { doc /* Source type: ZonedDateTime. Java record component; ah5-core-java-spring/authentication/src/main/java/eu/arrowhead/authentication/service/dto/NormalizedIdentitySessionQueryRequestDTO.java */ }
    }
    item def 'NormalizedOrchestrationSimpleStoreQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO. Java record component; ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/service/model/NormalizedOrchestrationSimpleStoreQueryRequest.java */ }
        attribute 'ids' : String[0..*] { doc /* Source type: List<UUID>. Java record component; ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/service/model/NormalizedOrchestrationSimpleStoreQueryRequest.java */ }
        attribute 'consumerNames' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/service/model/NormalizedOrchestrationSimpleStoreQueryRequest.java */ }
        attribute 'serviceDefinitions' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/service/model/NormalizedOrchestrationSimpleStoreQueryRequest.java */ }
        attribute 'serviceInstanceIds' : String[0..*] { doc /* Source type: List<String>. Java record component; ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/service/model/NormalizedOrchestrationSimpleStoreQueryRequest.java */ }
        attribute 'minPriority' : Integer[0..1] { doc /* Source type: Integer. Java record component; ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/service/model/NormalizedOrchestrationSimpleStoreQueryRequest.java */ }
        attribute 'maxPriority' : Integer[0..1] { doc /* Source type: Integer. Java record component; ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/service/model/NormalizedOrchestrationSimpleStoreQueryRequest.java */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/serviceorchestration-simple/src/main/java/eu/arrowhead/serviceorchestration/service/model/NormalizedOrchestrationSimpleStoreQueryRequest.java */ }
    }
    item def 'NormalizedSystemRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/service/dto/NormalizedSystemRequestDTO.java */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/service/dto/NormalizedSystemRequestDTO.java */ }
        attribute 'version' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/service/dto/NormalizedSystemRequestDTO.java */ }
        ref item 'addresses' : 'AddressDTO'[0..*] { doc /* Source type: List<AddressDTO>. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/service/dto/NormalizedSystemRequestDTO.java */ }
        attribute 'deviceName' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/serviceregistry/src/main/java/eu/arrowhead/serviceregistry/service/dto/NormalizedSystemRequestDTO.java */ }
    }
    item def 'NormalizedVerifyRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/NormalizedVerifyRequest.java */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/NormalizedVerifyRequest.java */ }
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/NormalizedVerifyRequest.java */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/NormalizedVerifyRequest.java */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/NormalizedVerifyRequest.java */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/NormalizedVerifyRequest.java */ }
    }
    item def 'Observation' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'schemaVersion' : String[0..1] { doc /* Source type: String. 1.0. */ }
        attribute 'observationId' : String[0..1] { doc /* Source type: String. <System>-<type>-<epoch ms>-<sequence>. */ }
        attribute 'providerSystem' : String[0..1] { doc /* Source type: String. The publishing system. */ }
        attribute 'serviceInstance' : String[0..1] { doc /* Source type: String. Service instance, default the system name. */ }
        attribute 'observationType' : String[0..1] { doc /* Source type: String. echo, power or status. */ }
        attribute 'sourceTime' : String[0..1] { doc /* Source type: String. ISO 8601 UTC time with milliseconds. */ }
        attribute 'sequence' : Real[0..1] { doc /* Source type: Number. Sequence number per publisher. */ }
        ref item 'value' : JSONValue[0..1] { doc /* Source type: Object. Observed value, see the operations. */ }
        attribute 'unit' : String[0..1] { doc /* Source type: String. 1 for power and status; absent for echo. */ }
        attribute 'quality' : String[0..1] { doc /* Source type: String. good or uncertain. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. \texttt{{"publisherMode": "native"}}. */ }
    }
    item def 'OrchestrationHistoryQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'ids' : String[0..*] { doc /* Source type: Array<String>. Job identifiers (UUID) to match. */ }
        attribute 'statuses' : String[0..*] { doc /* Source type: Array<String>. Job statuses to match. */ }
        attribute 'type' : String[0..1] { doc /* Source type: String. Orchestration type to match: PULL or PUSH. */ }
        attribute 'requesterSystems' : String[0..*] { doc /* Source type: Array<String>. Requester system names to match. */ }
        attribute 'targetSystems' : String[0..*] { doc /* Source type: Array<String>. Target system names. */ }
        attribute 'serviceDefinitions' : String[0..*] { doc /* Source type: Array<String>. Service definition names to match. */ }
        attribute 'subscriptionIds' : String[0..*] { doc /* Source type: Array<String>. Subscription identifiers. */ }
    }
    item def 'OrchestrationHistoryQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'ids' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'statuses' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'type' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'requesterSystems' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'targetSystems' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'serviceDefinitions' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'subscriptionIds' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'OrchestrationHistoryResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'OrchestrationJob'[0..*] { doc /* Source type: Array<OrchestrationJob>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'OrchestrationHistoryResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'OrchestrationJobDTO'[0..*] { doc /* Source type: List<OrchestrationJobDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'OrchestrationJob' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Identifier (UUID) of the orchestration job. */ }
        attribute 'status' : String[0..1] { doc /* Source type: String. Status of the job: PENDING, IN_PROGRESS, DONE or ERROR. */ }
        attribute 'type' : String[0..1] { doc /* Source type: String. Orchestration type: PULL or PUSH. */ }
        attribute 'requesterSystem' : String[0..1] { doc /* Source type: String. Name of the system that requested the orchestration. */ }
        attribute 'targetSystem' : String[0..1] { doc /* Source type: String. Name of the consumer system the orchestration was made for. */ }
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String. Service definition name. */ }
        attribute 'subscriptionId' : String[0..1] { doc /* Source type: String. Subscription that started the push job. */ }
        attribute 'message' : String[0..1] { doc /* Source type: String. Status message, e.g. 1 local result: DataManager. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
        ref item 'startedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time when the job started. */ }
        ref item 'finishedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time when the job finished. */ }
    }
    item def 'OrchestrationJobDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'status' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'type' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'requesterSystem' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetSystem' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'subscriptionId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'message' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'startedAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'finishedAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'OrchestrationLockListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'locks' : 'OrchestrationLockRequest'[0..*] { doc /* Source type: Array<OrchestrationLockRequest>. Locks to create. */ }
    }
    item def 'OrchestrationLockListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'locks' : 'OrchestrationLockRequestDTO'[0..*] { doc /* Source type: List<OrchestrationLockRequestDTO>.  */ }
    }
    item def 'OrchestrationLockListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'OrchestrationLockResponse'[0..*] { doc /* Source type: Array<OrchestrationLockResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'OrchestrationLockListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'OrchestrationLockResponseDTO'[0..*] { doc /* Source type: List<OrchestrationLockResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'OrchestrationLockQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'ids' : Real[0..*] { doc /* Source type: Array<Number>. Lock identifiers to match. */ }
        attribute 'orchestrationJobIds' : String[0..*] { doc /* Source type: Array<String>. Orchestration job identifiers to match. */ }
        attribute 'serviceInstanceIds' : String[0..*] { doc /* Source type: Array<String>. Service instance identifiers to match. */ }
        attribute 'owners' : String[0..*] { doc /* Source type: Array<String>. Lock owner names to match. */ }
        ref item 'expiresBefore' : JSONValue[0..1] { doc /* Source type: DateTime. Upper bound of the expiry time. */ }
        ref item 'expiresAfter' : JSONValue[0..1] { doc /* Source type: DateTime. Lower bound of the expiry time. */ }
    }
    item def 'OrchestrationLockQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'ids' : Integer[0..*] { doc /* Source type: List<Long>.  */ }
        attribute 'orchestrationJobIds' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'serviceInstanceIds' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'owners' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'expiresBefore' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expiresAfter' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'OrchestrationLockRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String. Service instance identifier \texttt{<System>\textbar{}<serviceDefinition>\textbar{}<version>}. */ }
        attribute 'owner' : String[0..1] { doc /* Source type: String. System for which the instance is locked. */ }
        ref item 'expiresAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC expiry of the lock. */ }
    }
    item def 'OrchestrationLockRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'owner' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expiresAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'OrchestrationLockResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : Real[0..1] { doc /* Source type: Number. Identifier of the lock. */ }
        attribute 'orchestrationJobId' : String[0..1] { doc /* Source type: String. Orchestration job that created the lock. */ }
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String. Service instance identifier \texttt{<System>\textbar{}<serviceDefinition>\textbar{}<version>}. */ }
        attribute 'owner' : String[0..1] { doc /* Source type: String. Name of the system owning the lock. */ }
        ref item 'expiresAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC expiry of the lock. */ }
        attribute 'temporary' : Boolean[0..1] { doc /* Source type: Boolean. True for a lock held only during an orchestration. */ }
    }
    item def 'OrchestrationLockResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : Integer[0..1] { doc /* Source type: long.  */ }
        attribute 'orchestrationJobId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'owner' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expiresAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'temporary' : Boolean[0..1] { doc /* Source type: boolean.  */ }
    }
    item def 'OrchestrationNotifyInterface' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'protocol' : String[0..1] { doc /* Source type: String. Protocol of the notification: HTTP, HTTPS, MQTT or MQTTS. */ }
        ref item 'properties' : JSONValue[0..1] { doc /* Source type: Object<String>. For HTTP(S) address, port, method, path; for MQTT(S) topic (and broker address, port). */ }
    }
    item def 'OrchestrationNotifyInterfaceDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'protocol' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'properties' : JSONValue[0..1] { doc /* Source type: Map<String, String>.  */ }
    }
    item def 'OrchestrationPlantProvider' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String. Service instance identifier \texttt{<System>\textbar{}<serviceDefinition>\textbar{}<version>}. */ }
        attribute 'priority' : Real[0..1] { doc /* Source type: Number. Nonnegative rank; zero is highest and lower values win among otherwise eligible providers. */ }
    }
    item def 'OrchestrationPlantProviderDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'priority' : Integer[0..1] { doc /* Source type: Integer.  */ }
    }
    item def 'OrchestrationPlantRule' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Name of the consumer system. */ }
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String. Service definition name. */ }
        ref item 'providers' : 'OrchestrationPlantProvider'[0..*] { doc /* Source type: Array<OrchestrationPlantProvider>. Ranked allowed service instances; empty means managed but unavailable, with no unrelated or inter-cloud fallback. */ }
    }
    item def 'OrchestrationPlantRuleDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'consumer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'providers' : 'OrchestrationPlantProviderDTO'[0..*] { doc /* Source type: List<OrchestrationPlantProviderDTO>.  */ }
    }
    item def 'OrchestrationPlantRules' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'rules' : 'OrchestrationPlantRule'[0..*] { doc /* Source type: Array<OrchestrationPlantRule>. Complete active-plant snapshot; an empty array clears all managed scopes. */ }
    }
    item def 'OrchestrationPlantRulesDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'rules' : 'OrchestrationPlantRuleDTO'[0..*] { doc /* Source type: List<OrchestrationPlantRuleDTO>.  */ }
    }
    item def 'OrchestrationPushJobListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'jobs' : 'OrchestrationJob'[0..*] { doc /* Source type: Array<OrchestrationJob>. Orchestration jobs started by the trigger. */ }
    }
    item def 'OrchestrationPushJobListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'jobs' : 'OrchestrationJobDTO'[0..*] { doc /* Source type: List<OrchestrationJobDTO>.  */ }
    }
    item def 'OrchestrationPushTrigger' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'targetSystems' : String[0..*] { doc /* Source type: Array<String>. Consumers whose subscriptions are executed. */ }
        attribute 'subscriptionIds' : String[0..*] { doc /* Source type: Array<String>. Subscriptions to execute. */ }
    }
    item def 'OrchestrationPushTriggerDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'targetSystems' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'subscriptionIds' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'OrchestrationRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'serviceRequirement' : 'OrchestrationServiceRequirement'[0..1] { doc /* Source type: OrchestrationServiceRequirement. Requirements on the service the consumer wants to use. */ }
        ref item 'orchestrationFlags' : JSONValue[0..1] { doc /* Source type: Object<Boolean>. Orchestration flags, e.g. MATCHMAKING, ONLY_PREFERRED, ALLOW_INTERCLOUD. */ }
        ref item 'qualityRequirements' : 'QoSRequirement'[0..*] { doc /* Source type: Array<QoSRequirement>. Quality-of-service requirements (evaluated by DeviceQoSEvaluator). */ }
        attribute 'exclusivityDuration' : Real[0..1] { doc /* Source type: Number. Requested exclusive reservation of the provider in seconds. */ }
    }
    item def 'OrchestrationRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'serviceRequirement' : 'OrchestrationServiceRequirementDTO'[0..1] { doc /* Source type: OrchestrationServiceRequirementDTO.  */ }
        ref item 'orchestrationFlags' : JSONValue[0..1] { doc /* Source type: Map<String, Boolean>.  */ }
        ref item 'qualityRequirements' : 'QoSRequirementDTO'[0..*] { doc /* Source type: List<QoSRequirementDTO>.  */ }
        attribute 'exclusivityDuration' : Integer[0..1] { doc /* Source type: Integer.  */ }
    }
    item def 'OrchestrationResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'results' : 'OrchestrationResult'[0..*] { doc /* Source type: Array<OrchestrationResult>. The orchestration results, best first. */ }
        attribute 'warnings' : String[0..*] { doc /* Source type: Array<String>. Warnings of the orchestration, e.g. autoMatchmaking, notExclusive, interCloud. */ }
    }
    item def 'OrchestrationResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'results' : 'OrchestrationResultDTO'[0..*] { doc /* Source type: List<OrchestrationResultDTO>.  */ }
        attribute 'warnings' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'OrchestrationResult' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String. Service instance identifier \texttt{<System>\textbar{}<serviceDefinition>\textbar{}<version>}. */ }
        attribute 'cloudIdentitifer' : String[0..1] { doc /* Source type: String. Cloud identifier of the provider (LOCAL for the own cloud). The JSON name keeps the upstream spelling. */ }
        attribute 'providerName' : String[0..1] { doc /* Source type: String. Name of the provider system. */ }
        attribute 'serviceDefinitition' : String[0..1] { doc /* Source type: String. Service definition name. The JSON name keeps the upstream spelling. */ }
        ref item 'version' : JSONValue[0..1] { doc /* Source type: Version. Version of the service instance. */ }
        attribute 'aliveUntil' : String[0..1] { doc /* Source type: String. Time until which the service instance is registered (its expiry), if any. */ }
        attribute 'exclusiveUntil' : String[0..1] { doc /* Source type: String. Time until which the instance is reserved exclusively for the consumer, if reserved. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. Metadata of the service instance. */ }
        ref item 'interfaces' : 'ServiceInstanceInterfaceResponse'[0..*] { doc /* Source type: Array<ServiceInstanceInterfaceResponse>. Interfaces the consumer can use (only matching ones). */ }
        ref item 'authorizationTokens' : JSONValue[0..1] { doc /* Source type: Object<Object<AuthorizationTokenGenerationResponse>>. Authorization tokens generated for the consumer, per interface template and operation. */ }
    }
    item def 'OrchestrationResultDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'cloudIdentitifer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'providerName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'serviceDefinitition' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'version' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'aliveUntil' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'exclusiveUntil' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        ref item 'interfaces' : 'ServiceInstanceInterfaceResponseDTO'[0..*] { doc /* Source type: List<ServiceInstanceInterfaceResponseDTO>.  */ }
        ref item 'authorizationTokens' : JSONValue[0..1] { doc /* Source type: Map<String, Map<String, AuthorizationTokenGenerationResponseDTO>>.  */ }
    }
    item def 'OrchestrationServiceRequirement' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String. Service definition name. */ }
        attribute 'operations' : String[0..*] { doc /* Source type: Array<String>. Service operations the consumer wants to use. */ }
        ref item 'versions' : JSONValue[0..*] { doc /* Source type: Array<Version>. Accepted service versions. */ }
        ref item 'alivesAt' : JSONValue[0..1] { doc /* Source type: DateTime. Only instances that are still registered (not expired) at this UTC time are matched. */ }
        ref item 'metadataRequirements' : 'MetadataRequirement'[0..*] { doc /* Source type: Array<MetadataRequirement>. Requirements on the service instance metadata; each map is one alternative. */ }
        attribute 'interfaceTemplateNames' : String[0..*] { doc /* Source type: Array<String>. Accepted interface templates, e.g. generic_https. */ }
        attribute 'interfaceAddressTypes' : String[0..*] { doc /* Source type: Array<String>. Address types the provider interface must offer. */ }
        ref item 'interfacePropertyRequirements' : 'MetadataRequirement'[0..*] { doc /* Source type: Array<MetadataRequirement>. Requirements on the interface properties; each map is one alternative. */ }
        attribute 'securityPolicies' : String[0..*] { doc /* Source type: Array<String>. Accepted interface security policies. */ }
        attribute 'preferredProviders' : String[0..*] { doc /* Source type: Array<String>. Provider systems to prefer. */ }
    }
    item def 'OrchestrationServiceRequirementDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'operations' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'versions' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'alivesAt' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadataRequirements' : JSONValue[0..*] { doc /* Source type: List<MetadataRequirementDTO>.  */ }
        attribute 'interfaceTemplateNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'interfaceAddressTypes' : String[0..*] { doc /* Source type: List<String>.  */ }
        ref item 'interfacePropertyRequirements' : JSONValue[0..*] { doc /* Source type: List<MetadataRequirementDTO>.  */ }
        attribute 'securityPolicies' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'preferredProviders' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'OrchestrationSimpleStoreListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'candidates' : 'OrchestrationSimpleStoreRequest'[0..*] { doc /* Source type: Array<OrchestrationSimpleStoreRequest>. Store entries to create. */ }
    }
    item def 'OrchestrationSimpleStoreListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'candidates' : 'OrchestrationSimpleStoreRequestDTO'[0..*] { doc /* Source type: List<OrchestrationSimpleStoreRequestDTO>.  */ }
    }
    item def 'OrchestrationSimpleStoreListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'OrchestrationSimpleStoreResponse'[0..*] { doc /* Source type: Array<OrchestrationSimpleStoreResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'OrchestrationSimpleStoreListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'OrchestrationSimpleStoreResponseDTO'[0..*] { doc /* Source type: List<OrchestrationSimpleStoreResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'OrchestrationSimpleStoreQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'ids' : String[0..*] { doc /* Source type: Array<String>. Store entry identifiers (UUID) to match. */ }
        attribute 'consumerNames' : String[0..*] { doc /* Source type: Array<String>. Consumer system names to match. */ }
        attribute 'serviceDefinitions' : String[0..*] { doc /* Source type: Array<String>. Service definition names to match. */ }
        attribute 'serviceInstanceIds' : String[0..*] { doc /* Source type: Array<String>. Service instance identifiers to match. */ }
        attribute 'minPriority' : Real[0..1] { doc /* Source type: Number. Lower bound of the priority. */ }
        attribute 'maxPriority' : Real[0..1] { doc /* Source type: Number. Upper bound of the priority. */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String. Creator system to match. */ }
    }
    item def 'OrchestrationSimpleStoreQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'ids' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'consumerNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'serviceDefinitions' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'serviceInstanceIds' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'minPriority' : Integer[0..1] { doc /* Source type: Integer.  */ }
        attribute 'maxPriority' : Integer[0..1] { doc /* Source type: Integer.  */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'OrchestrationSimpleStoreRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Consumer system the rule applies to. */ }
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String. Service instance offered to the consumer. */ }
        attribute 'priority' : Real[0..1] { doc /* Source type: Number. Priority of the rule; 1 is the highest. */ }
    }
    item def 'OrchestrationSimpleStoreRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'consumer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'priority' : Integer[0..1] { doc /* Source type: Integer.  */ }
    }
    item def 'OrchestrationSimpleStoreResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Identifier (UUID) of the store entry. */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Name of the consumer system. */ }
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String. Service definition name. */ }
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String. Service instance identifier \texttt{<System>\textbar{}<serviceDefinition>\textbar{}<version>}. */ }
        attribute 'priority' : Real[0..1] { doc /* Source type: Number. Priority of the entry; 1 is the highest. */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String. Name of the system that created the record. */ }
        attribute 'updatedBy' : String[0..1] { doc /* Source type: String. Name of the system that changed the record last. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
        ref item 'updatedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the last change. */ }
    }
    item def 'OrchestrationSimpleStoreResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'priority' : Integer[0..1] { doc /* Source type: Integer.  */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'updatedBy' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'OrchestrationSubscriptionListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'subscriptions' : 'OrchestrationSubscriptionRequest'[0..*] { doc /* Source type: Array<OrchestrationSubscriptionRequest>. Subscriptions to create. */ }
    }
    item def 'OrchestrationSubscriptionListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'subscriptions' : 'OrchestrationSubscriptionRequestDTO'[0..*] { doc /* Source type: List<OrchestrationSubscriptionRequestDTO>.  */ }
    }
    item def 'OrchestrationSubscriptionListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'OrchestrationSubscriptionResponse'[0..*] { doc /* Source type: Array<OrchestrationSubscriptionResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'OrchestrationSubscriptionListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'OrchestrationSubscriptionResponseDTO'[0..*] { doc /* Source type: List<OrchestrationSubscriptionResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'OrchestrationSubscriptionQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'ownerSystems' : String[0..*] { doc /* Source type: Array<String>. Subscription owner names to match. */ }
        attribute 'targetSystems' : String[0..*] { doc /* Source type: Array<String>. Target system names. */ }
        attribute 'serviceDefinitions' : String[0..*] { doc /* Source type: Array<String>. Service definition names to match. */ }
    }
    item def 'OrchestrationSubscriptionQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'ownerSystems' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'targetSystems' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'serviceDefinitions' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'OrchestrationSubscriptionRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'targetSystemName' : String[0..1] { doc /* Source type: String. Consumer system; default the requester. */ }
        ref item 'orchestrationRequest' : 'OrchestrationRequest'[0..1] { doc /* Source type: OrchestrationRequest. The orchestration request executed for the subscription. */ }
        ref item 'notifyInterface' : 'OrchestrationNotifyInterface'[0..1] { doc /* Source type: OrchestrationNotifyInterface. Where and how the orchestration result is pushed to the target system. */ }
        attribute 'duration' : Real[0..1] { doc /* Source type: Number. Requested lifetime of the subscription in seconds; no value means unlimited. */ }
    }
    item def 'OrchestrationSubscriptionRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'targetSystemName' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'orchestrationRequest' : 'OrchestrationRequestDTO'[0..1] { doc /* Source type: OrchestrationRequestDTO.  */ }
        ref item 'notifyInterface' : 'OrchestrationNotifyInterfaceDTO'[0..1] { doc /* Source type: OrchestrationNotifyInterfaceDTO.  */ }
        attribute 'duration' : Integer[0..1] { doc /* Source type: Long.  */ }
    }
    item def 'OrchestrationSubscriptionResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String. Identifier (UUID) of the subscription. */ }
        attribute 'ownerSystemName' : String[0..1] { doc /* Source type: String. Name of the system that created the subscription. */ }
        attribute 'targetSystemName' : String[0..1] { doc /* Source type: String. Name of the consumer system the push orchestration is made for. */ }
        ref item 'orchestrationRequest' : 'OrchestrationRequest'[0..1] { doc /* Source type: OrchestrationRequest. The orchestration request executed for the subscription. */ }
        ref item 'notifyInterface' : 'OrchestrationNotifyInterface'[0..1] { doc /* Source type: OrchestrationNotifyInterface. Where and how the orchestration result is pushed to the target system. */ }
        ref item 'expiredAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time when the subscription expires. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
    }
    item def 'OrchestrationSubscriptionResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'id' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'ownerSystemName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetSystemName' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'orchestrationRequest' : 'OrchestrationRequestDTO'[0..1] { doc /* Source type: OrchestrationRequestDTO.  */ }
        ref item 'notifyInterface' : 'OrchestrationNotifyInterfaceDTO'[0..1] { doc /* Source type: OrchestrationNotifyInterfaceDTO.  */ }
        attribute 'expiredAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'Page' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'page' : Real[0..1] { doc /* Source type: Number. Zero-based page number. */ }
        attribute 'size' : Real[0..1] { doc /* Source type: Number. Number of records per page (at most max.page.size, default 1000). */ }
        attribute 'direction' : String[0..1] { doc /* Source type: String. Sort direction, ASC or DESC. */ }
        attribute 'sortField' : String[0..1] { doc /* Source type: String. Field to sort by. */ }
    }
    item def 'PageDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'page' : Integer[0..1] { doc /* Source type: Integer.  */ }
        attribute 'size' : Integer[0..1] { doc /* Source type: Integer.  */ }
        attribute 'direction' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'sortField' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'PriorityRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
    }
    item def 'QoSDeviceDataEvaluationConfigDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'metricNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'metricWeights' : Real[0..*] { doc /* Source type: List<Double>.  */ }
        attribute 'timeWindow' : Integer[0..1] { doc /* Source type: Integer.  */ }
        attribute 'threshold' : Real[0..1] { doc /* Source type: Double.  */ }
    }
    item def 'QoSDeviceStatQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'metricGroup' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'from' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'to' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'aggregation' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'systemNames' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'QoSDeviceStatQueryResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'records' : 'QoSDeviceStatRecordDTO'[0..*] { doc /* Source type: List<QoSDeviceStatRecordDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'QoSDeviceStatRecordDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'metricGroup' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'id' : Integer[0..1] { doc /* Source type: long.  */ }
        attribute 'timestamp' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'uuid' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'minimum' : Real[0..1] { doc /* Source type: Double.  */ }
        attribute 'maximum' : Real[0..1] { doc /* Source type: Double.  */ }
        attribute 'mean' : Real[0..1] { doc /* Source type: Double.  */ }
        attribute 'median' : Real[0..1] { doc /* Source type: Double.  */ }
        attribute 'current' : Real[0..1] { doc /* Source type: Double.  */ }
        attribute 'systems' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'QoSEvaluationFilterResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'passedProviders' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'droppedProviders' : String[0..*] { doc /* Source type: List<String>.  */ }
        ref item 'warnings' : JSONValue[0..1] { doc /* Source type: Map<String, List<String>>.  */ }
    }
    item def 'QoSEvaluationRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'providers' : String[0..*] { doc /* Source type: List<String>.  */ }
        ref item 'configuration' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
    }
    item def 'QoSEvaluationSortResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'sortedProviders' : String[0..*] { doc /* Source type: List<String>.  */ }
        ref item 'warnings' : JSONValue[0..1] { doc /* Source type: Map<String, List<String>>.  */ }
    }
    item def 'QoSRequirement' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'type' : String[0..1] { doc /* Source type: String. Type of the QoS evaluation, as known by DeviceQoSEvaluator. */ }
        attribute 'operation' : String[0..1] { doc /* Source type: String. QoS operation: FILTER or SORT. */ }
        ref item 'requirements' : JSONValue[0..1] { doc /* Source type: Object. Parameters of the QoS requirement. */ }
    }
    item def 'QoSRequirementDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'type' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'operation' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'requirements' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
    }
    item def 'Scored' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'candidate' : JSONValue[0..1] { doc /* Source type: OrchestrationCandidate. Java record component; ah5-core-java-spring/serviceorchestration-dynamic/src/main/java/eu/arrowhead/serviceorchestration/service/utils/matchmaker/DefaultServiceInstanceMatchmaker.java */ }
        attribute 'score' : Integer[0..1] { doc /* Source type: int. Java record component; ah5-core-java-spring/serviceorchestration-dynamic/src/main/java/eu/arrowhead/serviceorchestration/service/utils/matchmaker/DefaultServiceInstanceMatchmaker.java */ }
    }
    item def 'SelfContainedTokenPayload' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'provider' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/SelfContainedTokenPayload.java */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/SelfContainedTokenPayload.java */ }
        attribute 'cloud' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/SelfContainedTokenPayload.java */ }
        attribute 'targetType' : 'AuthorizationTargetType'[0..1] { doc /* Source type: AuthorizationTargetType. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/SelfContainedTokenPayload.java */ }
        attribute 'target' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/SelfContainedTokenPayload.java */ }
        attribute 'scope' : String[0..1] { doc /* Source type: String. Java record component; ah5-core-java-spring/consumer-authorization/src/main/java/eu/arrowhead/authorization/service/dto/SelfContainedTokenPayload.java */ }
    }
    item def 'ServiceDefinitionListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceDefinitionNames' : String[0..*] { doc /* Source type: Array<String>. Service definition names. */ }
    }
    item def 'ServiceDefinitionListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceDefinitionNames' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'ServiceDefinitionListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'ServiceDefinitionResponse'[0..*] { doc /* Source type: Array<ServiceDefinitionResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'ServiceDefinitionListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'ServiceDefinitionResponseDTO'[0..*] { doc /* Source type: List<ServiceDefinitionResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'ServiceDefinitionResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Service definition name. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
        ref item 'updatedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the last change. */ }
    }
    item def 'ServiceDefinitionResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'ServiceInstanceCreateListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'instances' : 'ServiceInstanceRequest'[0..*] { doc /* Source type: Array<ServiceInstanceRequest>. Service instances to create or update. */ }
    }
    item def 'ServiceInstanceCreateListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'instances' : 'ServiceInstanceRequestDTO'[0..*] { doc /* Source type: List<ServiceInstanceRequestDTO>.  */ }
    }
    item def 'ServiceInstanceCreateRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceDefinitionName' : String[0..1] { doc /* Source type: String. Service definition name, camelCase (e.g. temperatureReading). */ }
        ref item 'version' : JSONValue[0..1] { doc /* Source type: Version. Version of the service instance (default 1.0.0). */ }
        ref item 'expiresAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC expiry time; no value means no expiry. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. Free-form metadata (JSON object). */ }
        ref item 'interfaces' : 'ServiceInstanceInterfaceRequest'[0..*] { doc /* Source type: Array<ServiceInstanceInterfaceRequest>. Service interfaces offered by the instance. */ }
    }
    item def 'ServiceInstanceCreateRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceDefinitionName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'version' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expiresAt' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        ref item 'interfaces' : 'ServiceInstanceInterfaceRequestDTO'[0..*] { doc /* Source type: List<ServiceInstanceInterfaceRequestDTO>.  */ }
    }
    item def 'ServiceInstanceInterfaceRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'templateName' : String[0..1] { doc /* Source type: String. Name of the interface template, snake_case (e.g. generic_https). */ }
        attribute 'protocol' : String[0..1] { doc /* Source type: String. Protocol of the interface, e.g. http, https, mqtt, mqtts. */ }
        attribute 'policy' : String[0..1] { doc /* Source type: String. Security policy of the interface (NONE, CERT_AUTH, token policies). */ }
        ref item 'properties' : JSONValue[0..1] { doc /* Source type: Object. Interface properties defined by the template, e.g. accessAddresses, accessPort, basePath, operations. */ }
    }
    item def 'ServiceInstanceInterfaceRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'templateName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'protocol' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'policy' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'properties' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
    }
    item def 'ServiceInstanceInterfaceResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'templateName' : String[0..1] { doc /* Source type: String. Name of the interface template, snake_case (e.g. generic_https). */ }
        attribute 'protocol' : String[0..1] { doc /* Source type: String. Protocol of the interface, e.g. http, https, mqtt, mqtts. */ }
        attribute 'policy' : String[0..1] { doc /* Source type: String. Security policy of the interface: NONE, CERT_AUTH or one of the token policies. */ }
        ref item 'properties' : JSONValue[0..1] { doc /* Source type: Object. Interface properties defined by the template, e.g. accessAddresses, accessPort, basePath, operations. */ }
    }
    item def 'ServiceInstanceInterfaceResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'templateName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'protocol' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'policy' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'properties' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
    }
    item def 'ServiceInstanceListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'ServiceInstanceResponse'[0..*] { doc /* Source type: Array<ServiceInstanceResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'ServiceInstanceListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'ServiceInstanceResponseDTO'[0..*] { doc /* Source type: List<ServiceInstanceResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'ServiceInstanceLookupRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceIds' : String[0..*] { doc /* Source type: Array<String>. Instance identifiers to match. */ }
        attribute 'providerNames' : String[0..*] { doc /* Source type: Array<String>. Provider system names to match. */ }
        attribute 'serviceDefinitionNames' : String[0..*] { doc /* Source type: Array<String>. Service definition names. */ }
        ref item 'versions' : JSONValue[0..*] { doc /* Source type: Array<Version>. Service versions to match. */ }
        ref item 'alivesAt' : JSONValue[0..1] { doc /* Source type: DateTime. Only instances that are still registered (not expired) at this UTC time are matched. */ }
        ref item 'metadataRequirementsList' : 'MetadataRequirement'[0..*] { doc /* Source type: Array<MetadataRequirement>. Requirements on the service instance metadata; each map is one alternative. */ }
        attribute 'addressTypes' : String[0..*] { doc /* Source type: Array<String>. Address types the interfaces must offer (HOSTNAME, IPV4, IPV6, MAC). */ }
        attribute 'interfaceTemplateNames' : String[0..*] { doc /* Source type: Array<String>. Accepted interface templates, e.g. generic_https. */ }
        ref item 'interfacePropertyRequirementsList' : 'MetadataRequirement'[0..*] { doc /* Source type: Array<MetadataRequirement>. Requirements on the interface properties; each map is one alternative. */ }
        attribute 'policies' : String[0..*] { doc /* Source type: Array<String>. Interface security policies to match, e.g. CERT_AUTH. */ }
    }
    item def 'ServiceInstanceLookupRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceIds' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'providerNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'serviceDefinitionNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'versions' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'alivesAt' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadataRequirementsList' : JSONValue[0..*] { doc /* Source type: List<MetadataRequirementDTO>.  */ }
        attribute 'addressTypes' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'interfaceTemplateNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        ref item 'interfacePropertyRequirementsList' : JSONValue[0..*] { doc /* Source type: List<MetadataRequirementDTO>.  */ }
        attribute 'policies' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'ServiceInstanceQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'instanceIds' : String[0..*] { doc /* Source type: Array<String>. Instance identifiers to match. */ }
        attribute 'providerNames' : String[0..*] { doc /* Source type: Array<String>. Provider system names to match. */ }
        attribute 'serviceDefinitionNames' : String[0..*] { doc /* Source type: Array<String>. Service definition names. */ }
        ref item 'versions' : JSONValue[0..*] { doc /* Source type: Array<Version>. Service versions to match. */ }
        ref item 'alivesAt' : JSONValue[0..1] { doc /* Source type: DateTime. Only instances that are still registered (not expired) at this UTC time are matched. */ }
        ref item 'metadataRequirementsList' : 'MetadataRequirement'[0..*] { doc /* Source type: Array<MetadataRequirement>. Requirements on the service instance metadata; each map is one alternative. */ }
        attribute 'addressTypes' : String[0..*] { doc /* Source type: Array<String>. Address types the interfaces must offer (HOSTNAME, IPV4, IPV6, MAC). */ }
        attribute 'interfaceTemplateNames' : String[0..*] { doc /* Source type: Array<String>. Accepted interface templates, e.g. generic_https. */ }
        ref item 'interfacePropertyRequirementsList' : 'MetadataRequirement'[0..*] { doc /* Source type: Array<MetadataRequirement>. Requirements on the interface properties; each map is one alternative. */ }
        attribute 'policies' : String[0..*] { doc /* Source type: Array<String>. Interface security policies to match, e.g. CERT_AUTH. */ }
    }
    item def 'ServiceInstanceQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'instanceIds' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'providerNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'serviceDefinitionNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'versions' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'alivesAt' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadataRequirementsList' : JSONValue[0..*] { doc /* Source type: List<MetadataRequirementDTO>.  */ }
        attribute 'addressTypes' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'interfaceTemplateNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        ref item 'interfacePropertyRequirementsList' : JSONValue[0..*] { doc /* Source type: List<MetadataRequirementDTO>.  */ }
        attribute 'policies' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'ServiceInstanceRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String. Name of the provider system. */ }
        attribute 'serviceDefinitionName' : String[0..1] { doc /* Source type: String. Service definition name, camelCase (e.g. temperatureReading). */ }
        ref item 'version' : JSONValue[0..1] { doc /* Source type: Version. Version of the service instance (default 1.0.0). */ }
        ref item 'expiresAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC expiry time; no value means no expiry. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. Free-form metadata (JSON object). */ }
        ref item 'interfaces' : 'ServiceInstanceInterfaceRequest'[0..*] { doc /* Source type: Array<ServiceInstanceInterfaceRequest>. Service interfaces offered by the instance. */ }
    }
    item def 'ServiceInstanceRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'serviceDefinitionName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'version' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expiresAt' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        ref item 'interfaces' : 'ServiceInstanceInterfaceRequestDTO'[0..*] { doc /* Source type: List<ServiceInstanceInterfaceRequestDTO>.  */ }
    }
    item def 'ServiceInstanceResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceId' : String[0..1] { doc /* Source type: String. Service instance identifier \texttt{<System>\textbar{}<serviceDefinition>\textbar{}<version>}, or policy instance identifier. */ }
        ref item 'provider' : 'SystemResponse'[0..1] { doc /* Source type: SystemResponse. The provider system. */ }
        ref item 'serviceDefinition' : 'ServiceDefinitionResponse'[0..1] { doc /* Source type: ServiceDefinitionResponse. The service definition. */ }
        ref item 'version' : JSONValue[0..1] { doc /* Source type: Version. Version of the service instance. */ }
        ref item 'expiresAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC expiry time; no value means no expiry. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. Free-form metadata (JSON object). */ }
        ref item 'interfaces' : 'ServiceInstanceInterfaceResponse'[0..*] { doc /* Source type: Array<ServiceInstanceInterfaceResponse>. Service interfaces offered by the instance. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
        ref item 'updatedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the last change. */ }
    }
    item def 'ServiceInstanceResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceId' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'provider' : 'SystemResponseDTO'[0..1] { doc /* Source type: SystemResponseDTO.  */ }
        ref item 'serviceDefinition' : 'ServiceDefinitionResponseDTO'[0..1] { doc /* Source type: ServiceDefinitionResponseDTO.  */ }
        attribute 'version' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expiresAt' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        ref item 'interfaces' : 'ServiceInstanceInterfaceResponseDTO'[0..*] { doc /* Source type: List<ServiceInstanceInterfaceResponseDTO>.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'ServiceInstanceUpdateListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'instances' : 'ServiceInstanceUpdateRequest'[0..*] { doc /* Source type: Array<ServiceInstanceUpdateRequest>. Service instances to create or update. */ }
    }
    item def 'ServiceInstanceUpdateListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'instances' : 'ServiceInstanceUpdateRequestDTO'[0..*] { doc /* Source type: List<ServiceInstanceUpdateRequestDTO>.  */ }
    }
    item def 'ServiceInstanceUpdateRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceId' : String[0..1] { doc /* Source type: String. Instance to update. */ }
        ref item 'expiresAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC expiry time; no value means no expiry. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. Free-form metadata (JSON object). */ }
        ref item 'interfaces' : 'ServiceInstanceInterfaceRequest'[0..*] { doc /* Source type: Array<ServiceInstanceInterfaceRequest>. Service interfaces offered by the instance. */ }
    }
    item def 'ServiceInstanceUpdateRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'expiresAt' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        ref item 'interfaces' : 'ServiceInstanceInterfaceRequestDTO'[0..*] { doc /* Source type: List<ServiceInstanceInterfaceRequestDTO>.  */ }
    }
    item def 'ServiceInterfaceTemplateListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'interfaceTemplates' : 'ServiceInterfaceTemplateRequest'[0..*] { doc /* Source type: Array<ServiceInterfaceTemplateRequest>. Interface templates to create. */ }
    }
    item def 'ServiceInterfaceTemplateListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'interfaceTemplates' : 'ServiceInterfaceTemplateRequestDTO'[0..*] { doc /* Source type: List<ServiceInterfaceTemplateRequestDTO>.  */ }
    }
    item def 'ServiceInterfaceTemplateListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'ServiceInterfaceTemplateResponse'[0..*] { doc /* Source type: Array<ServiceInterfaceTemplateResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'ServiceInterfaceTemplateListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'ServiceInterfaceTemplateResponseDTO'[0..*] { doc /* Source type: List<ServiceInterfaceTemplateResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'ServiceInterfaceTemplateProperty' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Name of the interface property. */ }
        attribute 'mandatory' : Boolean[0..1] { doc /* Source type: Boolean. Whether the property must be present in every interface of this template. */ }
        attribute 'validator' : String[0..1] { doc /* Source type: String. Validator of the value, e.g. PORT, NOT_EMPTY_ADDRESS_LIST, HTTP_OPERATIONS. */ }
        attribute 'validatorParams' : String[0..*] { doc /* Source type: Array<String>. Parameters of the validator. */ }
    }
    item def 'ServiceInterfaceTemplatePropertyDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'mandatory' : Boolean[0..1] { doc /* Source type: boolean.  */ }
        attribute 'validator' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'validatorParams' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'ServiceInterfaceTemplateQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'templateNames' : String[0..*] { doc /* Source type: Array<String>. Interface template names to match. */ }
        attribute 'protocols' : String[0..*] { doc /* Source type: Array<String>. Protocols to match. */ }
    }
    item def 'ServiceInterfaceTemplateQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'templateNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'protocols' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'ServiceInterfaceTemplateRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Template name, snake_case. */ }
        attribute 'protocol' : String[0..1] { doc /* Source type: String. Protocol of interfaces of this template. */ }
        ref item 'propertyRequirements' : 'ServiceInterfaceTemplateProperty'[0..*] { doc /* Source type: Array<ServiceInterfaceTemplateProperty>. Property rules of the template. */ }
    }
    item def 'ServiceInterfaceTemplateRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'protocol' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'propertyRequirements' : 'ServiceInterfaceTemplatePropertyDTO'[0..*] { doc /* Source type: List<ServiceInterfaceTemplatePropertyDTO>.  */ }
    }
    item def 'ServiceInterfaceTemplateResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. Template name. */ }
        attribute 'protocol' : String[0..1] { doc /* Source type: String. Protocol of the interface, e.g. http, https, mqtt, mqtts. */ }
        ref item 'propertyRequirements' : 'ServiceInterfaceTemplateProperty'[0..*] { doc /* Source type: Array<ServiceInterfaceTemplateProperty>. Property rules of the template. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
        ref item 'updatedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the last change. */ }
    }
    item def 'ServiceInterfaceTemplateResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'protocol' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'propertyRequirements' : 'ServiceInterfaceTemplatePropertyDTO'[0..*] { doc /* Source type: List<ServiceInterfaceTemplatePropertyDTO>.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'SystemListRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'systems' : 'SystemRequest'[0..*] { doc /* Source type: Array<SystemRequest>. Systems to create or update. */ }
    }
    item def 'SystemListRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'systems' : 'SystemRequestDTO'[0..*] { doc /* Source type: List<SystemRequestDTO>.  */ }
    }
    item def 'SystemListResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'SystemResponse'[0..*] { doc /* Source type: Array<SystemResponse>. Matching records of the current page. */ }
        attribute 'count' : Real[0..1] { doc /* Source type: Number. Total number of matching records (all pages). */ }
    }
    item def 'SystemListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'SystemResponseDTO'[0..*] { doc /* Source type: List<SystemResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'SystemLookupRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemNames' : String[0..*] { doc /* Source type: Array<String>. System names to match. */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: Array<String>. Network addresses of the entity. */ }
        attribute 'addressType' : String[0..1] { doc /* Source type: String. Address type filter: HOSTNAME, IPV4, IPV6 or MAC. */ }
        ref item 'metadataRequirementList' : 'MetadataRequirement'[0..*] { doc /* Source type: Array<MetadataRequirement>. Metadata requirements; each map is one alternative. */ }
        ref item 'versions' : JSONValue[0..*] { doc /* Source type: Array<Version>. System versions to match. */ }
        attribute 'deviceNames' : String[0..*] { doc /* Source type: Array<String>. Device names to match. */ }
    }
    item def 'SystemLookupRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'systemNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'addressType' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadataRequirementList' : JSONValue[0..*] { doc /* Source type: List<MetadataRequirementDTO>.  */ }
        attribute 'versions' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'deviceNames' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'SystemQueryRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'Page'[0..1] { doc /* Source type: Page. Paging and sorting of the result. */ }
        attribute 'systemNames' : String[0..*] { doc /* Source type: Array<String>. System names to match. */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: Array<String>. Network addresses of the entity. */ }
        attribute 'addressType' : String[0..1] { doc /* Source type: String. Address type filter: HOSTNAME, IPV4, IPV6 or MAC. */ }
        ref item 'metadataRequirementList' : 'MetadataRequirement'[0..*] { doc /* Source type: Array<MetadataRequirement>. Metadata requirements; each map is one alternative. */ }
        ref item 'versions' : JSONValue[0..*] { doc /* Source type: Array<Version>. System versions to match. */ }
        attribute 'deviceNames' : String[0..*] { doc /* Source type: Array<String>. Device names to match. */ }
    }
    item def 'SystemQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'systemNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'addressType' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadataRequirementList' : JSONValue[0..*] { doc /* Source type: List<MetadataRequirementDTO>.  */ }
        attribute 'versions' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'deviceNames' : String[0..*] { doc /* Source type: List<String>.  */ }
    }
    item def 'SystemRegisterRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. Free-form metadata (JSON object). */ }
        ref item 'version' : JSONValue[0..1] { doc /* Source type: Version. Version of the system. */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: Array<String>. Network addresses of the entity. */ }
        attribute 'deviceName' : String[0..1] { doc /* Source type: String. Name of the device hosting the system. */ }
    }
    item def 'SystemRegisterRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        attribute 'version' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'deviceName' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'SystemRequest' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. System name, PascalCase. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. Free-form metadata (JSON object). */ }
        ref item 'version' : JSONValue[0..1] { doc /* Source type: Version. Version of the system. */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: Array<String>. Network addresses of the entity. */ }
        attribute 'deviceName' : String[0..1] { doc /* Source type: String. Name of the device hosting the system. */ }
    }
    item def 'SystemRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        attribute 'version' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'addresses' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'deviceName' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'SystemResponse' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String. System name. */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Object. Free-form metadata (JSON object). */ }
        ref item 'version' : JSONValue[0..1] { doc /* Source type: Version. Version of the system. */ }
        ref item 'addresses' : 'Address'[0..*] { doc /* Source type: Array<Address>. Network addresses with their types. */ }
        ref item 'device' : 'DeviceResponse'[0..1] { doc /* Source type: DeviceResponse. The device hosting the system, if registered. */ }
        ref item 'createdAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of creation. */ }
        ref item 'updatedAt' : JSONValue[0..1] { doc /* Source type: DateTime. UTC time of the last change. */ }
    }
    item def 'SystemResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'name' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'metadata' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        attribute 'version' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'addresses' : 'AddressDTO'[0..*] { doc /* Source type: List<AddressDTO>.  */ }
        ref item 'device' : 'DeviceResponseDTO'[0..1] { doc /* Source type: DeviceResponseDTO.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'TranslationAbortMgmtResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'results' : JSONValue[0..1] { doc /* Source type: Map<String, Boolean>.  */ }
    }
    item def 'TranslationBridgeCandidateDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'serviceInstanceId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'interfaceTemplateName' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'TranslationBridgeInitializationRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'bridgeId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'inputInterface' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'inputDataModelTranslator' : 'TranslationDataModelTranslationDataDescriptorDTO'[0..1] { doc /* Source type: TranslationDataModelTranslationDataDescriptorDTO.  */ }
        ref item 'resultDataModelTranslator' : 'TranslationDataModelTranslationDataDescriptorDTO'[0..1] { doc /* Source type: TranslationDataModelTranslationDataDescriptorDTO.  */ }
        attribute 'inputDataModelRequirement' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'resultDataModelRequirement' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetInterface' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'targetInterfaceProperties' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        attribute 'operation' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'authorizationToken' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'interfaceTranslatorSettings' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
    }
    item def 'TranslationCheckTargetsRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'targetOperation' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'targets' : 'TranslationTargetDTO'[0..*] { doc /* Source type: List<TranslationTargetDTO>.  */ }
    }
    item def 'TranslationCheckTargetsResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'targets' : 'TranslationTargetDTO'[0..*] { doc /* Source type: List<TranslationTargetDTO>.  */ }
    }
    item def 'TranslationDataModelTranslationDataDescriptorDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'fromModelId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'toModelId' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'interfaceProperties' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        ref item 'configurationSettings' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
    }
    item def 'TranslationDataModelTranslatorInitializationResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'dataModelTranslatorName' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'interfaceProperties' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
    }
    item def 'TranslationDiscoveryMgmtRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'candidates' : 'ServiceInstanceResponseDTO'[0..*] { doc /* Source type: List<ServiceInstanceResponseDTO>.  */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'operation' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'interfaceTemplateNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'inputDataModelId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'outputDataModelId' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'flags' : JSONValue[0..1] { doc /* Source type: Map<String, Boolean>.  */ }
    }
    item def 'TranslationDiscoveryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'candidates' : 'ServiceInstanceResponseDTO'[0..*] { doc /* Source type: List<ServiceInstanceResponseDTO>.  */ }
        attribute 'operation' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'interfaceTemplateNames' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'inputDataModelId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'outputDataModelId' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'TranslationDiscoveryResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'bridgeId' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'candidates' : 'TranslationBridgeCandidateDTO'[0..*] { doc /* Source type: List<TranslationBridgeCandidateDTO>.  */ }
    }
    item def 'TranslationInterfaceTranslationDataDescriptorDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'fromInterfaceTemplate' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'toInterfaceTemplate' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'token' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'interfaceProperties' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
        ref item 'configurationSettings' : JSONValue[0..1] { doc /* Source type: Map<String, Object>.  */ }
    }
    item def 'TranslationNegotiationMgmtRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'bridgeId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'targetInstanceId' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'TranslationNegotiationRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'bridgeId' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'target' : 'ServiceInstanceResponseDTO'[0..1] { doc /* Source type: ServiceInstanceResponseDTO.  */ }
        attribute 'operation' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'interfaceTemplateName' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'inputDataModelId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'outputDataModelId' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'TranslationNegotiationResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'bridgeId' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'bridgeInterface' : 'ServiceInstanceInterfaceResponseDTO'[0..1] { doc /* Source type: ServiceInstanceInterfaceResponseDTO.  */ }
        attribute 'tokenExpiresAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'tokenUsageLimit' : Integer[0..1] { doc /* Source type: Integer.  */ }
    }
    item def 'TranslationQueryListResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'entries' : 'TranslationQueryResponseDTO'[0..*] { doc /* Source type: List<TranslationQueryResponseDTO>.  */ }
        attribute 'count' : Integer[0..1] { doc /* Source type: long.  */ }
    }
    item def 'TranslationQueryRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        ref item 'pagination' : 'PageDTO'[0..1] { doc /* Source type: PageDTO.  */ }
        attribute 'bridgeIds' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'creators' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'statuses' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'consumers' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'providers' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'serviceDefinitions' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'interfaceTranslators' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'dataModelTranslators' : String[0..*] { doc /* Source type: List<String>.  */ }
        attribute 'creationFrom' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'creationTo' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'alivesFrom' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'alivesTo' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'minUsage' : Integer[0..1] { doc /* Source type: Integer.  */ }
        attribute 'maxUsage' : Integer[0..1] { doc /* Source type: Integer.  */ }
    }
    item def 'TranslationQueryResponseDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'bridgeId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'status' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'usageReportCount' : Integer[0..1] { doc /* Source type: int.  */ }
        attribute 'alivesAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'message' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'consumer' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'provider' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'serviceDefinition' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'operation' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'interfaceTranslator' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'interfaceTranslatorData' : 'TranslationInterfaceTranslationDataDescriptorDTO'[0..1] { doc /* Source type: TranslationInterfaceTranslationDataDescriptorDTO.  */ }
        attribute 'inputDataModelTranslator' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'inputDataModelTranslatorData' : 'TranslationDataModelTranslationDataDescriptorDTO'[0..1] { doc /* Source type: TranslationDataModelTranslationDataDescriptorDTO.  */ }
        attribute 'outputDataModelTranslator' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'outputDataModelTranslatorData' : 'TranslationDataModelTranslationDataDescriptorDTO'[0..1] { doc /* Source type: TranslationDataModelTranslationDataDescriptorDTO.  */ }
        attribute 'createdBy' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'createdAt' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'updatedAt' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'TranslationReportRequestDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'bridgeId' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'timestamp' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'state' : String[0..1] { doc /* Source type: String.  */ }
        attribute 'errorMessage' : String[0..1] { doc /* Source type: String.  */ }
    }
    item def 'TranslationTargetDTO' :> JSONMessage {
        doc /* Source: Java shared DTO sources and all five core v5.3.0 IDD schema catalogues. Field cardinalities are unspecified by this extraction; [0..1] is deliberately permissive. */
        attribute 'instanceId' : String[0..1] { doc /* Source type: String.  */ }
        ref item 'interfaces' : 'ServiceInstanceInterfaceResponseDTO'[0..*] { doc /* Source type: List<ServiceInstanceInterfaceResponseDTO>.  */ }
    }
}
