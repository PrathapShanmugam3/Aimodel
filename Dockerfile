FROM ollama/ollama:latest

# Ollama listens on 11434
EXPOSE 11434

# Make Ollama listen on all interfaces
ENV OLLAMA_HOST=0.0.0.0

# Override the default entrypoint (which is `ollama`)
ENTRYPOINT ["/bin/sh", "-lc"]

# Start server, give it time to boot, then pull the smaller model once
CMD "\
  echo 'Starting Ollama server...' && \
  ollama serve & \
  sleep 25 && \
  echo 'Pulling model llama3.2:1b ...' && \
  ollama pull llama3.2:1b || echo 'Model already present or pull failed, continuing...' && \
  echo 'Ollama is ready on 0.0.0.0:11434' && \
  wait"
