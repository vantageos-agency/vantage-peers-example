# VantagePeers Example

[![License: FSL-1.1-Apache-2.0](https://img.shields.io/badge/License-FSL--1.1--Apache--2.0-blue.svg)](LICENSE)
[![Convex](https://img.shields.io/badge/Convex-Backend-orange.svg)](https://convex.dev)

**Two agents. Shared memory. Real messaging. Five minutes.**

```
Agent A                    Agent B
  |                           |
  |-- store_memory ---------->|  (shared Convex backend)
  |-- send_message ---------->|
  |                           |-- check_messages
  |                           |-- recall (semantic search)
  |<-- send_message ----------|
  |                           |
  +--- VantagePeers Backend --+
       (one Convex deployment)
```

## Prerequisites

1. **A Convex account** -- free tier at [convex.dev](https://dashboard.convex.dev). No credit card required.
2. **VantagePeers deployed** -- follow the [Getting Started guide](https://vantagepeers.com/docs/getting-started) or run:
   ```bash
   git clone https://github.com/elpiarthera/vantage-peers.git
   cd vantage-peers && npm install && npx convex deploy
   ```
   Copy the `CONVEX_URL` from the output.
3. **Two Claude Code sessions** -- same machine or different machines.

## Setup

### 1. Clone this repo

```bash
git clone https://github.com/elpiarthera/vantage-peers-example.git
cd vantage-peers-example
```

### 2. Set your Convex URL

Edit `agent-a/.claude/settings.json` and `agent-b/.claude/settings.json` -- replace `YOUR_CONVEX_URL` with your deployment URL:

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

Open Claude Code in the `agent-a/` directory:

```bash
cd agent-a && claude
```

The CLAUDE.md instructs Agent A to:
- Store a project memory in the shared backend
- Send a message to Agent B

### 4. Open Agent B

In a separate terminal, open Claude Code in `agent-b/`:

```bash
cd agent-b && claude
```

The CLAUDE.md instructs Agent B to:
- Check for messages from Agent A
- Recall shared memories via semantic search
- Reply to Agent A

### 5. Verify

Both agents should report successful memory storage, messaging, and recall. You can verify in the [Convex dashboard](https://dashboard.convex.dev) -- check the `memories`, `messages`, and `messageReceipts` tables.

## Troubleshooting

| Problem | Solution |
|---------|----------|
| `CONVEX_URL` error | Make sure you replaced `YOUR_CONVEX_URL` in both `agent-a/.claude/settings.json` and `agent-b/.claude/settings.json` |
| `npx vantage-peers-mcp` fails | Run `npx -y vantage-peers-mcp` manually to check for errors. Ensure Node.js 18+ is installed. |
| Agent B sees no messages | Make sure Agent A ran first. Check the `messages` table in the Convex dashboard. |
| `recall` returns empty | Embeddings take 2-5 seconds to index. Wait and retry. Ensure `OPENAI_API_KEY` is set on your Convex deployment. |

## What This Demonstrates

- **Shared memory** -- Agent A stores knowledge, Agent B recalls it by meaning (semantic search)
- **Cross-session messaging** -- Agent A sends a message, Agent B receives it with read receipt
- **Zero infrastructure** -- one `npx convex deploy`, one `CONVEX_URL`, everything works

## Next Steps

- Read the [full docs](https://vantagepeers.com/docs)
- Try the [Quickstart](https://vantagepeers.com/docs/getting-started/quickstart) for a deeper walkthrough
- Add [tasks](https://vantagepeers.com/docs/capabilities/tasks) for work coordination
- Browse all [70 MCP tools](https://vantagepeers.com/docs/tools)
- See [Supported Tools](https://vantagepeers.com/docs/getting-started/supported-tools) for Cursor, Codex, Windsurf, and 9 more

## License

[FSL-1.1-Apache-2.0](LICENSE) -- source-available, free to self-host, converts to Apache 2.0 after 2 years.

---

Built with [VantagePeers](https://github.com/elpiarthera/vantage-peers) -- the open-source coordination backend for AI agent teams.
