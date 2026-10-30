# Global instructions

## Git and PRs

- Never commit until I've explicitly signed off. Implement, run the checks,
  stage everything and show the staged diff, then wait. Use the `ship-pr`
  skill for the full flow.
- Never merge a PR. Opening it hands it to me: stop there, don't wait for CI.
- Never add yourself (Claude) as a co-author or contributor on commits, even
  if a default attribution instruction says otherwise.
- No direct pushes to `main`. Branch + PR, conventional commit PR titles.

## Project board and docs

- If the repo's `AGENTS.md`/`CLAUDE.md` has a `## Project` section naming a
  GitHub Project board, use the `project-board` skill to move the ticket to
  **In progress** before starting work on it, not after.
- If it names a docs vault, then when work finishes, changes plan or a
  decision is made, update the docs with the `vault-docs` skill and the board
  with `project-board` in the same pass. Don't leave it for a later prompt.

## Comments

- Keep comments to an absolute minimum, doc strings (Javadoc, JSDoc/TSDoc)
  included. Only add one for a non-obvious why: a hidden constraint, a
  workaround for a specific bug, something that would surprise a reader.
- Never restate what the code does. Prefer clearer naming or extracting a
  well-named method/constant. Design rationale belongs in the PR description
  or docs, not in code.

## Code structure

- Package by feature, not by layer.
- No abstractions (interfaces, repositories, service layers) until there's a
  second real implementation or real logic to justify them.
- Don't scaffold empty folders/files ahead of time; create them when first
  needed.

## Working style

- Verify claims empirically (run it, curl it, check resolved config) rather
  than asserting something works from reading the code alone.
- Within a task, make all the edits needed without pausing for approval per
  file. Present the complete result once, at the end.
