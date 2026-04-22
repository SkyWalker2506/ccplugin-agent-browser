---
description: Headless browser automation — navigate pages, fill forms, click buttons, take screenshots, scrape data, and run e2e tests
allowed-tools: [Bash(npx agent-browser:*), Bash(agent-browser:*), Bash, Read]
---

# Browser Automation CLI

Automate headless browser interactions via the `agent-browser` CLI.

## Prerequisites

- Node.js 18+
- `npm i -g agent-browser && agent-browser install` (downloads Chromium)

## Core Workflow

Every automation follows this cycle:

1. **Navigate** — `agent-browser open <url>`
2. **Snapshot** — `agent-browser snapshot -i` (get refs: `@e1`, `@e2`, ...)
3. **Interact** — use refs to click/fill/select
4. **Re-snapshot** — ALWAYS re-snapshot after page changes (navigation, submit, modal)

```bash
agent-browser open https://example.com/form
agent-browser snapshot -i
agent-browser fill @e1 "user@example.com" && agent-browser fill @e2 "pass" && agent-browser click @e3
agent-browser wait --load networkidle && agent-browser snapshot -i
```

Refs (`@e1`) are invalidated on page change. Always re-snapshot after navigation or form submit.

## Commands Reference

### Navigation
```bash
agent-browser open <url>                    # Go to URL
agent-browser close                         # Close browser
```

### Snapshot & Interaction
```bash
agent-browser snapshot -i                   # Interactive snapshot with refs
agent-browser snapshot -s "#selector"       # Scoped snapshot
agent-browser click @e1                     # Click element
agent-browser fill @e2 "text"               # Clear + type
agent-browser type @e2 "text"               # Type without clearing
agent-browser select @e1 "option"           # Select dropdown
agent-browser check @e1                     # Toggle checkbox
agent-browser press Enter                   # Press key
agent-browser scroll down 500              # Scroll pixels
```

### Data Extraction
```bash
agent-browser get text @e1                  # Element text content
agent-browser get url                       # Current URL
agent-browser get title                     # Page title
agent-browser eval 'document.title'        # Run JavaScript
agent-browser eval --stdin <<'EOF'          # Multi-line JS
JSON.stringify(Array.from(document.querySelectorAll("a")).map(a=>a.href))
EOF
```

### Waiting
```bash
agent-browser wait @e1                      # Wait for element
agent-browser wait --load networkidle       # Wait for network idle
agent-browser wait --url "**/dashboard"     # Wait for URL match
agent-browser wait --text "Welcome"         # Wait for text
agent-browser wait 2000                     # Wait milliseconds
```

### Screenshots & Capture
```bash
agent-browser screenshot                    # Viewport screenshot
agent-browser screenshot --full             # Full page
agent-browser screenshot --annotate         # With element labels
agent-browser pdf output.pdf               # Save as PDF
```

### Downloads
```bash
agent-browser download @e1 ./file.pdf      # Download via click
agent-browser wait --download ./output.zip # Wait for download
```

### Device & Viewport
```bash
agent-browser set viewport 375 812         # Mobile dimensions
agent-browser set device "iPhone 14"       # Device emulation
agent-browser --headed open <url>          # Visible mode (debug)
```

### Authentication
```bash
# Auth vault (encrypted, reusable)
echo "$PASS" | agent-browser auth save myapp --url https://app.com/login --username user --password-stdin
agent-browser auth login myapp

# Persistent profile
agent-browser --profile ~/.myapp open https://app.com/login
```

> **Security:** Always pass passwords via `--password-stdin` (pipe from env var). Never pass a password as a CLI argument — it will be visible in shell history and process listings.

## Chaining

Chain commands with `&&` when intermediate output is not needed:

```bash
agent-browser open https://example.com && agent-browser wait --load networkidle && agent-browser snapshot -i
```

## Security (AI agent context)

```bash
export AGENT_BROWSER_CONTENT_BOUNDARIES=1  # Mark page content boundaries
export AGENT_BROWSER_ALLOWED_DOMAINS="example.com,*.example.com"
export AGENT_BROWSER_MAX_OUTPUT=50000      # Limit large page output
```

## Arguments

`$ARGUMENTS` may contain a URL or sub-command. If a URL is provided, open it directly.
