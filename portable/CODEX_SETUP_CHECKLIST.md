# Codex Setup and Adaptation Checklist

## Discover

- Confirm Codex version/surface and current model roster.
- Inventory global and repository `AGENTS.md` files.
- Inventory installed personal, system, and plugin skills.
- Inventory MCP servers and plugins by name and purpose without exporting secrets.
- Identify writable roots, shared storage, backup coverage, and host security constraints.

## Decide

- Choose model-routing and escalation rules.
- Choose which recurring workflows deserve skills.
- Choose whether source control is local-only, NAS-hosted, GitHub-hosted, or hybrid.
- Define what must never enter Git or the transport package.
- Define approval boundaries for external and destructive actions.

## Install

- Keep a canonical source tree separate from installed runtime copies.
- Validate skill metadata and linked resources.
- Stage deployment and preserve the previous known-good installation.
- Install only approved policy, skills, and helpers.

## Verify

- Confirm the global policy is discovered.
- Trigger each included skill with a representative safe request.
- Test one cheap-agent delegation, one escalation, one pass-back, and one bounded parallel task.
- Confirm secrets and large unintended files are absent from Git and the ZIP.
- Test rollback from the previous release package.

## Maintain

- Commit meaningful milestones.
- Tag verified releases.
- Update the catalog and deployment manifest.
- Periodically audit stale skills, plugins, MCPs, links, and model assumptions.
- Test a restore, not merely a backup.
