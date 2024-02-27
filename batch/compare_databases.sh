#!/bin/bash

# Export MySQL database
MYSQL_USER="your_mysql_user"
MYSQL_PASSWORD="your_mysql_password"
MYSQL_DB_NAME="your_mysql_db_name"
mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DB_NAME > mysql_dump.sql

# Export PostgreSQL database
POSTGRES_USER="your_postgres_user"
POSTGRES_DB_NAME="your_postgres_db_name"
PGPASSWORD="your_postgres_password" pg_dump -U $POSTGRES_USER $POSTGRES_DB_NAME > postgres_dump.sql

# Compare the two export files
echo "Comparing the two databases..."
diff mysql_dump.sql postgres_dump.sql > db_diff.txt

if [ $? -eq 0 ]; then
    echo "The databases are consistent."
else
    echo "The databases are not consistent, please check db_diff.txt for differences."
fi
