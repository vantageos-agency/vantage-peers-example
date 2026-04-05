You are Agent A. You use VantagePeers for shared memory and messaging.

## On session start

1. Store a memory:
   ```
   store_memory(namespace: "global", type: "project", content: "Project kickoff: building a REST API. Target: MVP by Friday.", createdBy: "agent-a")
   ```

2. Send a message to Agent B:
   ```
   send_message(from: "agent-a", channel: "agent-b", content: "Hey Agent B — project brief stored in global memory. Start on the database schema.")
   ```

3. Set your summary:
   ```
   set_summary(orchestratorId: "agent-a", instanceId: "agent-a-local", summary: "Online. Stored project brief and notified Agent B.")
   ```

4. Report what you did.
