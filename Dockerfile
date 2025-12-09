# Use official Ollama image
FROM ollama/ollama:latest

# Ollama listens on 11434 by default
EXPOSE 11434

# Make sure Ollama binds to all interfaces
ENV OLLAMA_HOST=0.0.0.0

# Pre-pull a smaller model during container start (not at build time).
# This avoids Render build timeouts and huge image size.
#
# Flow:
# 1) start ollama server in background
# 2) wait a bit so server is ready
# 3) pull llama3.2:1b (≈1.3 GB, OK for free tier)
# 4) keep ollama serve in foreground as main process
CMD ["/bin/sh", "-lc", "\
  echo 'Starting Ollama server...' && \
  ollama serve & \
  sleep 25 && \
  echo 'Pulling model llama3.2:1b (one-time)...' && \
  ollama pull llama3.2:1b || echo 'Model already present or pull failed, continuing...' && \
  echo 'Ollama is ready to accept requests on 0.0.0.0:11434' && \
  wait"]
