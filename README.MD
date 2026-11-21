# yayy

Interactive package installer for Arch Linux with fuzzy search. Inspired by DHH's Omarchy Linux

## Installation

### Quick Install
```bash
curl -sL https://raw.githubusercontent.com/yyg27/yayy/main/install.sh | bash
```

## Requirements

- `yay`
- `fzf`
- `expac` (for `yayyrm -d/-s`)
- `jq` (for `yayy -p`)

## Usage
For INSTALLING AUR packages
```bash
yayy
```
For REMOVING already installed packages
```bash
yayyrm
```

- Type to search
- **Tab** to select multiple packages
- **Enter** to install/remove
- **ESC** to cancel

### Sorting
```bash
yayy -p      # AUR packages by popularity first (downloads ~11MB metadata)
yayyrm -d    # newest installed first
yayyrm -s    # largest first
```
Without a flag, lists are sorted by name.

## License

MIT
