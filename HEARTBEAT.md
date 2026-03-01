# HEARTBEAT.md - Periodic Checks

Use local Ollama (qwen) for ALL heartbeat tasks to save tokens. Use MiniMax only for complex reasoning.

## Token Strategy
- **Local Qwen**: Heartbeats, routine checks, light tasks (FREE)
- **MiniMax**: Complex reasoning, research, analysis when needed
- Tokens reset every 5 hours - don't worry about quota

## Morning Report (Daily after 6 AM CST)
- Read previous day's memory notes
- Check GitHub for any new commits/activity
- Review property alerts (real-estate-scanner)
- Compile morning report to memory/morning-reports/YYYY-MM-DD.md
- Post to chat if significant updates

## Tasks (Rotate 2-4x/day):
- **Scraper Health**: Check http://localhost:3000/health - if down, restart with: `cd /home/claw/.openclaw/workspace/real-estate-scanner/docs && nohup node server.js > /tmp/scraper.log 2>&1 &`
- **Dashboard Health**: Check http://localhost:5000/api/health - if down, restart with: `cd /home/claw/.openclaw/workspace/dashboard && nohup python3 dashboard.py > /tmp/dashboard.log 2>&1 &`
- **Emails**: Any urgent unread? (Use himalaya skill if set up)
- **Calendar**: Upcoming events in next 24h? (If calendar tool available)
- **Weather**: Quick Ft. Worth forecast? (Use weather skill)

For light tasks (e.g., weather, status), use tinyllama: ./ollama_wrapper.sh "tinyllama" "Check [task] and summarize briefly."

For heavier ones (e.g., emails, calendar analysis), use qwen: ./ollama_wrapper.sh "qwen" "Check [task] and summarize briefly."

## Token Check & Auto-Switch (DEPRECATED)
Tokens reset every 5 hours and we have unlimited local Qwen - don't worry about costs.
- Use qwen locally for heartbeats (FREE)
- Use MiniMax for complex tasks only

## Scraper Server Commands
- Start: `cd /home/claw/.openclaw/workspace/real-estate-scanner/docs && SCRAPER_API_KEY=your_key_here nohup node server.js > /tmp/scraper.log 2>&1 &`
- Check: `curl -s http://localhost:3000/health`
- Logs: `tail /tmp/scraper.log`

## Dashboard Server Commands
- Start: `cd /home/claw/.openclaw/workspace/dashboard && nohup python3 dashboard.py > /tmp/dashboard.log 2>&1 &`
- Check: `curl -s http://localhost:5000/api/health`
- Logs: `tail /tmp/dashboard.log`
- URL: http://localhost:5000

Reply HEARTBEAT_OK if nothing needs attention.
