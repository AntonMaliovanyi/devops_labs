# Використання офіційного образу Python
FROM python:3.11.2

# Встановлення робочої директорії
WORKDIR /app

# Копіюємо вимоги для встановлення залежностей
COPY requirements.txt ./

# Встановлюємо залежності з requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо весь код у робочу директорію контейнера
COPY . .

# Відкриваємо порт, який використовує Flask (наприклад, 5000)
EXPOSE 5000

# Запускаємо Flask-сервер
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]
