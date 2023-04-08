# Imagen de la que parte nuestra imagen
FROM redmine:latest

# Agregar al usuario que ejecutará la aplicación
USER redmine

# Configurar la base de datos de Redmine
RUN echo "production:" > /usr/src/redmine/config/database.yml && \
    echo "  adapter: mysql2" >> /usr/src/redmine/config/database.yml && \
    echo "  database: ${MYSQLDATABASE}" >> /usr/src/redmine/config/database.yml && \
    echo "  host: ${MYSQLHOST}" >> /usr/src/redmine/config/database.yml && \
    echo "  port: ${MYSQLPORT}" >> /usr/src/redmine/config/database.yml && \
    echo "  username: ${MYSQLUSER}" >> /usr/src/redmine/config/database.yml && \
    echo "  password: ${MYSQLPASSWORD}" >> /usr/src/redmine/config/database.yml && \
    echo "  encoding: utf8" >> /usr/src/redmine/config/database.yml && \
    echo "  collation: utf8_general_ci" >> /usr/src/redmine/config/database.yml

# Exponer el puerto en el que escucha la aplicación
EXPOSE 3000

# Comando que se ejecutará al iniciar el contenedor
CMD ["rails", "server", "-b", "0.0.0.0"]

# tema
COPY gitmike /usr/src/redmine/public/themes/gitmike/