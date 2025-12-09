FROM ollama/ollama:latest

ENV OLLAMA_HOST=0.0.0.0:11434
EXPOSE 11434

# Copy start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Use our script as entrypoint
ENTRYPOINT ["/start.sh"]
