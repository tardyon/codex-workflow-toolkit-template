---
name: suggest-project-versioning
description: Assess whether a project should use Git and propose a proportionate versioning plan without automatically creating repositories or commits. Use when the user asks about Git, version control, repositories, remotes, checkpoints, rollback, or project archiving; when beginning or materially expanding a durable code, configuration, documentation, automation, skill, or toolkit project that is not version-controlled; or when an existing repository needs a sensible commit/checkpoint policy. Never initialize a repository, create a remote, commit, tag, push, mirror, or change Git configuration without explicit user authorization for that action.
---

# Suggest Project Versioning

Evaluate first; suggest only when version control provides durable value. Treat Git as source history, not as automatic backup for every file change or as storage for large archives.

## Decision workflow

1. Check whether the exact project root is already inside a Git worktree. Do not assume the workspace root and project root are the same.
2. Inspect only enough names, types, sizes, and existing policy files to classify the project. Do not read credentials or unrelated private content.
3. Recommend one outcome:
   - **Use Git now:** durable source/configuration/docs, recurring multi-session work, reusable automation, a skill/toolkit, or work where rollback and reviewed milestones matter.
   - **Use a scoped source repository:** a mixed project containing valuable source plus large media, archives, models, generated data, or runtime state. Track only the reproducible source layer.
   - **Defer:** an unsettled experiment whose structure is still changing substantially.
   - **Do not use Git:** disposable scratch work, generated exports, recovery evidence, bulk media, datasets, caches, or a directory that is primarily runtime state.
4. Present the recommendation, proposed root, included material, exclusions, checkpoint cadence, and suitable remote choices.
5. Ask for explicit authorization before initializing a repository or performing any Git mutation. A recommendation is not authorization.

## Repository and commit guardrails

- Never initialize a repository merely because a project directory exists.
- Never create a remote, GitHub repository, Forgejo repository, mirror, branch, tag, commit, or push unless the user explicitly requests that operation or an existing project policy clearly authorizes it.
- Do not commit every save or tiny edit. Group related changes into coherent, human-readable checkpoints after relevant verification passes.
- Good checkpoints include a completed feature or repair, a verified workflow milestone, an intentional policy/configuration change, a release, or a user-approved pre-risk checkpoint before a substantial refactor.
- Avoid checkpoint commits for formatting noise, transient debugging, generated artifacts, unchanged inventories, or incomplete edits that cannot be explained coherently.
- Do not rewrite, squash, amend, force-push, or delete existing history without explicit authorization.
- Do not repeatedly suggest Git after the user declines during the same task unless the project changes materially.

## Existing tracked secrets or runtime state

Adding an ignore rule does not remove a file that is already tracked or erase it from history. If sensitive material, credentials, private keys, live databases, or oversized unintended data may already be tracked:

- stop broad staging and do not print secret values;
- determine whether the material is only untracked, currently indexed, committed, pushed, or present in older history;
- recommend rotation or revocation for exposed credentials before treating repository cleanup as sufficient;
- separate ordinary ignore/untracking work from history rewriting or remote cleanup;
- require explicit authorization before untracking files, rewriting or purging history, force-pushing, deleting remote references, or rotating credentials.

## Scope and storage policy

Track source code, scripts, tests, schemas, skill definitions, sanitized configuration examples, documentation, manifests describing reproducible inputs, and small assets required to build or operate the project.

Exclude secrets, credentials, SSH keys, cookies, tokens, `.env` files, virtual environments, dependency caches, build products, logs, temporary files, runtime databases, indexes, machine snapshots, downloaded models, archives, recovery images, bulk media, and generated datasets. Read [default-ignore-patterns.md](references/default-ignore-patterns.md) when drafting or auditing ignore rules.

Do not introduce Git LFS automatically. Propose it only for deliberately versioned binary assets with a clear storage budget and remote support. Prefer NAS datasets, ZFS snapshots, ordinary backups, artifact storage, or rebuild instructions for large changing content.

When a large archive contains only a few durable helper scripts, normally propose a separate small sibling source repository rather than placing `.git` at the archive root. Document how the source relates to the archive without tracking the archive itself.

## Remote recommendation

Separate local version history from independent backup:

- **NAS Forgejo:** private LAN-first canonical hosting and local control; requires service maintenance, quotas, snapshots, exports, and independent backup.
- **GitHub private:** simple off-site availability and collaboration; requires an explicit privacy decision and repository-size discipline.
- **Hybrid:** private NAS canonical remote with selected approved repositories mirrored off-site, or GitHub canonical with a NAS mirror. Recommend this when both local control and independent protection matter.
- **No remote yet:** valid for an early local repository, but state plainly that it is not independently protected.

Never transmit source to any remote until the user approves the exact repository and destination.

## Required response

Return:

1. `Recommendation`: use now, scoped repository, defer, or do not use.
2. `Reason`: concise evidence from the project shape.
3. `Proposed root and contents`.
4. `Required exclusions`, including any sensitive or oversized categories observed.
5. `Checkpoint policy`: meaningful milestone examples for this project.
6. `Remote options`: NAS, GitHub, hybrid, or none, with the relevant tradeoff.
7. `Approval gate`: the exact next Git operation that requires authorization.

If the user authorizes implementation, re-identify the exact project root, inspect existing state, create or update ignore rules before staging, show the proposed initial scope, and verify that no secrets or oversized unintended files are included. A successful repository setup still requires a separate decision before creating or pushing to a remote.
