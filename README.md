# claude-switch

<p align="center">
  <pre align="center">
      ▄██     ▄█▄         
      ▀███   ███▀  ▄▄▄      <b>CLAUDE-SWITCH</b>  v1.2.0
  ▄██▄ ▀███▄ ███  ████▀     Multi-account manager for Claude Code CLI
  ▀████▄▀███▄██▀▄███▀       ─────────────────────────────────────────
     ▀▀████████████   ▄▄▄▄  ▸ <b>version</b>   1.2.0 #stable
▄▄▄▄▄▄▄▄▄████████████████▀  ▸ <b>repo</b>      https://github.com/Kyaa-A/claude-switch
 ▀▀▀▀▀▀▀▀▀███████████▄▄▄▄   ▸ <b>license</b>   MIT
     ▄▄▄███████████▀▀▀▀▀█▀  ▸ <b>status</b>    ● ready
   ▄███▀ ▄███████████▄      ─────────────────────────────────────────
   ▀▀  ▄██▀ ██▀ ███▀▀▀█     Swaps credentials · Zero logout · Pure bash
      ██▀  ███   ▀██      
           ▀██            
  </pre>
</p>

<p align="center">
  <b>Seamlessly switch between multiple Claude Code accounts across different companies, clients, or organizations without logging out. Zero dependencies. Pure bash.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/claude-D97757?style=for-the-badge&logo=anthropic&logoColor=white" alt="Claude">
  <img src="https://img.shields.io/badge/bash-pure-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Pure Bash">
  <img src="https://img.shields.io/badge/dependencies-zero-blue?style=for-the-badge" alt="Zero Dependencies">
  <img src="https://img.shields.io/badge/version-1.2.0-orange?style=for-the-badge" alt="Version">
  <img src="https://img.shields.io/badge/license-MIT-yellow?style=for-the-badge" alt="MIT License">
</p>

---

## 🎯 The Problem

When working across multiple companies, clients, or projects, each organization often provisions its own dedicated Claude Code account or subscription. 

Switching between them is painful:
- Running `/logout` tears down your active CLI session and invalidates local tokens.
- You must constantly open a browser and re-authenticate every time you change projects.
- If you're using an account provisioned on your machine without direct access to the web credentials/SSO dashboard, logging out means losing access.
- Claude CLI has no native support for multi-account or multi-org profiles.

## ⚡ The Solution

`claude-switch` manages secure local credential snapshots and swaps them instantly.

- **Zero logout required** — all saved sessions and refresh tokens remain valid
- **Authentic Claude terminal UI** — recognizable Claude starburst logo in warm terracotta gradients
- **TrueColor + 256-color** — auto-detects 24-bit RGB with graceful fallbacks
- **Interactive TUI** — navigate with arrow keys (`↑`/`↓`) or vim keys (`j`/`k`)
- **Auto-save on switch** — current credentials are automatically backed up before loading a new profile
- **Session expiry tracking** — monitors refresh token validity so you know when sessions need refreshing
- **Zero dependencies** — pure bash, works out-of-the-box on Linux & macOS

---

## 🖥️ Terminal UI Preview

### Main Banner (`claude-switch help`)

```
      ▄██     ▄█▄         
      ▀███   ███▀  ▄▄▄      CLAUDE-SWITCH  v1.2.0
  ▄██▄ ▀███▄ ███  ████▀     Multi-account manager for Claude Code CLI
  ▀████▄▀███▄██▀▄███▀       ─────────────────────────────────────────
     ▀▀████████████   ▄▄▄▄  ▸ version   1.2.0 #stable
▄▄▄▄▄▄▄▄▄████████████████▀  ▸ repo      https://github.com/Kyaa-A/claude-switch
 ▀▀▀▀▀▀▀▀▀███████████▄▄▄▄   ▸ license   MIT
     ▄▄▄███████████▀▀▀▀▀█▀  ▸ status    ● ready
   ▄███▀ ▄███████████▄      ─────────────────────────────────────────
   ▀▀  ▄██▀ ██▀ ███▀▀▀█     Swaps credentials · Zero logout · Pure bash
      ██▀  ███   ▀██      
           ▀██            

  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

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

    # Step 1: Save current company account
    $ claude-switch save company1

    # Step 2: Login to another company account
    $ claude-switch login

    # Step 3: Save second company account
    $ claude-switch save company2

    # Step 4: Switch anytime
    $ claude-switch use company1
    $ claude-switch use company2

    # Or use interactive mode — just run:
    $ claude-switch use
```

### Profile Cards (`claude-switch list`)

```
       ▄█  █▄     claude-switch v1.2.0
     ▄▄██████▄▄   Multi-account manager for Claude CLI
    ▀▀████████▀▀  https://github.com/Kyaa-A/claude-switch
     ▀▀██████▀▀ 
       ▀█  █▀   

  🔑 Saved Profiles (2 total)

    ┌────────────────────────────────────────────────────────┐
    │  company1  ⚡ ACTIVE  🔒 26d remaining
    │  ├─ email  dev@company1.com
    │  ├─ plan   max
    │  └─ org    Company One Inc.
    └────────────────────────────────────────────────────────┘

    ┌────────────────────────────────────────────────────────┐
    │  company2
    │  ├─ email  eng@company2.io
    │  ├─ plan   pro
    │  └─ org    Company Two Technologies
    └────────────────────────────────────────────────────────┘
```

### Session Verification (`claude-switch status`)

```
       ▄█  █▄     claude-switch v1.2.0
     ▄▄██████▄▄   Multi-account manager for Claude CLI
    ▀▀████████▀▀  https://github.com/Kyaa-A/claude-switch
     ▀▀██████▀▀ 
       ▀█  █▀   

  ⚡ Current Session

    ┌────────────────────────────────────────────────────────┐
    │  company1  ⚡ ACTIVE  🔒 26d remaining
    │  ├─ email  dev@company1.com
    │  ├─ plan   max
    │  └─ org    Company One Inc.
    └────────────────────────────────────────────────────────┘

  [>] Verifying with Claude API...
  [+] Session is valid — logged in as dev@company1.com
```

### Interactive Switcher (`claude-switch use`)

```
       ▄█  █▄     claude-switch v1.2.0
     ▄▄██████▄▄   Multi-account manager for Claude CLI
    ▀▀████████▀▀  https://github.com/Kyaa-A/claude-switch
     ▀▀██████▀▀ 
       ▀█  █▀   

  ⇄ Select account to switch to:
  Use ↑↓ arrows (or j/k) to navigate, Enter to select, q to cancel

  ❯ company1    dev@company1.com  [max]  (active)
    company2    eng@company2.io   [pro]
    personal    me@gmail.com      [max]
```

---

## 🚀 Quick Install

### One-line Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/Kyaa-A/claude-switch/main/install.sh | bash
```

### Or Manual Install

```bash
git clone https://github.com/Kyaa-A/claude-switch.git
cd claude-switch
chmod +x claude-switch
cp claude-switch ~/.local/bin/
# or system-wide:
# sudo ln -sf "$(pwd)/claude-switch" /usr/local/bin/claude-switch
```

---

## 📖 3-Step Setup Guide

### 1. Save your current company account
```bash
claude-switch save company1
```
*Creates a snapshot of your current credentials.*

### 2. Login to your other company or personal account
```bash
claude-switch login
```
*Safely auto-saves the current session first, launches the login flow, and prompts you for a profile name (e.g. `company2` or `personal`).*

### 3. Switch anytime!
```bash
claude-switch use company1     # switch to company1
claude-switch use company2     # switch to company2
claude-switch use              # or open interactive picker with arrow keys!
```

---

## 🛠️ Commands Reference

| Command | Shorthand | Description |
|---|---|---|
| `claude-switch` | | Open the interactive main menu |
| `claude-switch save <name>` | | Save current credentials as a named profile |
| `claude-switch use [name]` | `switch` | Switch to a profile (interactive picker if omitted) |
| `claude-switch list` | `ls` | List all profiles with email, plan, and remaining days |
| `claude-switch status` | `whoami` | Show active profile and verify token against Claude API |
| `claude-switch login` | `add` | Safely login to a new account without losing current one |
| `claude-switch delete [name]` | `rm` | Delete a profile (interactive picker if omitted) |
| `claude-switch help` | `-h`, `--help`| Display ASCII banner and help reference |

---

## 🔬 How It Works Under The Hood

Claude CLI stores OAuth credentials in:
```
~/.claude/.credentials.json
```

`claude-switch` manages snapshots of this file in an isolated directory:
```
~/.claude/
├── .credentials.json          ← active credentials read by Claude CLI
└── .profiles/
    ├── .active                ← active profile marker
    ├── company1/
    │   ├── credentials.json   ← backed-up credentials snapshot
    │   └── status.json        ← cached account metadata (email, plan)
    └── company2/
        ├── credentials.json
        └── status.json
```

When you run `claude-switch use <name>`:
1. It auto-saves your current `~/.claude/.credentials.json` back to your active profile snapshot so refreshed tokens are never lost.
2. It copies the target profile's `credentials.json` to `~/.claude/.credentials.json`.
3. It updates `~/.claude/.profiles/.active`.
4. Claude CLI immediately recognizes the switched account.

---

## ❓ Frequently Asked Questions

#### Will switching log out my other company accounts?
**No.** `claude-switch` never executes `claude auth logout`. It only swaps local token snapshots. All server-side sessions remain active and untouched.

#### Do different company accounts share conversation history?
**No.** Each company account has its own completely isolated conversation history on Anthropic's servers. Switching accounts ensures no cross-company chat leakage.

#### How does token expiry work?
Claude CLI OAuth tokens include a short-lived access token and a long-lived refresh token (~30 days). Claude CLI automatically refreshes the access token when you use it. `claude-switch` monitors the refresh token expiry and warns you when a session needs renewal.

#### What if a session expires?
Switch to that profile (`claude-switch use <name>`), run `claude auth login`, and run `claude-switch save <name>` to refresh the snapshot.

#### Are any dependencies required?
**None.** It's 100% pure bash. Python3 is optional for JSON parsing and token expiry calculations (falls back gracefully if not installed).

---

## 📄 License

MIT © [Kyaa-A](https://github.com/Kyaa-A)
