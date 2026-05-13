import Foundation

public enum SessionState: Sendable, Equatable {
    case idle
    case preparing
    case running(startedAt: Date)
    case paused(elapsed: TimeInterval)
    case completed(duration: TimeInterval)
    case cancelled(elapsed: TimeInterval)
}

public enum SessionEvent: Sendable, Equatable {
    case prepare
    case start(Date)
    case pause(TimeInterval)
    case resume(Date)
    case complete(TimeInterval)
    case cancel(TimeInterval)
    case reset
}

public enum SessionTransitionError: Error, Equatable {
    case invalidTransition(from: SessionState, event: SessionEvent)
}

public struct SessionStateMachine: Sendable {
    public private(set) var state: SessionState = .idle

    public init() {}

    public mutating func apply(_ event: SessionEvent) throws {
        switch (state, event) {
        case (.idle, .prepare):
            state = .preparing
        case (.idle, .start(let date)), (.preparing, .start(let date)):
            state = .running(startedAt: date)
        case (.running, .pause(let elapsed)):
            state = .paused(elapsed: elapsed)
        case (.paused, .resume(let date)):
            state = .running(startedAt: date)
        case (.running, .complete(let duration)), (.paused, .complete(let duration)):
            state = .completed(duration: duration)
        case (.running, .cancel(let elapsed)), (.paused, .cancel(let elapsed)), (.preparing, .cancel(let elapsed)):
            state = .cancelled(elapsed: elapsed)
        case (_, .reset):
            state = .idle
        default:
            throw SessionTransitionError.invalidTransition(from: state, event: event)
        }
    }
}
