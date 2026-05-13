# Architecture

HeartSync's public sample is intentionally narrow. It models the foundation of a haptic breathing session without exposing the more sensitive closed-loop physiology work.

## Layers

```text
BreathingPattern      cadence and phase timing
HapticPattern         public-safe pulse specification
SessionStateMachine   explicit session lifecycle
PrivacyGuardrails     local-only product constraints
```

## Why separate pure core models?

The production app may use SwiftUI, Core Haptics, camera sensors, HealthKit, or watchOS. Those are platform concerns. The public sample keeps the first version testable without requiring device hardware.

## Public vs private boundary

Public:

- timing models
- deterministic haptic pattern specifications
- state transitions
- privacy constraints

Private for now:

- live sensing
- adaptive haptics
- coherence visualizations
- proprietary closed-loop algorithms
