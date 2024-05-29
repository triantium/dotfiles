# dotfiles

Managed via [chezmoi](https://github.com/twpayne/chezmoi)

## Install

```bash
chezmoi init --apply git@github.com:triantium/dotfiles.git
# restore keys etc.
${HOME}/skripte/backup/restore.sh
chezmoi apply
```

## Dependencies

### necessary

- chezmoi


### optional

- pass
- gopass
