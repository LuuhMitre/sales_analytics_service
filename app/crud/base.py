from psycopg2.pool import SimpleConnectionPool
from psycopg2.extras import RealDictCursor
from typing import List, Dict


def fetch_all(pool: SimpleConnectionPool, sql_query: str) -> List[Dict]:
    # Get a connection from the pool
    try:
        conn = pool.getconn()
        with conn.cursor(cursor_factory=RealDictCursor) as cursor:
            cursor.execute(sql_query)
            results = cursor.fetchall()
            return results
    finally:
        if conn:
            pool.putconn(conn)
