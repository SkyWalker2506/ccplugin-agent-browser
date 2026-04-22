# Changelog

All notable changes to this project are documented here.  
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [Unreleased]

## [1.0.1] — 2026-04-22

### Added
- `.gitignore` — excludes `.DS_Store`, `node_modules/`, `forge/`, `analysis/`
- `plugin.json`: `install` field (`"bash setup.sh"`) for marketplace installers
- Password-stdin security note in auth sections of SKILL.md and commands/
- README: version/license/node badges, uninstall section
- GitHub Actions CI: plugin.json validation, shellcheck, markdown link check
- `CHANGELOG.md` (this file)

### Fixed
- `setup.sh`: Node.js 18+ prerequisite check with actionable error message
- `setup.sh`: Idempotent Chromium install (skips if already present)
- `setup.sh`: Meaningful error messages on npm/Chromium failure

---

## [1.0.0] — 2026-04-04

### Added
- Initial plugin: SKILL.md, commands/agent-browser.md, plugin.json, setup.sh
- MIT license
- README with install instructions, command reference, security env vars
- Core workflow: Navigate → Snapshot → Interact → Re-snapshot
- Auth vault pattern (encrypted, reusable credentials)
- Device emulation and viewport control
- JavaScript eval (`agent-browser eval`, `--stdin` for complex JS)
- Screenshot, PDF export, download handling
- Security env vars: `AGENT_BROWSER_CONTENT_BOUNDARIES`, `AGENT_BROWSER_ALLOWED_DOMAINS`, `AGENT_BROWSER_MAX_OUTPUT`

### Changed
- 2026-04-05: setup.sh added to bundle install step (CC-18)
- 2026-04-05: README clarified — removed unverified marketplace install claim
- 2026-04-08: Design manifest (CDS v1.0) added, local design.json removed
