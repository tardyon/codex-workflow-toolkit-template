---
name: maintain-codex-toolkit
description: Capture, validate, version, distribute, install, update, or roll back reusable Codex policies and skills through a canonical toolkit repository. Use when a stable workflow yields a reusable improvement; when AGENTS.md, a skill, toolkit helper, manifest, release, or cross-machine deployment changes; or when Codex reports toolkit drift or stale task context.
---

# Maintain Codex Toolkit

Preserve stable workflow improvements without allowing a workflow to silently rewrite and activate its own controlling instructions.

## Locate source and installed state

Use a local state file such as `${CODEX_HOME:-$HOME/.codex}/toolkit-state.json` when the installation provides one. Its source path must point to a normal development checkout, not an immutable installed release.

Read the repository policy, manifest, and changed component before editing. Load only the references necessary for the task.

## Promote a reusable improvement

1. Confirm the behavior is stable, recurring, specialized, and supported by a deterministic or representative verification case.
2. Identify the smallest policy, skill, script, reference, or manifest target. Never copy an entire project, transcript, browser profile, runtime directory, or archive.
3. Fetch the canonical origin and create an `improvement/*` branch from fresh protected `main`. Preserve unrelated work and use a separate worktree when necessary.
4. Keep the main skill concise; move optional detail into directly linked references.
5. Run component tests, the skill validator, repository verification, and `git diff --check`.
6. Inspect every changed path and the complete diff for private data, secrets, machine paths, unrelated edits, and accidental binaries.
7. Commit and push one meaningful review checkpoint.
8. Report branch, commit, checks, privacy classification, and the exact merge/release/activation gate.

Do not self-merge, self-tag, force-push, rewrite history, or activate the proposal as a hidden side effect.

## Release and deployment

Release only from reviewed protected `main`. Build from the exact clean commit, sign releases when the environment supports verified signing, stage outside active paths, validate, preserve the preceding release, and activate reversibly.

Changed global policy is reliably discovered by new tasks. A continuing task may refresh relevant global files while preserving its work, but must label the context load state honestly.

Read [promotion-and-release.md](references/promotion-and-release.md) when creating a release, changing deployment behavior, configuring a remote, or handling rollback.

## Absolute exclusions

Never add credentials, keys, tokens, cookies, browser profiles, authentication state, private contact data, private endpoints, machine-specific paths, live databases, indexes, logs, models, archives, recovery material, or bulk media.
