#!/bin/bash
# VantagePeers Example — One-command setup
# Usage: ./setup.sh
set -e

echo ""
echo "  VantagePeers Example Setup"
echo "  Two agents, shared memory, real messaging."
echo ""

# Check prerequisites
if ! command -v node &>/dev/null; then
  echo "Error: Node.js is required. Install from https://nodejs.org"
  exit 1
fi

if ! command -v npx &>/dev/null; then
  echo "Error: npx is required (comes with Node.js 18+)"
  exit 1
fi

# Ask for CONVEX_URL if not set
if [ -z "$CONVEX_URL" ]; then
  echo "Enter your Convex deployment URL"
  echo "(from 'npx convex deploy' — looks like https://xxx.convex.cloud):"
  echo ""
  read -p "  CONVEX_URL: " CONVEX_URL
  echo ""
fi

if [ -z "$CONVEX_URL" ]; then
  echo "Error: CONVEX_URL is required."
  echo ""
  echo "Don't have one yet? Run these commands first:"
  echo "  git clone https://github.com/elpiarthera/vantage-peers.git"
  echo "  cd vantage-peers && npm install && npx convex deploy"
  echo ""
  exit 1
fi

# Configure all settings.json files
for dir in .claude agent-a/.claude agent-b/.claude; do
  mkdir -p "$dir"
  cat > "$dir/settings.json" << SETTINGS
{
  "mcpServers": {
    "vantage-peers": {
      "command": "npx",
      "args": ["-y", "vantage-peers-mcp"],
      "env": {
        "CONVEX_URL": "$CONVEX_URL"
      }
    }
  }
}
SETTINGS
  echo "  Configured: $dir/settings.json"
done

echo ""
echo "  Setup complete!"
echo ""
echo "  Next steps:"
echo "  1. Open a terminal in agent-a/ and run: claude"
echo "  2. Open another terminal in agent-b/ and run: claude"
echo ""
echo "  Agent A will store a memory and send a message."
echo "  Agent B will receive the message and recall the memory."
echo ""
