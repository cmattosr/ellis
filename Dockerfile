FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho no contêiner
WORKDIR /app

# Copia o arquivo de dependências primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante dos arquivos da aplicação para o diretório de trabalho
COPY . .

# Expõe a porta em que a aplicação será executada
EXPOSE 8000

# Comando para iniciar a aplicação com Uvicorn
# Garante que a aplicação esteja acessível de fora do contêiner
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
