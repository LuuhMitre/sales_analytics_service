from psycopg2.pool import SimpleConnectionPool
from typing import List, Dict
from .base import fetch_all


# Fetch all seller records from the database.
def get_all_sellers(pool: SimpleConnectionPool) -> List[Dict]:
    return fetch_all(pool, 'SELECT * FROM sellers ORDER BY name ASC;')
