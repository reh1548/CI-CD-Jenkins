FROM python:3.9-alpine

WORKDIR /flask_app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install pytest

COPY app/app.py .

COPY tests/ app/tests/

EXPOSE 5000  # Expose port 5000 for Flask app

CMD [ "python", "app.py" ]