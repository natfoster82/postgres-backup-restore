FROM postgres:9.6

WORKDIR /app

RUN apt-get update
RUN apt-get install s3cmd ca-certificates cron -y

ADD . /app

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/backup-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/backup-cron
RUN chmod 0644 /app/backup.sh

CMD ["/app/docker-entrypoint.sh"]
