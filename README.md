# agent-browser — Claude Code Plugin

by [Musab Kara](https://linkedin.com/in/musab-kara-85580612a) · [GitHub](https://github.com/SkyWalker2506)

Headless browser automation for AI agents. Navigate pages, fill forms, click buttons, take screenshots, scrape data, and run e2e tests — all via Playwright under the hood.

## What's in this repo

This is a **Claude Code plugin** — it adds a `/agent-browser` slash command and a skill to Claude Code. It is **not** the `agent-browser` npm package itself.

| Path | What it does |
|------|-------------|
| `commands/agent-browser.md` | Slash command `/agent-browser` — full CLI usage instructions |
| `skills/agent-browser/SKILL.md` | Skill definition for Claude Code |
| `.claude-plugin/plugin.json` | Plugin metadata |

## Install

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/SkyWalker2506/claude-marketplace/main/install.sh) agent-browser
```

Or via Claude Code native marketplace:

```bash
claude plugin install agent-browser@musabkara-claude-marketplace
```

## Prerequisites

Run the setup script before using the plugin:

```bash
bash setup.sh
```

This installs the `agent-browser` npm package globally and downloads Chromium. Alternatively, run the steps manually:

```bash
npm i -g agent-browser
agent-browser install  # downloads Chromium
```

> The `agent-browser` npm package must be installed and on your PATH for the slash command to work.

## Commands

| Command | Description |
|---------|-------------|
| `/agent-browser` | Start browser automation session |
| `/agent-browser <url>` | Open URL and begin interaction |

## Quick Start

```bash
# Open a page, snapshot, interact
agent-browser open https://example.com
agent-browser snapshot -i
agent-browser click @e1
agent-browser screenshot --full
```

## What the slash command supports

- **Navigate** — open URLs, wait for load, handle redirects
- **Interact** — click, fill forms, select dropdowns, check boxes, press keys
- **Extract** — get text, attributes, run JavaScript, scrape structured data
- **Capture** — screenshots (viewport/full/annotated), PDF export
- **Test** — e2e testing workflows with wait conditions and assertions
- **Auth** — encrypted credential vault, persistent browser profiles

> All of the above depend on the external `agent-browser` npm package being installed.

## Security

Environment variables for AI agent safety:

```bash
AGENT_BROWSER_CONTENT_BOUNDARIES=1         # Mark page content
AGENT_BROWSER_ALLOWED_DOMAINS="example.com" # Domain whitelist
AGENT_BROWSER_MAX_OUTPUT=50000             # Output size limit
```

## Roadmap

- [ ] Automated `claude plugin install` via marketplace distribution
- [ ] Bundle or vendor the `agent-browser` CLI so no separate npm install is needed

## Part of

- [claude-config](https://github.com/SkyWalker2506/claude-config) — Multi-Agent OS for Claude Code
- [claude-marketplace](https://github.com/SkyWalker2506/claude-marketplace) — Browse & install all 18 plugins
- [ClaudeHQ](https://github.com/SkyWalker2506/ClaudeHQ) — Claude ecosystem HQ
