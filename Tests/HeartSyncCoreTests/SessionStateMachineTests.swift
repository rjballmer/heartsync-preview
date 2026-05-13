import XCTest
@testable import HeartSyncCore

final class SessionStateMachineTests: XCTestCase {
    func testHappyPathTransitions() throws {
        var machine = SessionStateMachine()
        let start = Date(timeIntervalSince1970: 100)
        try machine.apply(.prepare)
        XCTAssertEqual(machine.state, .preparing)
        try machine.apply(.start(start))
        XCTAssertEqual(machine.state, .running(startedAt: start))
        try machine.apply(.complete(300))
        XCTAssertEqual(machine.state, .completed(duration: 300))
        try machine.apply(.reset)
        XCTAssertEqual(machine.state, .idle)
    }

    func testInvalidTransitionThrows() {
        var machine = SessionStateMachine()
        XCTAssertThrowsError(try machine.apply(.pause(10)))
    }
}
