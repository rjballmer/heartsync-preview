import Foundation

public struct PrivacyGuardrails: Sendable, Equatable {
    public let networkEnabled: Bool
    public let storesRawSensorSamples: Bool
    public let exportsHealthData: Bool
    public let requiresAccount: Bool

    public init(
        networkEnabled: Bool = false,
        storesRawSensorSamples: Bool = false,
        exportsHealthData: Bool = false,
        requiresAccount: Bool = false
    ) {
        self.networkEnabled = networkEnabled
        self.storesRawSensorSamples = storesRawSensorSamples
        self.exportsHealthData = exportsHealthData
        self.requiresAccount = requiresAccount
    }

    public static let publicSample = PrivacyGuardrails()

    public var passesPublicSamplePolicy: Bool {
        !networkEnabled && !storesRawSensorSamples && !exportsHealthData && !requiresAccount
    }
}
