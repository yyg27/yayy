# yayy

Interactive package installer for Arch Linux with fuzzy search. Inspired by DHH's Omarchy Linux

## Installation

### Quick Install
```bash
curl -sL https://raw.githubusercontent.com/yyg27/yayy/main/install.sh | bash
```

### Manual
```bash
curl -sL https://raw.githubusercontent.com/yyg27/yayy/main/yayy -o /usr/local/bin/yayy
sudo chmod +x /usr/local/bin/yayy
```

## Requirements

- `yay`
- `fzf`

## Usage

```bash
yayy
```

- Type to search
- **Tab** to select multiple packages
- **Enter** to install
- **ESC** to cancel

## License

MIT