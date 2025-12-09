FROM ollama/ollama:latest

ENV OLLAMA_HOST=0.0.0.0:11434
EXPOSE 11434

# PROVEN 3B model that EXISTS (~400MB RAM)
RUN ollama serve & sleep 10 && ollama pull phi3:3.8b-mini-4k-instruct-q4_K_M && pkill ollama

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]

