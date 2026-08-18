# Safety and Rollback

- Build only from a clean reviewed commit.
- Scan the complete staged path list, content, and Git history before publishing.
- Stage outside active runtime paths and validate before activation.
- Preserve the preceding immutable release and installation manifest.
- Activate with an atomic pointer or equivalent reversible mechanism.
- Verify discovery and a representative workflow after activation.
- Roll back by selecting the preceding verified release; do not rewrite source history to simulate rollback.
- Rotate any credential that may have entered version history; deleting the working-tree file is not enough.
