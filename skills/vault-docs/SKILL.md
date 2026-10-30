---
name: vault-docs
description: Write and update project docs in the user's Obsidian vault - where notes go, how feature notes are split, and the house writing style. Use when finishing a piece of work, when a plan changes or a decision is made, or whenever creating or editing a vault note for a project whose AGENTS.md/CLAUDE.md names a docs vault.
---

# Vault docs

## Find the vault

Read the `## Project` section of the repo's `AGENTS.md`/`CLAUDE.md` for the
vault path. If there isn't one, ask rather than guess. Docs live there, not
in the repo.

## When

Update docs as work happens, in the same pass as the board update: when a
piece of work finishes, the plan changes, or a decision is made. Don't leave
it for a later prompt.

## Layout

Read the existing tree first and follow it; the defaults are:

- `<Project>.md` at the vault root: index. Link new notes from it.
- `Project Board.md` at the root: planning process.
- `infra/`: deploy, backups, server-side ops.
- `app/` (or one folder per client/repo): dev setup and conventions.
- `features/`: one note per feature, plus `Features.md` as the cross-feature
  status overview. Keep `Features.md` in step when a feature's status
  changes.

New notes go in the matching folder, not flat at the root. Use `[[wikilinks]]`
between notes.

## Feature notes

Split each `features/<Feature>.md` into:

- `## Overview`: what the feature does, shared context, external
  service/project config.
- `## Frontend (<client repo>)`: screens, components, clients, copy, nav flow.
- `## Backend (<api repo>)`: entities, endpoints, services, migrations.

Never interleave frontend and backend detail, even when one change touches
both sides. Omit a section that doesn't apply.

## Level of detail

High-level architecture map, not code narration. Roughly 2 to 4 sentences
per screen/component/endpoint: what it's for, the key decision or gotcha,
what it hands off to. No function-by-function, prop-by-prop or line-by-line
walkthroughs unless the user asks for that depth on a specific piece.

## Style

- As concise as possible: relevant info only, no filler.
- English UK spelling.
- No Oxford commas.
- No em dashes. Use a plain hyphen, a colon or a new sentence.
