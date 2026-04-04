# agent-browser — Claude Code Plugin

Headless browser automation for AI agents. Navigate pages, fill forms, click buttons, take screenshots, scrape data, and run e2e tests — all via Playwright under the hood.

## Install

```bash
claude plugin install SkyWalker2506/ccplugin-agent-browser
```

## Prerequisites

```bash
npm i -g agent-browser
agent-browser install  # downloads Chromium
```

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

## What It Does

- **Navigate** — open URLs, wait for load, handle redirects
- **Interact** — click, fill forms, select dropdowns, check boxes, press keys
- **Extract** — get text, attributes, run JavaScript, scrape structured data
- **Capture** — screenshots (viewport/full/annotated), PDF export
- **Test** — e2e testing workflows with wait conditions and assertions
- **Auth** — encrypted credential vault, persistent browser profiles

## Security

Environment variables for AI agent safety:

```bash
AGENT_BROWSER_CONTENT_BOUNDARIES=1         # Mark page content
AGENT_BROWSER_ALLOWED_DOMAINS="example.com" # Domain whitelist
AGENT_BROWSER_MAX_OUTPUT=50000             # Output size limit
```

## Part of

[SkyWalker2506/claude-config](https://github.com/SkyWalker2506/claude-config) — Multi-Agent OS for Claude Code
