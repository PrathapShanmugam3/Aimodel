#!/bin/sh
set -e

echo "Starting Ollama server..."
/bin/ollama serve &

OLLAMA_PID=$!

echo "Waiting for Ollama to be ready..."
until curl -s http://localhost:11434/api/tags >/dev/null 2>&1; do
  sleep 1
done

if curl -s http://localhost:11434/api/tags | grep -q '"name":"llama3.2:1b"'; then
  echo "Model llama3.2:1b already present, skipping pull."
else
  echo "Model not found, pulling llama3.2:1b..."
  ollama pull llama3.2:1b || echo "Pull failed, continuing with server only."
fi

echo "Ollama ready."
wait "$OLLAMA_PID"
