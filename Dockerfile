FROM python:latest

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /scripts
RUN chmod +x /scripts/wait-for-it.sh
ENTRYPOINT ["/scripts/wait-for-it.sh", "db:5432", "--"]

COPY . .

EXPOSE 5000


CMD ["python", "app.py", "runserver", "--host=0.0.0.0", "--threaded"]