FROM ollama/ollama:latest

ENV OLLAMA_HOST=0.0.0.0:11434
EXPOSE 11434

# SMALLEST model - 135M params, ~150MB RAM
RUN ollama serve & sleep 10 && ollama pull smollm2:135m && pkill ollama

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]

