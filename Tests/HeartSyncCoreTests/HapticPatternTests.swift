import XCTest
@testable import HeartSyncCore

final class HapticPatternTests: XCTestCase {
    func testHeartbeatStylePatternUsesDoublePulse() {
        let pattern = HapticPattern.heartbeatStyle(bpm: 60)
        XCTAssertEqual(pattern.pulses.count, 2)
        XCTAssertEqual(pattern.pulses[0].relativeTime, 0.0, accuracy: 0.0001)
        XCTAssertEqual(pattern.pulses[1].relativeTime, 0.105, accuracy: 0.0001)
        XCTAssertEqual(pattern.cycleDuration, 1.0, accuracy: 0.0001)
    }

    func testIntensityScaleIsClamped() {
        XCTAssertEqual(HapticPattern.heartbeatStyle(bpm: 60, intensityScale: 2).pulses[0].intensity, 1.0)
        XCTAssertEqual(HapticPattern.heartbeatStyle(bpm: 60, intensityScale: -1).pulses[0].intensity, 0.0)
    }
}
