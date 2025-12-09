#!/bin/sh
set -e

echo "Starting Ollama server..."
/bin/ollama serve &

OLLAMA_PID=$!

# Wait for server to be ready
echo "Waiting for Ollama to be ready..."
until curl -s https://aimodel-cwju.onrender.com/api/tags >/dev/null 2>&1; do
  sleep 1
done

# Check if model exists
if curl -s https://aimodel-cwju.onrender.com/api/tags | grep -q '"name":"llama3.2:1b"'; then
  echo "Model llama3.2:1b already present, not pulling."
else
  echo "Model not found, pulling llama3.2:1b..."
  ollama pull llama3.2:1b || echo "Pull failed, but server will keep running."
fi

echo "Ollama ready. PID=$OLLAMA_PID"
wait "$OLLAMA_PID"
