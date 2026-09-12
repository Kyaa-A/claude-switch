#!/usr/bin/env bash
# ── claude-switch installer ────────────────────────────────────
# curl -fsSL https://raw.githubusercontent.com/Kyaa-A/claude-switch/main/install.sh | bash

set -euo pipefail

GREEN='\033[32m'
CYAN='\033[36m'
BOLD='\033[1m'
DIM='\033[2m'
RST='\033[0m'
CLAUDE_ORANGE='\033[38;2;217;119;87m'

REPO_URL="https://raw.githubusercontent.com/Kyaa-A/claude-switch/main/claude-switch"
INSTALL_DIR="${HOME}/.local/bin"
INSTALL_PATH="${INSTALL_DIR}/claude-switch"

echo ""
echo -e "    ${CLAUDE_ORANGE}${BOLD}   ▄█  █▄   ${RST}  ${CLAUDE_ORANGE}${BOLD}claude-switch${RST} ${DIM}installer${RST}"
echo -e "    ${CLAUDE_ORANGE}${BOLD} ▄▄██████▄▄ ${RST}  ${DIM}Multi-account manager for Claude Code CLI${RST}"
echo -e "    ${CLAUDE_ORANGE}${BOLD}▀▀████████▀▀${RST}  ${CYAN}${DIM}https://github.com/Kyaa-A/claude-switch${RST}"
echo -e "    ${CLAUDE_ORANGE}${BOLD} ▀▀██████▀▀ ${RST}"
echo -e "    ${CLAUDE_ORANGE}${BOLD}   ▀█  █▀   ${RST}"
echo ""

# Create install dir
mkdir -p "$INSTALL_DIR"

# Download
DOWNLOAD_PATH=$(mktemp "$INSTALL_DIR/.claude-switch.XXXXXX")
trap 'rm -f "$DOWNLOAD_PATH"' EXIT

if command -v curl &>/dev/null; then
    curl -fsSL "$REPO_URL" -o "$DOWNLOAD_PATH"
elif command -v wget &>/dev/null; then
    wget -qO "$DOWNLOAD_PATH" "$REPO_URL"
else
    echo "  Error: curl or wget required"
    exit 1
fi

[[ -s "$DOWNLOAD_PATH" ]] || { echo "  Error: empty download" >&2; exit 1; }
bash -n "$DOWNLOAD_PATH"
[[ "$(head -n 1 "$DOWNLOAD_PATH")" == '#!/usr/bin/env bash' ]] || {
    echo "  Error: downloaded file is not a Bash script" >&2
    exit 1
}
chmod 755 "$DOWNLOAD_PATH"
mv -f "$DOWNLOAD_PATH" "$INSTALL_PATH"

# Check if ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$INSTALL_DIR:"* ]]; then
    echo -e "  ${DIM}Adding ~/.local/bin to PATH...${RST}"

    SHELL_NAME=$(basename "${SHELL:-bash}")
    RC_FILE=""
    case "$SHELL_NAME" in
        bash) RC_FILE="$HOME/.bashrc" ;;
        zsh)  RC_FILE="$HOME/.zshrc" ;;
        fish) RC_FILE="$HOME/.config/fish/config.fish" ;;
    esac

    if [[ -n "$RC_FILE" ]]; then
        mkdir -p "$(dirname "$RC_FILE")"
        if [[ "$SHELL_NAME" == "fish" ]]; then
            echo "set -gx PATH \$HOME/.local/bin \$PATH" >> "$RC_FILE"
        else
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$RC_FILE"
        fi
        echo -e "  ${DIM}Added to ${RC_FILE}${RST}"
    fi
fi

echo -e "  ${GREEN}✔${RST}  Installed to ${BOLD}${INSTALL_PATH}${RST}"
echo ""
echo -e "  ${BOLD}Get started:${RST}"
echo -e "    ${CYAN}claude-switch save <name>${RST}   ${DIM}# save current account under any name${RST}"
echo -e "    ${CYAN}claude-switch login${RST}         ${DIM}# login to another account${RST}"
echo -e "    ${CYAN}claude-switch use [name]${RST}    ${DIM}# switch anytime (or interactive)${RST}"
echo ""
