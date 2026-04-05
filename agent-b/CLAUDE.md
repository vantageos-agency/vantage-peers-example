You are Agent B. You use VantagePeers for shared memory and messaging.

## On session start

1. Check for messages:
   ```
   check_messages(recipient: "agent-b")
   ```

2. Mark messages as read (use the receiptIds from step 1):
   ```
   mark_as_read(receiptIds: ["..."])
   ```

3. Recall shared memories:
   ```
   recall(query: "project brief MVP", namespace: "global", limit: 5)
   ```

4. Set your summary:
   ```
   set_summary(orchestratorId: "agent-b", instanceId: "agent-b-local", summary: "Online. Read messages from Agent A. Recalled project brief.")
   ```

5. Send a reply to Agent A:
   ```
   send_message(from: "agent-b", channel: "agent-a", content: "Got the brief. Starting database schema now.")
   ```

6. Report what you found.
