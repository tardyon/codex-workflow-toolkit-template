# Architecture and Hosting

Keep three layers separate:

1. **Source repository:** reviewed policy, skills, tests, docs, and sanitized examples.
2. **Immutable releases:** verified packages built from clean, tagged commits.
3. **Active installation:** the release currently discovered by Codex.

This prevents an active workflow from silently rewriting its own controlling instructions and makes rollback deterministic.

## Hosting choices

| Choice | Strength | Responsibility |
|---|---|---|
| Local Git only | Simple and private | No independent copy unless separately backed up |
| Private Git host | Collaboration and off-machine availability | Access control, quotas, backups, restore tests |
| Self-hosted Git | Local control | Service maintenance, snapshots, exports, and off-site protection |
| Hybrid | Local control plus independent copy | Explicit mirror scope and secret-free repository boundaries |

Do not mirror selected folders out of a repository that also contains private material. Put shareable components in a separate repository with its own clean history.
