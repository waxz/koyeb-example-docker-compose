FROM ubuntu:24.04

WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
RUN apt update && apt install -y git curl bash jq moreutils inotify-tools

EXPOSE 5244
COPY ./start.sh /code/
RUN chmod +x /code/*.sh
CMD ["/code/start.sh"]
