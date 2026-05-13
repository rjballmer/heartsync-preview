import XCTest
@testable import HeartSyncCore

final class BreathingPatternTests: XCTestCase {
    func testMeasuredCalmIsSixBreathsPerMinute() {
        XCTAssertEqual(BreathingPattern.measuredCalm.cycleDuration, 10.0, accuracy: 0.0001)
        XCTAssertEqual(BreathingPattern.measuredCalm.breathsPerMinute, 6.0, accuracy: 0.0001)
    }

    func testMeasuredCalmPhaseLookup() {
        let pattern = BreathingPattern.measuredCalm
        XCTAssertEqual(pattern.phase(at: 0).phase, .inhale)
        XCTAssertEqual(pattern.phase(at: 5.1).phase, .hold)
        XCTAssertEqual(pattern.phase(at: 5.6).phase, .exhale)
        XCTAssertEqual(pattern.phase(at: 10.1).phase, .inhale)
    }
}
