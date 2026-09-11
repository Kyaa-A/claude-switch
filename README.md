# 🔑 claude-switch

**Multi-account manager for [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code).**

Switch between multiple Claude accounts without logging out. Zero dependencies. Pure bash.

<p align="center">
  <img src="https://img.shields.io/badge/bash-pure-green?style=flat-square" alt="Pure Bash">
  <img src="https://img.shields.io/badge/dependencies-zero-blue?style=flat-square" alt="Zero Dependencies">
  <img src="https://img.shields.io/badge/license-MIT-yellow?style=flat-square" alt="MIT License">
</p>

---

## The Problem

You have access to your boss's Claude CLI account but **no access to the website** — so you can't risk `/logout`. You also want to use your own account. Claude CLI doesn't support multiple profiles.

## The Solution

`claude-switch` saves credential snapshots and swaps them instantly. No logout. No risk. No dependencies.

```
  claude-switch — Multi-account manager for Claude Code CLI

  ╭────────────────────────────────────────────────────────╮
  │  👤 boss   ACTIVE   🔒 45d left                       │
  │  Email  skylersberry@gmail.com                         │
  │  Plan   max                                            │
  ╰────────────────────────────────────────────────────────╯

  ╭────────────────────────────────────────────────────────╮
  │  👤 personal                                           │
  │  Email  myemail@gmail.com                              │
  │  Plan   pro                                            │
  ╰────────────────────────────────────────────────────────╯
```

## ⚡ Quick Start

### Install

```bash
# One-line install
curl -fsSL https://raw.githubusercontent.com/user/claude-switch/main/install.sh | bash
```

Or manually:

```bash
git clone https://github.com/user/claude-switch.git
cd claude-switch
chmod +x claude-switch
sudo ln -sf "$(pwd)/claude-switch" /usr/local/bin/claude-switch
# or
cp claude-switch ~/.local/bin/
```

### Setup (30 seconds)

```bash
# 1. Save your current account (e.g., your boss's)
claude-switch save boss

# 2. Login to your own account
claude-switch login
# → Opens browser for auth, then asks for a profile name

# 3. Switch anytime!
claude-switch use boss
claude-switch use personal
```

## 📖 Usage

### Interactive Mode

Just run `claude-switch` with no arguments for a full interactive menu:

```bash
claude-switch
```

```
  ❯ ⇄  Switch account
    🔑  Save current session
    👤  Login new account
    ●  List all profiles
    ⚡  Check status
    ✘  Delete a profile
```

### Commands

| Command | Description |
|---------|-------------|
| `claude-switch` | Interactive menu |
| `claude-switch save <name>` | Save current login as a named profile |
| `claude-switch use [name]` | Switch to a profile (interactive picker if no name) |
| `claude-switch list` | List all saved profiles with details |
| `claude-switch status` | Show active profile + live API verification |
| `claude-switch login` | Login to a new account and save it |
| `claude-switch delete [name]` | Delete a profile (interactive picker if no name) |

### Examples

```bash
# Save current session
claude-switch save work

# Interactive switch (arrow keys)
claude-switch use

# Direct switch
claude-switch use personal

# Check who you're logged in as
claude-switch status

# See all profiles
claude-switch list
```

## 🔧 How It Works

Claude CLI stores OAuth credentials in `~/.claude/.credentials.json`. This tool:

1. **Saves** a copy of that file as a named profile in `~/.claude/.profiles/<name>/`
2. **Swaps** the credentials file when you switch profiles
3. **Auto-saves** the current profile before switching (so you never lose tokens)
4. **Tracks** token expiry dates so you know when to re-login

```
~/.claude/
├── .credentials.json          ← active credentials (what Claude CLI reads)
└── .profiles/
    ├── .active                ← which profile is currently active
    ├── boss/
    │   ├── credentials.json   ← saved credentials snapshot
    │   └── status.json        ← cached auth status (email, plan, etc.)
    └── personal/
        ├── credentials.json
        └── status.json
```

## ❓ FAQ

### Will this log out my boss?
**No.** The tool never calls `claude auth logout`. It only copies and swaps credential files.

### Do profiles share sessions/conversations?
**No.** Each account has its own separate conversation history. When you switch profiles, you only see that account's sessions.

### What if a token expires?
Run `claude auth login` while on that profile, then `claude-switch save <name>` to update the saved credentials.

### Does it need any dependencies?
**No.** Pure bash. Works on macOS and Linux. Python3 is optional (used for JSON parsing and token expiry display — falls back gracefully if missing).

### Can I use this with API keys instead of OAuth?
This tool is designed for OAuth-based auth (the default `claude auth login` flow). For API keys, you can just set `ANTHROPIC_API_KEY` env variable — no switching tool needed.

## 🗑️ Uninstall

```bash
# Remove the command
rm -f /usr/local/bin/claude-switch  # or ~/.local/bin/claude-switch

# Remove saved profiles (optional — doesn't affect your Claude login)
rm -rf ~/.claude/.profiles
```

## 📄 License

MIT — do whatever you want.
