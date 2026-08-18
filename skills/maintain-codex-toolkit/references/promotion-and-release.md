# Promotion and Release Gates

## Promotion evidence

- State the reusable problem and observed improvement.
- Name the exact changed paths.
- Include the deterministic verification command and result.
- Classify privacy and GitHub mirror eligibility.
- Push an `improvement/*` branch for review.

## Release gate

1. Review and merge the proposal through protected `main`.
2. Verify a clean `main` tree and full toolkit.
3. Generate component hashes and a release manifest.
4. Sign the exact release commit and tag a coherent release.
5. Stage it outside active Codex directories.
6. Activate atomically on one canary host.
7. Start a fresh Codex task or explicitly refresh a continuing task when global policy changed; record the actual context load state.
8. Verify discovery and one representative skill.
9. Retain the preceding release and deployment record.

## Rollback gate

Switch the active release pointer to the preceding verified release, restore the matching policy, start a fresh Codex task, and verify discovery. Never reset a dirty source clone or rewrite Git history to roll back an installation.

## Hosting boundary

Use one declared canonical remote. An optional second remote may provide an independent mirror for separately approved repositories. Do not mirror selected directories out of a mixed-private repository; split shareable and private workflows into separate repositories with clean histories.
