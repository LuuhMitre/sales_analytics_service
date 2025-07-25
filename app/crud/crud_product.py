from psycopg2.pool import SimpleConnectionPool
from typing import List, Dict
from .base import fetch_all


# Fetch all products records from the database.
def get_all_products(pool: SimpleConnectionPool) -> List[Dict]:
    return fetch_all(pool, 'SELECT * FROM products ORDER BY id ASC;')
