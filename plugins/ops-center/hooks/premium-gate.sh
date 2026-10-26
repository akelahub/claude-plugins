#!/usr/bin/env bash
# PreToolUse on Ops-Center's search_source: a premium (paid) source makes
# Claude Code ask the user before the call runs. The server refuses premium
# calls without the user's approval too; this puts the question in front of
# the person instead of leaving it to the model.
#
# bash and grep only: no jq on every machine. OPS_CENTER_HOOKS=off turns it off.
[ "${OPS_CENTER_HOOKS:-on}" = "off" ] && exit 0

input=$(cat)
source=$(printf '%s' "$input" | grep -oE '"source"[[:space:]]*:[[:space:]]*"[a-z_]+"' | head -1 | sed -E 's/.*"([a-z_]+)"$/\1/')

case "$source" in
  "" | grounding | duckduckgo) exit 0 ;;
esac

reason="Ops-Center: $source is a premium source, billed to your organization (price: see list_sources). Allow this call?"
printf '{"hookSpecificOutput":{"hookEventName":"PreToolUse","permissionDecision":"ask","permissionDecisionReason":"%s"}}\n' "$reason"
