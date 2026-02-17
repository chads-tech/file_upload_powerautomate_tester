FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY jaron_functionapp_api.py .

EXPOSE 8000

CMD ["uvicorn", "jaron_functionapp_api:app", "--host", "0.0.0.0", "--port", "8000"]
