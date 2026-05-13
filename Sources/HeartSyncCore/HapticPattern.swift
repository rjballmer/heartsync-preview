import Foundation

public struct HapticPulse: Sendable, Equatable {
    public let relativeTime: TimeInterval
    public let intensity: Double
    public let sharpness: Double

    public init(relativeTime: TimeInterval, intensity: Double, sharpness: Double) {
        precondition(relativeTime >= 0, "Relative time cannot be negative")
        precondition((0...1).contains(intensity), "Intensity must be 0...1")
        precondition((0...1).contains(sharpness), "Sharpness must be 0...1")
        self.relativeTime = relativeTime
        self.intensity = intensity
        self.sharpness = sharpness
    }
}

public struct HapticPattern: Sendable, Equatable {
    public let bpm: Double
    public let pulses: [HapticPulse]

    public var cycleDuration: TimeInterval {
        60.0 / bpm
    }

    public init(bpm: Double, pulses: [HapticPulse]) {
        precondition((40...100).contains(bpm), "Public sample supports 40...100 BPM")
        precondition(!pulses.isEmpty, "Haptic pattern must include at least one pulse")
        self.bpm = bpm
        self.pulses = pulses
    }

    /// Public-safe heartbeat-style cue: a deterministic double pulse.
    /// This does not include live physiological adaptation or proprietary closed-loop logic.
    public static func heartbeatStyle(bpm: Double, intensityScale: Double = 1.0) -> HapticPattern {
        let clampedScale = min(max(intensityScale, 0), 1)
        return HapticPattern(
            bpm: bpm,
            pulses: [
                HapticPulse(relativeTime: 0.0, intensity: 1.0 * clampedScale, sharpness: 0.8),
                HapticPulse(relativeTime: 0.105, intensity: 0.55 * clampedScale, sharpness: 0.45)
            ]
        )
    }
}
