#!/bin/bash
# ollama_wrapper.sh - Query Ollama via curl
MODEL="${1:-tinyllama}"
PROMPT="$2"
curl -s http://localhost:11434/api/generate -d "{\"model\": \"$MODEL\", \"prompt\": \"$PROMPT\"}" | jq -s 'map(.response) | join("")'