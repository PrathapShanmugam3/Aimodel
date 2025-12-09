FROM ollama/ollama:latest

ENV OLLAMA_HOST=0.0.0.0:11434
EXPOSE 11434

# PROVEN small model for free tier
RUN ollama serve & sleep 10 && ollama pull phi3.2:mini && pkill ollama

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
