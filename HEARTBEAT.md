# HEARTBEAT.md - Periodic Checks on Local Model

Use the Ollama wrapper for all heartbeat tasks to save tokens. Check every ~30min (system polls).

## Tasks (Rotate 2-4x/day):
- Emails: Any urgent unread? (Use himalaya skill if set up)
- Calendar: Upcoming events in next 24h? (If calendar tool available)
- Weather: Quick Ft. Worth forecast? (Use weather skill)
- System: OpenClaw status check for issues/limits.

For light tasks (e.g., weather, status), use tinyllama: ./ollama_wrapper.sh "tinyllama" "Check [task] and summarize briefly."

For heavier ones (e.g., emails, calendar analysis), use qwen: ./ollama_wrapper.sh "qwen" "Check [task] and summarize briefly."

## Token Check & Auto-Switch
Run session_status; if tokens in >100k or cost >$0.01, alert: "Tokens/cost high – switching to local!" then use session_status model='ollama/tinyllama' (light) or 'ollama/qwen' (heavy) based on need.

If on local and tokens reset, switch back to grok-4.

Reply HEARTBEAT_OK if nothing needs attention.
