FROM postgres:9.6

WORKDIR /app

RUN apt-get update
RUN apt-get install s3cmd ca-certificates cron -y

ADD . /app

RUN mkdir /etc/cron.d/backup-cron/
RUN chmod 0644 /etc/cron.d/backup-cron/
RUN chmod 0644 /app/backup.sh
RUN chmod +x /app/docker-entrypoint.sh

CMD ["/app/docker-entrypoint.sh"]
