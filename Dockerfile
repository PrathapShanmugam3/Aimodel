FROM ollama/ollama:latest

ENV OLLAMA_HOST=0.0.0.0:11434
EXPOSE 11434

# Bake 135MB model + custom Prathap model into image
RUN ollama serve & sleep 10 && ollama pull smollm2:135m && pkill ollama
COPY Modelfile /tmp/Modelfile
RUN ollama serve & sleep 5 && ollama create prathap:latest -f /tmp/Modelfile && pkill ollama

COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]



