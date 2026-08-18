# Toolkit Catalog

## Current source

- Template version: `0.1.0`
- Policy template: [`portable/AGENTS.template.md`](portable/AGENTS.template.md)
- Setup checklist: [`portable/CODEX_SETUP_CHECKLIST.md`](portable/CODEX_SETUP_CHECKLIST.md)
- Best practices: [`portable/CODEX_TOOLKIT_BEST_PRACTICES.md`](portable/CODEX_TOOLKIT_BEST_PRACTICES.md)

## Example skills

| Skill | Purpose |
|---|---|
| [`maintain-codex-toolkit`](skills/maintain-codex-toolkit/SKILL.md) | Capture reusable improvements through review branches and verified releases. |
| [`suggest-project-versioning`](skills/suggest-project-versioning/SKILL.md) | Decide when and how Git adds durable value. |
| [`reliable-browser-publishing`](skills/reliable-browser-publishing/SKILL.md) | Publish authorized browser actions exactly once and verify the live result. |

## Helpers

- [`verify-toolkit.sh`](scripts/verify-toolkit.sh): structure, skill, secret-pattern, size, symlink, shell, and Git checks.
- [`build-portable-zip.sh`](scripts/build-portable-zip.sh): generic transport package.
- [`context.sh`](scripts/context.sh): reports installed toolkit provenance when a target installation provides state.

## Release and rollback

See [`docs/DEPLOYMENT.md`](docs/DEPLOYMENT.md) and [`docs/SAFETY_AND_ROLLBACK.md`](docs/SAFETY_AND_ROLLBACK.md).
