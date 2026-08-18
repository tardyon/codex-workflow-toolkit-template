# Repository Policy

This repository is a sanitized teaching template. Keep it portable, concise, and free of identity-specific or machine-specific state.

- Never add credentials, tokens, cookies, browser profiles, private keys, contact data, private endpoints, absolute home/volume paths, live databases, archives, or bulk media.
- Use placeholders such as `<user>`, `<host>`, `<repository>`, and `$HOME` in examples.
- Keep generic reusable behavior in templates and skills; keep installation-specific configuration outside this repository.
- Validate every changed skill and run `scripts/verify-toolkit.sh` before committing.
- Commit meaningful verified milestones; do not commit every small edit.
- Do not push, publish, merge, tag, or activate changes without the repository owner's authorization.
