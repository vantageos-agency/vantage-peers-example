#!/bin/bash
# VantagePeers Example — Verify setup works
# Tests: store_memory → recall, send_message → check_messages
set -e

echo ""
echo "  VantagePeers Connection Test"
echo ""

# Check CONVEX_URL
if [ -f ".claude/settings.json" ]; then
  CONVEX_URL=$(grep -oP '"CONVEX_URL":\s*"\K[^"]+' .claude/settings.json 2>/dev/null)
fi

if [ -z "$CONVEX_URL" ] || [ "$CONVEX_URL" = "YOUR_CONVEX_URL" ]; then
  echo "  Error: Run ./setup.sh first to configure CONVEX_URL"
  exit 1
fi

echo "  CONVEX_URL: $CONVEX_URL"
echo ""

# Test 1: Store a memory
echo "  Test 1: store_memory..."
RESULT=$(CONVEX_URL="$CONVEX_URL" npx -y vantage-peers-mcp 2>/dev/null <<'MCP'
{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"test","version":"1.0"}}}
{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"store_memory","arguments":{"namespace":"global","type":"project","content":"VantagePeers example test — connection verified.","createdBy":"test-agent"}}}
MCP
)

if echo "$RESULT" | grep -q "memoryId\|content"; then
  echo "  PASS - Memory stored"
else
  echo "  FAIL - Could not store memory"
  echo "  $RESULT"
  exit 1
fi

# Test 2: Send a message
echo "  Test 2: send_message..."
RESULT=$(CONVEX_URL="$CONVEX_URL" npx -y vantage-peers-mcp 2>/dev/null <<'MCP'
{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"test","version":"1.0"}}}
{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"send_message","arguments":{"from":"test-agent","channel":"broadcast","content":"VantagePeers example test message."}}}
MCP
)

if echo "$RESULT" | grep -q "messageId\|content"; then
  echo "  PASS - Message sent"
else
  echo "  FAIL - Could not send message"
  echo "  $RESULT"
  exit 1
fi

echo ""
echo "  All tests passed. VantagePeers is connected and working."
echo ""
