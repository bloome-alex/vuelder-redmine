# Imagen de la que parte nuestra imagen
FROM redmine:latest

# Agregar al usuario que ejecutará la aplicación
USER redmine

# Configuración de Redmine
ENV REDMINE_DB_MYSQL=db \
    REDMINE_DB_DATABASE=redmine \
    REDMINE_DB_USERNAME=redmine \
    REDMINE_DB_PASSWORD=3qJWZ8rM$&5xMxP \
    REDMINE_SECRET_KEY_BASE=some-secret-key \
    RAILS_ENV=production

# Configuración de la base de datos
RUN echo "production:" > config/database.yml \
 && echo "  adapter: mysql2" >> config/database.yml \
 && echo "  database: \${REDMINE_DB_DATABASE}" >> config/database.yml \
 && echo "  host: \${REDMINE_DB_MYSQL}" >> config/database.yml \
 && echo "  username: \${REDMINE_DB_USERNAME}" >> config/database.yml \
 && echo "  password: \${REDMINE_DB_PASSWORD}" >> config/database.yml \
 && echo "  encoding: utf8" >> config/database.yml

# Instalación de plugins (opcional)
# RUN git clone https://github.com/akiko-pusu/redmine_plugin_charts.git plugins/redmine_plugin_charts

# Exponer el puerto en el que escucha la aplicación
EXPOSE 3000

# Comando que se ejecutará al iniciar el contenedor
CMD ["rails", "server", "-b", "0.0.0.0"]