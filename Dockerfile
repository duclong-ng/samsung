 FROM docker-remote.bart.sec.samsung.net/python:3.11
 
 ENV PYTHONDONTWRITEBYTECODE 1
 ENV PYTHONUNBUFFERED 1
 ARG DEBUG
 ARG DB_HOST
 ARG DB_NAME
 ARG DB_USER
 ARG DB_PASSWORD
 ARG DB_PORT
 ARG REDIS_HOST
 ARG REDIS_PORT
 ARG REDIS_PASSWORD
 
 WORKDIR /app
 
 COPY conf/pip.conf /etc/pip.conf
 COPY requirements.txt /requirements.txt
 
 RUN pip install --upgrade pip
 RUN pip install -r /requirements.txt
 
 COPY entrypoint.sh /entrypoint.sh
 RUN chmod +x /entrypoint.sh
 
 COPY src/ /app
 
 EXPOSE 8000
