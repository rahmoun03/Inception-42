FROM debian:11

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# COPY tools/init.sql /docker-entrypoint-initdb.d/

COPY tools/entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
