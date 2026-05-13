# Privacy

HeartSync is designed around local-first measured calm.

## Public sample defaults

The sample core model assumes:

- no network access
- no account creation
- no raw sensor sample storage
- no health-data export
- no third-party analytics

These constraints are represented in code by `PrivacyGuardrails.publicSample` and covered by tests.

## Future production principles

If future versions use camera, Watch, or HealthKit data:

- request permissions only at the moment of use
- explain why each permission is needed
- avoid storing raw physiological samples unless explicitly required
- prefer derived, minimal session summaries
- keep data on device by default
- never sell or share health-adjacent data

## Medical disclaimer

HeartSync is not a medical device. It does not diagnose, treat, prevent, or cure any condition. It is an experimental measured-calm interface.
