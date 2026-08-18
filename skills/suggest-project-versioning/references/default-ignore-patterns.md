# Default Git Exclusion Review

These are review prompts, not a blind `.gitignore` to paste everywhere. Match them to the project's actual tools and preserve any intentional tracked examples.

## Credentials and private machine state

- `.env`, `.env.*`, except explicitly sanitized examples such as `.env.example`
- private keys, certificates, keychains, cookies, session exports, access tokens, and credential files
- diagnostic SSH directories and host-specific authentication material

## Rebuildable dependencies and caches

- Python virtual environments such as `.venv/`, `venv/`, and `__pycache__/`
- JavaScript dependency trees such as `node_modules/`
- package-manager, compiler, browser, model, and application caches
- derived build directories and temporary test output

## Runtime and generated state

- logs, PID files, sockets, lock files, temporary files, and crash dumps
- live SQLite databases, indexes, embeddings, queues, and application state unless the project explicitly treats a small fixture as source
- downloaded models, scraped corpora, rendered sites, generated exports, and reproducible artifacts

## Large content

- media libraries, disk images, recovery images, archives, backups, course downloads, sample libraries, and datasets
- use an external dataset, artifact store, NAS path, or documented retrieval/build step instead of ordinary Git
- use Git LFS only after an explicit storage-budget and remote-support decision

## macOS noise

- `.DS_Store`
- AppleDouble `._*` files when they are metadata debris rather than required content
- Spotlight, Trash, and filesystem bookkeeping directories

## Pre-stage safety check

Before an initial commit or a broad staging operation:

1. Review the exact repository root.
2. List staged paths and sizes.
3. Search staged names for credential and secret patterns without printing secret values.
4. Reject unexpected large files and generated trees.
5. Confirm that any tracked configuration is sanitized.
