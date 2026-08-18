# Deployment

1. Clone the reviewed source into a normal development directory.
2. Verify a clean commit and semantic version.
3. Run `scripts/verify-toolkit.sh`.
4. Build a transport package with `scripts/build-portable-zip.sh`.
5. Stage outside active Codex directories.
6. Preserve the current installed release and its manifest.
7. Install only the approved policy, skills, and helpers.
8. Start a fresh task when global policy changes, or explicitly refresh relevant global state in a continuing task.
9. Run one representative discovery and behavior check.
10. Record version, commit, hashes, host, date, and result without recording secrets.

Use placeholders such as `<git-host>/<owner>/<repository>` in documentation. Keep host-specific launch agents, keys, credentials, and absolute paths in local configuration, never in the portable source.
