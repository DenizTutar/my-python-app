# 1. Python'ın resmi, hafif sürümünü temel al
FROM python:3.11-slim

# 2. Konteyner içindeki çalışma klasörünü ayarla
WORKDIR /app

# 3. Önce gereksinim dosyasını kopyala
COPY requirements.txt .

# 4. Gerekli kütüphaneleri yükle (Flask vb.)
RUN pip install --no-cache-dir -r requirements.txt

# 5. Kalan tüm kod dosyalarını (app.py) kopyala
COPY . .

# 6. Dış dünyaya 5000 portunu açacağını belirt
EXPOSE 5000

# 7. Çevre değişkenini ayarla
ENV FLASK_APP=app.py

# 8. Konteyner başladığında çalışacak komutu ver
CMD ["flask", "run", "--host=0.0.0.0"]