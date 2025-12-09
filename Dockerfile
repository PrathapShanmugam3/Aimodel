FROM ollama/ollama:latest

# Expose Ollama port
EXPOSE 11434

# Pull llama3.2 on startup
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["ollama serve & sleep 10 && ollama pull llama3.2:latest && ollama serve"]
