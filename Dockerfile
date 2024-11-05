# Použijeme oficiální Python image jako základ
FROM python:3.9-slim

# Nastavíme pracovní adresář v kontejneru
WORKDIR /app

# Zkopírujeme soubor requirements.txt do pracovního adresáře
COPY requirements.txt .

# Nainstalujeme závislosti
RUN pip install --no-cache-dir -r requirements.txt

# Zkopírujeme zbytek aplikace do pracovního adresáře
COPY . .

# Nastavíme proměnnou prostředí pro Flask
ENV FLASK_APP=app.py

# Otevřeme port 5000 pro Flask
EXPOSE 5000

# Definujeme příkaz pro spuštění aplikace
CMD ["flask", "run", "--host=0.0.0.0"]