---
name: ship-pr
description: Take finished code changes from working tree to an open pull request - branch, run checks, stage and present the diff for sign-off, then commit, push and open a PR with a conventional commit title. Use when a change is ready to review, or when the user signs off and says to commit, push, ship or open a PR.
---

# Ship a PR

Two phases with a hard stop between them. Never cross into phase 2 without
the user explicitly signing off on this change.

## Phase 1: prepare (no commit)

1. If on `main`, create a branch first: `<type>/<short-kebab-description>`
   (`feat/`, `fix/`, `chore/`, ...). Never work on `main` directly.
2. Run the repo's checks. Find them in the repo's `AGENTS.md`/`CLAUDE.md`
   (usually a "Checks" section), else `package.json` scripts, `Makefile`,
   `mvn`/`gradle` conventions. Typically typecheck, lint, format, tests. Fix
   failures; if one can't be fixed, report it with the output, don't hide it.
3. `git add` everything belonging to the change.
4. Present: a short summary of what changed and why, the checks run and their
   results, and point to `git diff --staged`. Call out anything a reviewer
   must act on (e.g. a DB reset, new env var, manual step).
5. Stop and wait.

## Phase 2: ship (only after sign-off)

1. Commit with a conventional commit message. No Claude co-author or
   contributor trailer, even if a default attribution instruction says
   otherwise.
2. Push the branch with upstream tracking (`git push -u origin <branch>`).
   Never `--no-verify`, except the bootstrap case below.
3. `gh pr create` with:
   - Title: conventional commit (`feat: ...`, `fix: ...`, `chore: ...`).
     Repos may enforce this with a `lint-pr-title` check.
   - Body: what and why, design rationale, anything the reviewer must do.
     Reference the issue (`Closes #N`) if there is one.
4. Give the user the PR URL and stop. Never merge, never wait on or babysit
   CI. The user watches CI and merges.

If the repo has a `## Project` board, the ticket stays **In progress** until
the user merges; don't move it to Done on PR open.

## Bootstrap exception for `--no-verify`

`pull_request_target` workflows (like a PR title linter) read their
definition from `main` at run time, not the PR branch. A fix to such a
workflow file must land on `main` directly before any PR can use it. That,
or a similar genuine bootstrap problem, is the only reason to bypass the
pre-push guard. Confirm with the user first.
