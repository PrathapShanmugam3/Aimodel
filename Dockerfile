FROM ollama/ollama:latest

ENV OLLAMA_HOST=0.0.0.0:11434
EXPOSE 11434

# 4-bit model = ~600MB RAM (fits free tier)
RUN ollama serve & sleep 5 && ollama pull llama3.2:1b-q4_K_M && pkill ollama

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]

