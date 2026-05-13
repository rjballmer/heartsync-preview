import XCTest
@testable import HeartSyncCore

final class PrivacyGuardrailsTests: XCTestCase {
    func testPublicSamplePolicyDefaultsToLocalOnly() {
        let policy = PrivacyGuardrails.publicSample
        XCTAssertTrue(policy.passesPublicSamplePolicy)
        XCTAssertFalse(policy.networkEnabled)
        XCTAssertFalse(policy.storesRawSensorSamples)
        XCTAssertFalse(policy.exportsHealthData)
        XCTAssertFalse(policy.requiresAccount)
    }

    func testNetworkBreaksPublicSamplePolicy() {
        let policy = PrivacyGuardrails(networkEnabled: true)
        XCTAssertFalse(policy.passesPublicSamplePolicy)
    }
}
