# Portable Codex Toolkit Best Practices

## Purpose

A good Codex toolkit makes recurring work safer, faster, cheaper, and easier to reproduce. It is a small source-controlled layer of policy, reusable skills, validated helpers, templates, and documentation. It is not a clone of a user's private machine and it is not a dumping ground for every script or conversation.

## The four-layer model

1. **Policy:** `AGENTS.md` defines model routing, delegation, escalation, verification, and safety boundaries.
2. **Skills:** focused workflows with clear triggers, complete instructions, reusable resources, validation, and explicit side effects.
3. **Tools and MCPs:** commands and service connections that provide capabilities. Version sanitized schemas and setup instructions, never live credentials or private endpoints.
4. **Source and releases:** Git records meaningful source milestones; tested release packages deploy or roll back installed state.

## Model and agent efficiency

- Start with the least expensive model that safely fits the bounded task.
- Use each tier to its practical maximum, but escalate when context, ambiguity, coupling, consequence, or verification exceeds that tier.
- Retry only according to a defined transient-capacity policy; do not burn repeated attempts on an unavailable model.
- Checkpoint objective, exact state, evidence, remaining work, and mutation boundaries before handing off.
- Parallelize independent collection, research, and tests. Keep destructive decisions and overlapping writes serial.
- The primary agent integrates results and verifies important current-state claims.

## Skill design

Create a skill when a workflow is stable, specialized, recurring, and benefits from packaged instructions or resources.

Every skill should have:

- a precise trigger-rich description;
- one clear objective and completion condition;
- instructions that distinguish read-only work from mutations;
- references/scripts/templates only when they reduce ambiguity or repetition;
- deterministic or representative validation;
- declared side effects and exact authorization gates;
- no credentials, private contact data, volatile UI choreography, or unverified destructive procedures.

Prefer improving an existing skill over creating an overlapping one. Do not turn one-off experiments into permanent global behavior.

## Git discipline

Use Git for durable source, policy, documentation, tests, schemas, and sanitized configuration examples.

Do not use ordinary Git for:

- credentials, keys, cookies, tokens, or private machine profiles;
- virtual environments, dependencies, caches, logs, and temporary state;
- live databases, indexes, embeddings, models, backups, disk images, or recovery evidence;
- bulk media, scraped archives, datasets, and generated exports.

Commit coherent verified milestones—not every save. Examples include a completed feature, a tested repair, an approved policy change, or a release. Review staged names and sizes before the first commit. Creating a local repository, remote, commit, tag, push, or mirror should be an explicit decision rather than a hidden side effect.

## Canonical source and deployment

Keep one canonical source tree separate from active `~/.codex` runtime copies.

A safe deployment:

1. builds from a clean tagged commit;
2. scans for secrets and unintended large files;
3. stages outside active paths;
4. validates skills and runs bounded tests;
5. preserves the exact previous installed files;
6. installs only approved components;
7. performs representative discovery and behavior tests;
8. records commit, hashes, host, date, paths, and results;
9. retains a verified rollback package.

Git restores source history. A release package and deployment manifest restore installed state.

## Portability

A portable starter must be generic and adaptation-oriented. It should include:

- a policy template;
- setup and security checklists;
- generic reusable skills;
- a manifest with toolkit version and source commit;
- clear statements about what is intentionally absent.

On the target machine, first inventory the available Codex surface, models, skills, plugins, MCPs, paths, operating system, and security constraints. Adapt templates rather than blindly overwriting local configuration. Validate every installed component with a safe representative case.

## Hosting

- **NAS Forgejo:** private and LAN-first, but requires quotas, snapshots, database/repository exports, maintenance, and an independent restore path.
- **GitHub private:** simple independent hosting and collaboration, but requires explicit privacy and size decisions.
- **Hybrid:** NAS as private canonical plus selective approved off-site mirrors. This usually provides the best balance of local control and independent protection.

Git hosting is not a full backup. Protect the host configuration, repositories, database, and release artifacts, and test a restore.

## Human-readable control panel

Maintain one catalog that links to:

- current version and canonical source;
- active and version-controlled `AGENTS.md`;
- personal skills and their source;
- model routing;
- MCPs and plugins by name and role, without secrets;
- release history, manifests, remote repository, and rollback instructions.

Place small launcher documents in convenient locations that point to the canonical catalog. Avoid maintaining several full copies that drift.

## Privacy and security

- Keep private identity/contact profiles local and outside Git.
- Do not transmit phone numbers, addresses, credentials, or private data without task-specific permission.
- Never export live MCP command lines, environment variables, tokens, cookies, or Keychain material.
- Use least-privilege service accounts and keep live databases off SMB.
- Re-identify exact targets immediately before consequential actions.

## Maintenance cadence

Periodically:

- audit model assumptions and stale routing rules;
- validate skills and remove obsolete overlaps;
- inspect plugins and MCPs for continued need;
- review repository growth and large objects;
- update links and manifests;
- build a fresh portable package;
- test rollback and one representative restore.

The measure of success is not how much material the toolkit contains. It is whether a new or repaired Codex installation can recover the intended behavior predictably, safely, and with minimal reinvention.
