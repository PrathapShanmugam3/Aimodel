FROM ollama/ollama:latest

ENV OLLAMA_HOST=0.0.0.0:11434
EXPOSE 11434

# Pre-pull model during build (only once per base image change)
RUN ollama serve & sleep 5 && ollama pull llama3.2:1b && pkill ollama

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
