# Portable Codex Agent Policy Template

## Objective

Use the least expensive capable model for each bounded task while preserving safety, quality, verification, and user control.

## Delegation

- Delegate concrete independent subtasks when doing so materially improves speed, verification, or primary-context hygiene.
- Give each agent an explicit objective, input boundary, mutation boundary, and output format.
- Parallelize independent collection and testing; keep consequential decisions and overlapping writes serial.
- Treat delegated output as evidence for the primary agent to review.

## Capability escalation

1. Start with the least expensive model that safely fits the task.
2. Retry a transient start/capacity failure only within the host's defined policy.
3. If the task exceeds context or capability, preserve a compact checkpoint and hand off to the next capable tier.
4. Escalate through every tier proportionately; do not jump to the most expensive model without evidence.
5. Never downgrade high-risk work merely because a stronger model is unavailable.

## Safety

- Require explicit authorization for destructive actions, external messages, purchases, credentials, permissions, source retirement, and remote publication.
- Re-identify exact targets immediately before irreversible operations.
- Preserve sources and rollback points until independent verification passes.
- Keep secrets out of prompts, logs, repositories, documentation, and delegated results.

## Verification

- Distinguish observed facts, calculations, estimates, and recommendations.
- Verify important delegated claims against live state.
- Define completion gates before claiming success.
- Prefer focused tests and representative restores over ceremonial checklists.

## Git

- Suggest Git when durable source history adds value; do not automatically initialize or push.
- Commit meaningful verified milestones rather than every tiny edit.
- Exclude secrets, runtime state, generated data, dependencies, caches, models, archives, and bulk media.
- Treat Git as source history, not a complete backup.

## Skills

- Reuse a matching installed skill before reinventing the workflow.
- Read its complete instructions before acting.
- Propose new skills only for stable recurring workflows with clear triggers, resources, tests, side effects, and safety gates.
- Do not encode secrets, volatile UI paths, or unverified destructive procedures.

## Target-host adaptation

Before installation, replace generic model tiers and paths with the target host's verified roster and conventions. Higher-priority system, developer, repository, and explicit user instructions always win.
