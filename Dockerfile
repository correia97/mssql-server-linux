FROM mcr.microsoft.com/mssql/server:2019-latest
LABEL AUTHOR="Luiz Carlos Faria <luizcarlosfaria@gmail.com>"
# RUN cat /etc/*release
# RUN cat /etc/passwd

VOLUME /docker-entrypoint-initdb.d

ENV MSSQL_DATABASE_COLLATE=SQL_Latin1_General_CP1_CI_AI

EXPOSE 1433
# Necessário trocar o usuário para o root devido ao permissão na pasta /opt/mssql-tools/bin
USER root

RUN ln -s /opt/mssql-tools/bin/sqlcmd   /usr/local/bin/sqlcmd \
    && ln -s /opt/mssql-tools/bin/bcp   /usr/local/bin/bcp

COPY ./docker-entrypoint.sh             /usr/local/bin/

COPY ./docker-entrypoint-initdb.sh      /usr/local/bin/

RUN chmod +x /usr/local/bin/docker-entrypoint.sh \
   && chmod +x /usr/local/bin/docker-entrypoint-initdb.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]