# Akela Claude Code plugins

## ops-center

Connects Claude Code to [Ops-Center](https://ops.akela.ai) over MCP:

- **The MCP server.** Sign in with OAuth when Claude Code asks (or run `/mcp`); pick the
  organization and the permissions on the consent screen. No token to paste.
- **Skills.** How to run a people or organization search, enrich one entity, score
  against criteria, work with case files, and use the paid sources. Claude Code loads
  the right one when the work comes up.
- **A premium-source hook.** Before every paid source call (Apollo, Tavily, Apify,
  ContactOut, Hunter, Ploid, Orbit, PDL, Clay) Claude Code asks you first. Free sources
  (the index, grounding, duckduckgo) run without asking. `OPS_CENTER_HOOKS=off` turns
  the hook off.

### Install

```
/plugin marketplace add akelahub/claude-plugins
/plugin install ops-center@akela
```

The plugin connects to production (`https://api.ops.akela.ai/v1/mcp`). To use testing,
set the plugin's **Ops-Center MCP URL** option to `https://api.ops.test.akela.ai/v1/mcp`
in `/plugin`.

### Where the skills come from

The skills are written in the Ops-Center repository, next to the MCP tools they teach,
and copied here by its CI on every release to production. Do not edit
`plugins/ops-center/skills/` in this repository: the next sync overwrites it. Change the
skill in Ops-Center instead.

This repository is public. Nothing in it may be secret.
