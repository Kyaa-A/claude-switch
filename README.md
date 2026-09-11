# claude-switch

<p align="center">
  <pre align="center">
      ▄██     ▄█▄         
      ▀███   ███▀  ▄▄▄      <b>CLAUDE-SWITCH</b>  v1.2.0
  ▄██▄ ▀███▄ ███  ████▀     Multi-account manager for Claude Code CLI
  ▀████▄▀███▄██▀▄███▀       ─────────────────────────────────────────
     ▀▀████████████   ▄▄▄▄  ▸ <b>shared /resume</b>  ✔ all accounts access sessions
▄▄▄▄▄▄▄▄▄████████████████▀  ▸ <b>version</b>        1.2.0 #stable
 ▀▀▀▀▀▀▀▀▀███████████▄▄▄▄   ▸ <b>repo</b>           https://github.com/Kyaa-A/claude-switch
     ▄▄▄███████████▀▀▀▀▀█▀  ▸ <b>status</b>         ● ready
   ▄███▀ ▄███████████▄      ─────────────────────────────────────────
   ▀▀  ▄██▀ ██▀ ███▀▀▀█     Zero logout · Shared /resume · Pure bash
      ██▀  ███   ▀██      
           ▀██            
  </pre>
</p>

<p align="center">
  <b>Switch between multiple Claude Code accounts without logging out — with 100% shared <code>/resume</code> session history across every account. Zero dependencies. Pure bash.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/claude-D97757?style=for-the-badge&logo=anthropic&logoColor=white" alt="Claude">
  <img src="https://img.shields.io/badge/bash-pure-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Pure Bash">
  <img src="https://img.shields.io/badge/shared%20resume-supported-brightgreen?style=for-the-badge" alt="Shared Resume">
  <img src="https://img.shields.io/badge/dependencies-zero-blue?style=for-the-badge" alt="Zero Dependencies">
  <img src="https://img.shields.io/badge/version-1.2.0-orange?style=for-the-badge" alt="Version">
  <img src="https://img.shields.io/badge/license-MIT-yellow?style=for-the-badge" alt="MIT License">
</p>

---

## 🎯 The Problem

When using Claude Code CLI with multiple accounts (e.g. work, personal, clients, or different organizations), you frequently need to switch between them.

Switching accounts natively is frustrating:
- Running `/logout` destroys your current session and invalidates active credentials.
- You must constantly re-authenticate in the browser every time you change projects.
- If you were provisioned an account on your machine without direct web dashboard access, logging out risks losing that access permanently.
- Isolated profiles often separate project directories, making you lose access to previous conversation history.

## ⚡ The Solution: Shared `/resume` Across All Accounts

`claude-switch` manages credential snapshots without touching your project work:

1. **Only authentication credentials (`~/.claude/.credentials.json`) are swapped.**
2. **Local project conversation histories (`~/.claude/projects/`) remain 100% intact and shared.**
3. **You can start a task on Account A, switch to Account B, and immediately run `claude --resume` or type `/resume` to continue the exact same conversation seamlessly!**
4. **No `/logout` ever happens** — your sessions and refresh tokens remain valid.

---

## 🖥️ Terminal UI Preview

### Main Banner (`claude-switch help`)

```
      ▄██     ▄█▄         
      ▀███   ███▀  ▄▄▄      CLAUDE-SWITCH  v1.2.0
  ▄██▄ ▀███▄ ███  ████▀     Multi-account manager for Claude Code CLI
  ▀████▄▀███▄██▀▄███▀       ─────────────────────────────────────────
     ▀▀████████████   ▄▄▄▄  ▸ shared /resume  ✔ all accounts access sessions
▄▄▄▄▄▄▄▄▄████████████████▀  ▸ version        1.2.0 #stable
 ▀▀▀▀▀▀▀▀▀███████████▄▄▄▄   ▸ repo           https://github.com/Kyaa-A/claude-switch
     ▄▄▄███████████▀▀▀▀▀█▀  ▸ status         ● ready
   ▄███▀ ▄███████████▄      ─────────────────────────────────────────
   ▀▀  ▄██▀ ██▀ ███▀▀▀█     Zero logout · Shared /resume · Pure bash
      ██▀  ███   ▀██      
           ▀██            

  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  USAGE
    claude-switch [command] [options]

  COMMANDS

    save <name>          Save current login as a named profile
    use [name]           Switch to a saved profile (interactive if omitted)
    list                List all saved profiles with details
    rename [old] [new]   Rename a saved profile
    status              Show active profile + live verification
    login               Login to a new account and save it
    delete [name]        Delete a saved profile (interactive if omitted)
    help                Show this help message

  QUICK START

    # Step 1: Save current login under any name you want
    $ claude-switch save <name>

    # Step 2: Login to another account
    $ claude-switch login

    # Step 3: Switch between them anytime
    $ claude-switch use <name>

    # All sessions are shared — resume anytime:
    $ claude --resume
```

#### Profile Cards with Live Usage & Shared Sessions (`claude-switch list`)

```
       ▄█  █▄     claude-switch v1.3.0
     ▄▄██████▄▄   Multi-account manager for Claude CLI
    ▀▀████████▀▀  https://github.com/Kyaa-A/claude-switch
     ▀▀██████▀▀ 
       ▀█  █▀   

  🔑 Saved Profiles (2 total)

  ┌──────────────────────────────────────────────────────────────────────────┐
  │  work  ⚡ ACTIVE  🔒 26d remaining                                         │
  │  ├─ email  alex@company.com        │ 5h [█████████░]  87% · in 41m ⚠     │
  │  ├─ plan   max                     │ wk [█░░░░░░░░░]   8% · in 6d 17h    │
  │  └─ org    Acme Corp               │ resets 5:40 PM · Fri 10:00 AM       │
  └──────────────────────────────────────────────────────────────────────────┘

  ┌──────────────────────────────────────────────────────────────────────────┐
  │  personal  🔒 14d remaining                                               │
  │  ├─ email  alex@gmail.com          │ 5h [░░░░░░░░░░]   0% · in 5h 0m     │
  │  └─ plan   pro                     │ wk [██░░░░░░░░]  20% · in 5d 2h     │
  └──────────────────────────────────────────────────────────────────────────┘

  💬 Shared Sessions: 793 conversations available to /resume
```

### Session Verification (`claude-switch status`)

```
       ▄█  █▄     claude-switch v1.3.0
     ▄▄██████▄▄   Multi-account manager for Claude CLI
    ▀▀████████▀▀  https://github.com/Kyaa-A/claude-switch
     ▀▀██████▀▀ 
       ▀█  █▀   

  ⚡ Current Session

    ┌────────────────────────────────────────────────────────┐
    │  work  ⚡ ACTIVE  🔒 26d remaining
    │  ├─ email   alex@company.com
    │  ├─ plan    max
    │  ├─ org     Acme Corp
    │  └─ resume  shared across all profiles
    └────────────────────────────────────────────────────────┘

  [>] Verifying with Claude API...
  [+] Session is valid — logged in as alex@company.com
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

  ❯ work        alex@company.com  [max]  (active)
    personal    alex@gmail.com    [pro]
    client      alex@client.io    [team]
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
```

---

## 📖 3-Step Setup Guide

### 1. Save your current account under any name
```bash
claude-switch save [name]
```
*Creates a snapshot of your current credentials under whatever label you prefer.*

### 2. Login to your secondary account
```bash
claude-switch login
```
*Auto-saves your current session first, launches the browser login flow, and prompts you for a profile name (`[name]`).*

### 3. Switch anytime — and `/resume` any session!
```bash
claude-switch use [name]       # switch directly by name
claude-switch use              # or launch the interactive arrow-key picker!
claude --resume                # continue any session across any account!
```

---

## 🛠️ Commands Reference

| Command | Shorthand | Description |
|---|---|---|
| `claude-switch` | | Open the interactive main menu |
| `claude-switch save <name>` | | Save current credentials as a named profile |
| `claude-switch use [name]` | `switch` | Switch to a profile (interactive picker if omitted) |
| `claude-switch list` | `ls` | List all profiles and show shared session pool count |
| `claude-switch rename [old] [new]` | `mv` | Rename an existing profile to any new name |
| `claude-switch status` | `whoami` | Show active profile and verify token against Claude API |
| `claude-switch login` | `add` | Safely login to a new account without losing current one |
| `claude-switch delete [name]` | `rm` | Delete a profile (interactive picker if omitted) |
| `claude-switch help` | `-h`, `--help`| Display ASCII banner and help reference |

---

## 🔬 How Shared `/resume` Works

Claude CLI stores its configuration and state in `~/.claude/`:
```
~/.claude/
├── .credentials.json          ← Active credentials (what claude-switch swaps)
├── projects/                  ← ALL local conversation sessions (NEVER touched)
└── .profiles/                 ← Where claude-switch stores snapshots
    ├── .active
    ├── work/
    │   ├── credentials.json
    │   └── status.json
    └── personal/
        ├── credentials.json
        └── status.json
```

Because `claude-switch` **only swaps `.credentials.json`**, your project conversation history in `~/.claude/projects/` is 100% preserved and shared. 

You can start a session on `work`, switch to `personal` when rate limited, and continue right where you left off with `claude --resume` or typing `/resume`!

---

## ❓ Frequently Asked Questions

#### Can I `/resume` conversations after switching accounts?
**Yes!** Claude Code CLI stores conversation threads locally on your machine in `~/.claude/projects/`. Because `claude-switch` only swaps authentication tokens (`.credentials.json`), your local session history is 100% shared. You can start a conversation on one account, switch accounts with `claude-switch use [name]`, and immediately run `claude --resume` or type `/resume` to continue the exact same conversation seamlessly!

#### Can I name and rename profiles whatever I want?
**Yes.** Use any name you like: `claude-switch save my-label` and `claude-switch rename old-label new-label`.

#### Will switching log out my other accounts?
**No.** `claude-switch` never executes `claude auth logout`. It only swaps local token snapshots. All server-side sessions remain active and untouched.

#### How does token expiry work?
Claude CLI OAuth tokens include a short-lived access token and a long-lived refresh token (~30 days). Claude CLI automatically refreshes the access token when you use it. `claude-switch` monitors the refresh token expiry and warns you when a session needs renewal.

#### What if a session expires?
Switch to that profile (`claude-switch use <name>`), run `claude auth login`, and run `claude-switch save <name>` to refresh the snapshot.

#### Are any dependencies required?
**None.** It's 100% pure bash. Python3 is optional for JSON parsing and token expiry calculations (falls back gracefully if not installed).

---

## 📄 License

MIT © [Kyaa-A](https://github.com/Kyaa-A)
