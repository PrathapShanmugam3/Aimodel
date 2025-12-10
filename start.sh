#!/bin/sh
echo "Starting Ollama with custom Prathap model..."

# Create custom model from Modelfile (runs once)
ollama create prathap:latest -f /data/Modelfile || true

# Pull base model if needed
ollama pull smollm2:135m || true

echo "Prathap model ready!"
exec ollama serve

