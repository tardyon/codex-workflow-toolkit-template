# Codex Workflow Toolkit Template

A small, portable teaching repository for building a disciplined Codex setup: global policy, reusable skills, verification helpers, release practices, and safe collaboration across machines.

This repository contains examples, not a finished personal configuration. Copy and adapt the templates to the target machine only after inventorying its Codex surface, installed models, skills, plugins, security boundaries, and operating-system conventions.

## Start here

1. Read [Best Practices](portable/CODEX_TOOLKIT_BEST_PRACTICES.md).
2. Work through the [Setup Checklist](portable/CODEX_SETUP_CHECKLIST.md).
3. Adapt [AGENTS.template.md](portable/AGENTS.template.md) to the verified model roster and risk profile.
4. Review the example skills in [`skills/`](skills/).
5. Run `scripts/verify-toolkit.sh` before committing or sharing changes.
6. Use `scripts/build-portable-zip.sh` to produce a generic starter package.

## Included examples

- `maintain-codex-toolkit`: proposes reviewed, versioned improvements without silently activating its own policy changes.
- `suggest-project-versioning`: recommends proportionate Git use and requires explicit authorization before creating repositories or remotes.
- `reliable-browser-publishing`: demonstrates exact authorization, duplicate prevention, exactly-once submission, and live-result verification.

## Deliberately excluded

No credentials, browser profiles, authentication state, private contact data, machine-specific paths, private service endpoints, purchased archives, runtime databases, logs, bulk media, or personal workflow content belong here.

## Hosting

The repository can be local-only, privately hosted, or mirrored to an approved remote. The safe default is private hosting until a full content-and-history privacy review passes. Git history is not a complete backup.

## License

MIT. See [LICENSE](LICENSE).
