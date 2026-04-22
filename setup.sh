#!/usr/bin/env bash
# setup.sh — Install agent-browser and its Chromium dependency

set -euo pipefail

# ── Prerequisites ──────────────────────────────────────────────────────────────
if ! command -v node >/dev/null 2>&1; then
  echo "❌ Node.js not found. Install Node.js 18+ first: https://nodejs.org" >&2
  exit 1
fi

NODE_MAJOR=$(node -e 'process.stdout.write(process.version.slice(1).split(".")[0])')
if [ "$NODE_MAJOR" -lt 18 ]; then
  echo "❌ Node.js 18+ required (found $(node --version)). Upgrade at https://nodejs.org" >&2
  exit 1
fi

if ! command -v npm >/dev/null 2>&1; then
  echo "❌ npm not found. Install npm (bundled with Node.js 18+)." >&2
  exit 1
fi

# ── Install ────────────────────────────────────────────────────────────────────
echo "▶ Installing agent-browser..."
if ! npm install -g agent-browser; then
  echo "❌ npm install failed. Try: sudo npm install -g agent-browser" >&2
  exit 1
fi

# ── Chromium (idempotent) ──────────────────────────────────────────────────────
if agent-browser --version >/dev/null 2>&1 && agent-browser check-install >/dev/null 2>&1; then
  echo "✓ Chromium already installed — skipping download."
else
  echo "▶ Downloading Chromium (required for browser automation)..."
  if ! agent-browser install; then
    echo "❌ Chromium download failed. Check network connectivity." >&2
    exit 1
  fi
fi

echo ""
echo "✅ agent-browser is ready. Run: agent-browser open https://example.com"
