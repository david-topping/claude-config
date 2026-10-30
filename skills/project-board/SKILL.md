---
name: project-board
description: Manage a GitHub Projects (v2) board with gh - create issues or draft items, add them to the board, set Status (e.g. move to In progress before starting work), and reorder items so position reflects build order. Use whenever starting or finishing a ticket, adding new work, or when the repo's AGENTS.md/CLAUDE.md names a project board.
---

# Project board

## Find the board

Read the `## Project` section of the repo's `AGENTS.md`/`CLAUDE.md` for the
board owner and number. If there isn't one, ask rather than guess.
Below, `<N>` is the number and `<owner>` the owner.

## Rules

- New work lands on the board, not as ad-hoc TODOs.
- Repo exists: create a real issue in that repo, then add it to the board.
  Repo doesn't exist yet: a draft item. Once the repo exists, recreate its
  drafts as real issues and delete the drafts.
- Move an item to **In progress** before starting work on it, not after.
  The board reflects what's happening now.
- Within each status, order is build order (top = next). Position new items
  where they actually fall in the sequence, don't just append.
- Use the account's issue templates if the repo has them (they may be
  inherited from the owner's `.github` repo); fill in their sections.

## Commands

```sh
# Real issue, then attach
gh issue create --repo <owner>/<repo> --title "..." --body "..."
gh project item-add <N> --owner <owner> --url <issue-url>

# Draft item (repo doesn't exist yet)
gh project item-create <N> --owner <owner> --title "..." --body "..."

# Look up IDs
gh project view <N> --owner <owner> --format json --jq .id          # project ID
gh project item-list <N> --owner <owner> --format json --limit 200  # item IDs
gh project field-list <N> --owner <owner> --format json             # field + option IDs

# Set Status (or any single-select field)
gh project item-edit --project-id <projectId> --id <itemId> \
  --field-id <statusFieldId> --single-select-option-id <optionId>
```

`item-list` defaults to 30 items; always pass a higher `--limit`.

## Reorder

`gh project` has no reorder command. Use the bundled script, which wraps the
GraphQL `updateProjectV2ItemPosition` mutation:

```sh
~/.claude/skills/project-board/scripts/reorder.sh <projectId> <itemId> [afterItemId]
```

- Omit `afterItemId` to move the item to the very top.
- To lay out a sequence, chain calls: each item's `afterItemId` is the
  previous item's ID.
- Order only holds within a status group when the view is grouped by Status.
- The mutation can succeed silently without the result you expect. Verify by
  re-reading `gh project item-list` afterwards.
