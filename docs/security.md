# Security

This public preview has a minimal security surface.

## Current surface

- no backend
- no account system
- no network calls
- no secrets
- no third-party SDKs
- no raw health/sensor persistence

## Guardrails

- privacy expectations are represented as code, not just documentation
- tests fail if the public policy permits network, account, raw sensor storage, or health export
- future integrations should go through explicit permission and review boundaries

## Reporting

For now, open a GitHub issue for non-sensitive concerns. Do not include private health data, credentials, or device logs containing personal information.
