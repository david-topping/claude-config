# claude-config

Personal Claude Code config: global `CLAUDE.md` and skills.

## Install

```sh
git clone <this repo> ~/Documents/dev/claude-config
~/Documents/dev/claude-config/install.sh
```

Symlinks `CLAUDE.md` and each `skills/<name>` into `~/.claude`. Safe to
re-run after adding a skill. Anything already in the way that isn't a
symlink is moved aside to `<name>.bak.<timestamp>`.
