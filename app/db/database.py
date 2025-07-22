import psycopg2
from psycopg2.pool import SimpleConnectionPool
from app.core.config import settings
import logging

# Construct the database URL using the settings
DATABASE_URL = (
    f'dbname={settings.DB_NAME} '
    f'user={settings.DB_USER} '
    f'password={settings.DB_PASSWORD} '
    f'host={settings.DB_SERVER} '
    f'port={settings.DB_PORT}'
)

# Initialize the connection pool
db_pool = None

# Get the database connection pool, creating it if it doesn't exist.


def get_db_pool():
    global db_pool
    if db_pool is None:
        logging.info("Initializing PostgreSQL connection pool.")
        try:
            db_pool = SimpleConnectionPool(
                minconn=1, maxconn=10, dsn=DATABASE_URL)
            logging.info("Database connection pool created successfully.")
        except psycopg2.OperationalError as e:
            logging.error(f"Error creating database connection pool: {e}")
            raise
    return db_pool

# Close the database connection pool if it exists


def close_db_pool():
    global db_pool
    if db_pool:
        logging.info("Database connection pool closed.")
        db_pool.closeall()
