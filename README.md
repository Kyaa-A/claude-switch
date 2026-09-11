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
  <b>Switch between multiple Claude Code accounts without logging out. Zero dependencies. Pure bash.</b>
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

You have access to a Claude CLI account (e.g. your boss's or client's) but **no access to their web account or email** — so running `/logout` means you lose access forever.

At the same time, you want to use **your own personal Claude account** on the same machine. Claude CLI has no built-in multi-profile or multi-account support.

## ⚡ The Solution

`claude-switch` takes snapshots of your auth credentials and swaps them on the fly.

- **No logout ever** — your sessions and refresh tokens stay valid
- **Authentic Claude terminal UI** — Claude starburst logo in warm terracotta gradients
- **TrueColor + 256-color** — auto-detects 24-bit RGB and graceful fallbacks
- **Interactive TUI** — arrow keys (`↑`/`↓`) and vim keys (`j`/`k`) navigation
- **Auto-save on switch** — current session is automatically backed up before switching
- **Session expiry tracking** — know exactly how many days your credentials remain valid
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

    # Step 1: Save your current account (e.g. boss)
    $ claude-switch save boss

    # Step 2: Login to your own account
    $ claude-switch login

    # Step 3: Switch anytime
    $ claude-switch use boss
    $ claude-switch use personal

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
    │  boss  ⚡ ACTIVE  🔒 26d remaining
    │  ├─ email  boss@company.com
    │  ├─ plan   max
    │  └─ org    Acme Corp
    └────────────────────────────────────────────────────────┘

    ┌────────────────────────────────────────────────────────┐
    │  personal
    │  ├─ email  me@gmail.com
    │  ├─ plan   pro
    │  └─ org    Personal
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
    │  boss  ⚡ ACTIVE  🔒 26d remaining
    │  ├─ email  boss@company.com
    │  ├─ plan   max
    │  └─ org    Acme Corp
    └────────────────────────────────────────────────────────┘

  [>] Verifying with Claude API...
  [+] Session is valid — logged in as boss@company.com
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

  ❯ boss        boss@company.com  [max]  (active)
    personal    me@gmail.com      [pro]
    client      dev@agency.co     [team]
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

### 1. Save your current account
```bash
claude-switch save boss
```
*This takes a secure snapshot of your current login credentials.*

### 2. Login to your secondary account
```bash
claude-switch login
```
*This safely auto-saves the current session first, opens browser login, and prompts you for a profile name (e.g. `personal`).*

### 3. Switch anytime!
```bash
claude-switch use boss       # switch to boss
claude-switch use personal   # switch to personal
claude-switch use            # or open interactive picker with arrow keys!
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
    ├── boss/
    │   ├── credentials.json   ← backed-up credentials snapshot
    │   └── status.json        ← cached account metadata (email, plan)
    └── personal/
        ├── credentials.json
        └── status.json
```

When you run `claude-switch use <name>`:
1. It auto-saves your current `~/.claude/.credentials.json` back to your active profile snapshot so no tokens or session refreshes are lost.
2. It copies the target profile's `credentials.json` to `~/.claude/.credentials.json`.
3. It updates `~/.claude/.profiles/.active`.
4. Claude CLI immediately recognizes the switched account.

---

## ❓ Frequently Asked Questions

#### Will this log out my boss or client?
**No.** `claude-switch` never runs `claude auth logout`. It only swaps local token snapshot files. The server-side session remains valid.

#### Do the accounts share conversation history?
**No.** Each account has its own isolated conversation history on Anthropic's servers. Switching accounts gives you only that account's chats and resumes.

#### How does token expiry work?
Claude CLI OAuth tokens include a short-lived access token and a long-lived refresh token (~30 days). Claude CLI automatically refreshes the access token when you use it. `claude-switch` tracks the refresh token validity and warns you when a session is nearing expiry.

#### What if a session expires?
Simply switch to that profile (`claude-switch use <name>`), run `claude auth login`, and run `claude-switch save <name>` to refresh the snapshot.

#### Are any dependencies required?
**None.** It's 100% pure bash. Python3 is optional for JSON parsing and token expiry calculations (falls back gracefully if not installed).

---

## 📄 License

MIT © [Kyaa-A](https://github.com/Kyaa-A)
