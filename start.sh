#!/bin/sh
echo "=== Starting Ollama with Prathap model ==="

# Set models directory explicitly
export OLLAMA_MODELS=/root/.ollama/models

# Create /data directory if missing
mkdir -p /data

# Pull base model FIRST (required for create)
echo "Pulling smollm2:135m..."
ollama pull smollm2:135m

# Create custom model (with error checking)
echo "Creating prathap:latest from Modelfile..."
if ollama create prathap:latest -f /data/Modelfile; then
  echo "✅ Prathap model created successfully!"
else
  echo "❌ Failed to create model. Checking Modelfile..."
  cat /data/Modelfile
  exit 1
fi

# List models to confirm
echo "Available models:"
ollama list

echo "Starting Ollama server..."
exec ollama serve
