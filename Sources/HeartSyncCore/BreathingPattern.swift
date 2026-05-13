import Foundation

public enum BreathPhase: String, Sendable, Equatable, CaseIterable {
    case inhale
    case hold
    case exhale
}

public struct BreathStep: Sendable, Equatable {
    public let phase: BreathPhase
    public let duration: TimeInterval

    public init(phase: BreathPhase, duration: TimeInterval) {
        precondition(duration > 0, "Breath step duration must be positive")
        self.phase = phase
        self.duration = duration
    }
}

public struct BreathingPattern: Sendable, Equatable {
    public let name: String
    public let steps: [BreathStep]

    public init(name: String, steps: [BreathStep]) {
        precondition(!steps.isEmpty, "Breathing pattern must include at least one step")
        self.name = name
        self.steps = steps
    }

    public var cycleDuration: TimeInterval {
        steps.reduce(0) { $0 + $1.duration }
    }

    public var breathsPerMinute: Double {
        60.0 / cycleDuration
    }

    public func phase(at elapsed: TimeInterval) -> BreathStep {
        let normalized = elapsed.truncatingRemainder(dividingBy: cycleDuration)
        var cursor: TimeInterval = 0
        for step in steps {
            cursor += step.duration
            if normalized < cursor { return step }
        }
        return steps[steps.count - 1]
    }

    /// Resonance-style 6 breaths/minute pattern used in the public sample.
    /// This is intentionally simple and non-clinical: a tactile pacing primitive, not a treatment claim.
    public static let measuredCalm = BreathingPattern(
        name: "Measured Calm",
        steps: [
            BreathStep(phase: .inhale, duration: 5.0),
            BreathStep(phase: .hold, duration: 0.5),
            BreathStep(phase: .exhale, duration: 4.5)
        ]
    )
}
