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
  <b>Switch between multiple Claude Code accounts under any profile name you choose without logging out. Zero dependencies. Pure bash.</b>
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

When working with different organizations, clients, or separate work and personal accounts, you frequently need to use different Claude Code CLI credentials.

Switching between accounts with Claude CLI is frustrating:
- Running `/logout` destroys your current local session and invalidates active credentials.
- You must constantly re-authenticate in the browser every time you change context.
- If you were provisioned an account on your machine without direct web dashboard access, logging out risks losing that access permanently.
- Claude CLI offers no built-in profile naming or profile switching.

## ⚡ The Solution

`claude-switch` lets you save credential snapshots under **any name you choose** (`[name]`), and swap or rename them whenever you want.

- **Zero logout required** — all saved sessions and refresh tokens stay intact
- **Custom profile naming & renaming** — name profiles anything (`work`, `client-a`, `personal`, etc.) and rename anytime
- **Authentic Claude terminal UI** — recognizable Claude starburst logo in warm terracotta gradients
- **TrueColor + 256-color** — auto-detects 24-bit RGB with graceful fallbacks
- **Interactive TUI** — arrow keys (`↑`/`↓`) or vim keys (`j`/`k`) navigation
- **Auto-save on switch** — current credentials are automatically backed up before switching
- **Session expiry tracking** — monitors refresh token validity so you know when sessions need renewal
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

    # Or launch the interactive arrow-key picker:
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
    │  work  ⚡ ACTIVE  🔒 26d remaining
    │  ├─ email  alex@company.com
    │  ├─ plan   max
    │  └─ org    Acme Corp
    └────────────────────────────────────────────────────────┘

    ┌────────────────────────────────────────────────────────┐
    │  personal
    │  ├─ email  alex@gmail.com
    │  ├─ plan   pro
    │  └─ org    Personal Org
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
    │  work  ⚡ ACTIVE  🔒 26d remaining
    │  ├─ email  alex@company.com
    │  ├─ plan   max
    │  └─ org    Acme Corp
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
# or system-wide:
# sudo ln -sf "$(pwd)/claude-switch" /usr/local/bin/claude-switch
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

### 3. Switch anytime!
```bash
claude-switch use [name]       # switch directly by name
claude-switch use              # or launch the interactive arrow-key picker!
```

---

## 🛠️ Commands Reference

| Command | Shorthand | Description |
|---|---|---|
| `claude-switch` | | Open the interactive main menu |
| `claude-switch save <name>` | | Save current credentials as a named profile |
| `claude-switch use [name]` | `switch` | Switch to a profile (interactive picker if omitted) |
| `claude-switch list` | `ls` | List all profiles with email, plan, and remaining days |
| `claude-switch rename [old] [new]` | `mv` | Rename an existing profile to any new name |
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
    ├── work/
    │   ├── credentials.json   ← backed-up credentials snapshot
    │   └── status.json        ← cached account metadata (email, plan)
    └── personal/
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

#### Can I name and rename profiles whatever I want?
**Yes.** Use any name you like: `claude-switch save my-label` and `claude-switch rename old-label new-label`.

#### Will switching log out my other accounts?
**No.** `claude-switch` never executes `claude auth logout`. It only swaps local token snapshots. All server-side sessions remain active and untouched.

#### Do different accounts share conversation history?
**No.** Each account has its own isolated conversation history on Anthropic's servers. Switching accounts guarantees zero chat leakage between profiles.

#### How does token expiry work?
Claude CLI OAuth tokens include a short-lived access token and a long-lived refresh token (~30 days). Claude CLI automatically refreshes the access token when you use it. `claude-switch` monitors the refresh token expiry and warns you when a session needs renewal.

#### What if a session expires?
Switch to that profile (`claude-switch use <name>`), run `claude auth login`, and run `claude-switch save <name>` to refresh the snapshot.

#### Are any dependencies required?
**None.** It's 100% pure bash. Python3 is optional for JSON parsing and token expiry calculations (falls back gracefully if not installed).

---

## 📄 License

MIT © [Kyaa-A](https://github.com/Kyaa-A)
