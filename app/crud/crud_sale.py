from psycopg2.pool import SimpleConnectionPool
from typing import List, Dict
from .base import fetch_all


# Fetch all sales records from the database.
def get_all_sales(pool: SimpleConnectionPool) -> List[Dict]:
    return fetch_all(pool, 'SELECT * FROM sales ORDER BY activation_date DESC;')
