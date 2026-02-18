# Dotfiles

Personal linux config files managed using [chezmoi](https://github.com/twpayne/chezmoi)

# Instructons for personal use

## Install chezmoi

### Generic
```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

### Arch
```bash
sudo pacman -S chezmoi
```

## Init on new machine

```bash
chezmoi init git@github.com:GinoMoses/dotfiles.git
chezmoi apply
```

## Update config

```bash
chezmoi update
```

## Edit files

```bash
chezmoi edit ~/.zshrc
chezmoi edit ~/.config/nvim
chezmoi edit ...
```

## Commit and push changes

```bash
chezmoi cd
git add .
git commit -m "message"
git push
```


