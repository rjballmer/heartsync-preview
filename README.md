# HeartSync Preview

**HeartSync is a privacy-first, measured-calm experiment: tactile breathing rhythms, body-aware feedback, and simple sessions for measuring and shaping your state.**

This public repo is a deliberately limited technical preview. It contains the safe foundation: breathing timing, haptic pattern specifications, session state, and privacy guardrails. More advanced closed-loop physiological feedback work is intentionally not included here.

## Why this exists

Breathwork can feel abstract. HeartSync experiments with making calm more embodied and repeatable through tactile rhythm: a quiet haptic pulse, a slow breathing cadence, and a session model that avoids scores, feeds, or performative wellness language.

This is not a medical device, diagnostic tool, or treatment app.

## Public sample scope

Included:

- resonance-style breathing timing model
- heartbeat-style haptic pattern specification
- session state machine
- local-only privacy guardrail model
- unit tests for timing, state transitions, haptic boundaries, and privacy defaults

Not included:

- live physiological adaptation
- camera PPG implementation
- Apple Watch / HealthKit integration
- coherence visualization
- proprietary closed-loop haptic algorithms
- health claims or medical interpretation

## Core principle

> Calm should feel measurable without becoming scorekeeping.

## Development maturity

The public sample is small on purpose, but it is built like product code:

- pure Swift core models
- unit-tested timing and state transitions
- explicit privacy defaults
- no network access in the public sample
- no account model
- no raw sensor persistence
- CI test workflow
- privacy and security docs

## Quick start

```bash
swift test
```

## Repository structure

```text
Sources/HeartSyncCore/      Core timing, haptic, session, and privacy models
Tests/HeartSyncCoreTests/   Unit tests
docs/                       Architecture, privacy, security, and roadmap notes
```

## License

Source-available preview. See [`LICENSE`](LICENSE).
