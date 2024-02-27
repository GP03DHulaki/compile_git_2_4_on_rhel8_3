#!/bin/bash

# Install pgloader
# Assuming the pgloader .deb package and its dependencies have been correctly downloaded
# Replace with the actual path and filename of your pgloader package
echo "Starting pgloader installation..."
sudo dpkg -i /path/to/pgloader_package.deb
echo "pgloader installation completed."

# Migrate data from MySQL to PostgreSQL using pgloader
# Replace the following variable values to match your environment
MYSQL_USER="your_mysql_user"
MYSQL_PASSWORD="your_mysql_password"
MYSQL_DB_NAME="your_mysql_db_name"
POSTGRES_USER="your_postgres_user"
POSTGRES_PASSWORD="your_postgres_password"
POSTGRES_DB_NAME="your_postgres_db_name"

echo "Starting data migration from MySQL to PostgreSQL..."
pgloader mysql://$MYSQL_USER:$MYSQL_PASSWORD@localhost/$MYSQL_DB_NAME \
         postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@localhost/$POSTGRES_DB_NAME
echo "Data migration completed."
