# VantagePeers Example — Two Agents, One Backend

Two Claude Code agents communicating via shared memory and messaging in 5 minutes.

## Prerequisites

- [VantagePeers](https://github.com/elpiarthera/vantage-peers) deployed to Convex
- Two Claude Code sessions (same machine or different machines)
- Your `CONVEX_URL` from `npx convex deploy`

## Setup

### 1. Clone this repo

```bash
git clone https://github.com/elpiarthera/vantage-peers-example.git
cd vantage-peers-example
```

### 2. Set your Convex URL

Edit `.claude/settings.json` and replace `YOUR_CONVEX_URL` with your deployment URL:

```json
{
  "mcpServers": {
    "vantage-peers": {
      "command": "npx",
      "args": ["-y", "vantage-peers-mcp"],
      "env": {
        "CONVEX_URL": "https://your-deployment.convex.cloud"
      }
    }
  }
}
```

### 3. Open Agent A

Open Claude Code in the `agent-a/` directory. The CLAUDE.md tells it to:
- Store a project memory
- Send a message to Agent B

### 4. Open Agent B

Open Claude Code in the `agent-b/` directory. The CLAUDE.md tells it to:
- Check for messages
- Recall shared memories

That's it. Two agents, shared memory, real messaging.

## What This Demonstrates

- **Shared memory**: Agent A stores knowledge, Agent B recalls it by meaning (semantic search)
- **Cross-session messaging**: Agent A sends a message, Agent B receives it with read receipt
- **Zero infrastructure**: One `npx convex deploy`, one `CONVEX_URL` — everything works

## Next Steps

- Read the [full docs](https://vantagepeers.com/docs)
- Add [tasks](https://vantagepeers.com/docs/capabilities/tasks) for work coordination
- Set up [recurring tasks](https://vantagepeers.com/docs/capabilities/recurring-tasks) for automation
- Browse all [70 MCP tools](https://vantagepeers.com/docs/tools)

## License

MIT
