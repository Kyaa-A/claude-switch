# claude-switch

**Multi-account manager for [Claude Code CLI](https://docs.anthropic.com/en/docs/claude-code).**

Switch between multiple Claude accounts without logging out. Zero dependencies. Pure bash.

<p align="center">
  <img src="https://img.shields.io/badge/bash-pure-green?style=flat-square" alt="Pure Bash">
  <img src="https://img.shields.io/badge/dependencies-zero-blue?style=flat-square" alt="Zero Dependencies">
  <img src="https://img.shields.io/badge/license-MIT-yellow?style=flat-square" alt="MIT License">
  <img src="https://img.shields.io/badge/version-1.1.0-purple?style=flat-square" alt="Version">
</p>

---

## The Problem

You have access to someone's Claude CLI account but **no access to the website** — so you can't risk `/logout`. You also want to use your own account. Claude CLI doesn't support multiple profiles.

## The Solution

`claude-switch` saves credential snapshots and swaps them instantly. No logout. No risk. No dependencies.

## 🖥️ What It Looks Like

### `claude-switch help`

```
     _                 _                          _ _       _
 ___| | __ _ _   _  __| | ___       _____      _(_) |_ ___| |__
/ __| |/ _` | | | |/ _` |/ _ \_____/ __\ \ /\ / / | __/ __| '_ \
| (__| | (_| | |_| | (_| |  __/_____\__ \\ V  V /| | || (__| | | |
 \___|_|\__,_|\__,_|\__,_|\___|     |___/ \_/\_/ |_|\__\___|_| |_|

            [!] Multi-account manager for Claude Code CLI

 │ version  1.1.0#stable
 │ home     https://github.com/Kyaa-A/claude-switch
 │ license  MIT

────────────────────────────────────────────────────────────

USAGE
  claude-switch [command] [options]

COMMANDS

  save <name>         Save current login as a named profile
  use [name]          Switch to a saved profile (interactive if no name)
  list               List all saved profiles with details
  status             Show active profile + live verification
  login              Login to a new account and save it
  delete [name]       Delete a saved profile (interactive if no name)
  help               Show this help message

QUICK START

  # Step 1: Save your current (boss's) account
  $ claude-switch save boss

  # Step 2: Login to your own account
  $ claude-switch login

  # Step 3: Switch anytime
  $ claude-switch use boss
  $ claude-switch use personal

  # Or use interactive mode — just run:
  $ claude-switch use
```

### `claude-switch list`

```
     _                 _                          _ _       _
 ___| | __ _ _   _  __| | ___       _____      _(_) |_ ___| |__
/ __| |/ _` | | | |/ _` |/ _ \_____/ __\ \ /\ / / | __/ __| '_ \
| (__| | (_| | |_| | (_| |  __/_____\__ \\ V  V /| | || (__| | | |
 \___|_|\__,_|\__,_|\__,_|\___|     |___/ \_/\_/ |_|\__\___|_| |_|

            [!] v1.1.0 — https://github.com/Kyaa-A/claude-switch

🔑 Saved Profiles (2 total)

  ┌────────────────────────────────────────────────────────┐
  │  boss  [ACTIVE]  [🔒 45d remaining]
  │  ├─ email  boss@company.com
  │  ├─ plan   max
  │  └─ org    Company Inc.
  └────────────────────────────────────────────────────────┘

  ┌────────────────────────────────────────────────────────┐
  │  personal
  │  ├─ email  me@gmail.com
  │  ├─ plan   pro
  │  └─ org    Personal
  └────────────────────────────────────────────────────────┘
```

### `claude-switch status`

```
     _                 _                          _ _       _
 ___| | __ _ _   _  __| | ___       _____      _(_) |_ ___| |__
/ __| |/ _` | | | |/ _` |/ _ \_____/ __\ \ /\ / / | __/ __| '_ \
| (__| | (_| | |_| | (_| |  __/_____\__ \\ V  V /| | || (__| | | |
 \___|_|\__,_|\__,_|\__,_|\___|     |___/ \_/\_/ |_|\__\___|_| |_|

            [!] v1.1.0 — https://github.com/Kyaa-A/claude-switch

⚡ Current Session

  ┌────────────────────────────────────────────────────────┐
  │  boss  [ACTIVE]  [🔒 45d remaining]
  │  ├─ email  boss@company.com
  │  ├─ plan   max
  │  └─ org    Company Inc.
  └────────────────────────────────────────────────────────┘

  [>] Verifying with Claude API...
  [+] Session is valid — logged in as boss@company.com
```

### `claude-switch use` (Interactive Mode)

```
     _                 _                          _ _       _
 ___| | __ _ _   _  __| | ___       _____      _(_) |_ ___| |__
/ __| |/ _` | | | |/ _` |/ _ \_____/ __\ \ /\ / / | __/ __| '_ \
| (__| | (_| | |_| | (_| |  __/_____\__ \\ V  V /| | || (__| | | |
 \___|_|\__,_|\__,_|\__,_|\___|     |___/ \_/\_/ |_|\__\___|_| |_|

            [!] v1.1.0 — https://github.com/Kyaa-A/claude-switch

  ⇄ Select account to switch to:
  Use ↑↓ arrows to navigate, Enter to select, q to cancel

  ❯ boss        boss@company.com  [max]  (active)
    personal    me@gmail.com      [pro]
    client      dev@client.co     [team]
```

---

## ⚡ Quick Start

### Install

```bash
# One-line install
curl -fsSL https://raw.githubusercontent.com/Kyaa-A/claude-switch/main/install.sh | bash
```

Or manually:

```bash
git clone https://github.com/Kyaa-A/claude-switch.git
cd claude-switch
chmod +x claude-switch
cp claude-switch ~/.local/bin/
# or
sudo ln -sf "$(pwd)/claude-switch" /usr/local/bin/claude-switch
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

## 📖 Commands

| Command | Description |
|---------|-------------|
| `claude-switch` | Interactive menu (no args) |
| `claude-switch save <name>` | Save current login as a named profile |
| `claude-switch use [name]` | Switch to a profile (interactive picker if no name) |
| `claude-switch list` | List all saved profiles with details |
| `claude-switch status` | Show active profile + live API verification |
| `claude-switch login` | Login to a new account and save it |
| `claude-switch delete [name]` | Delete a profile (interactive picker if no name) |
| `claude-switch help` | Show help with banner |

### Interactive Menu

Just run `claude-switch` with no arguments:

```
  ❯ ⇄  Switch account
    🔑  Save current session
    👤  Login new account
    ●  List all profiles
    ⚡  Check status
    ✘  Delete a profile
```

Navigate with **↑↓ arrows** or **j/k** (vim keys), **Enter** to select, **q** to cancel.

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
**No.** Each account has its own separate conversation history. Switching profiles = switching who you're logged in as.

### What if a token expires?
Run `claude auth login` while on that profile, then `claude-switch save <name>` to update.

### Does it need any dependencies?
**No.** Pure bash. Works on macOS and Linux. Python3 is optional (used for JSON parsing — falls back gracefully).

### Can I use this with API keys?
This tool is for OAuth-based auth (`claude auth login`). For API keys, just set `ANTHROPIC_API_KEY` — no switching tool needed.

## 🗑️ Uninstall

```bash
# Remove the command
rm -f ~/.local/bin/claude-switch  # or /usr/local/bin/claude-switch

# Remove saved profiles (optional — doesn't affect your Claude login)
rm -rf ~/.claude/.profiles
```

## 📄 License

MIT — do whatever you want.
