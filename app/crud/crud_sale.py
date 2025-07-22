from psycopg2.pool import SimpleConnectionPool
from psycopg2.extras import RealDictCursor
from typing import List, Dict

# Fetch all sales records from the database.


def get_all_sales(pool: SimpleConnectionPool) -> List[Dict]:
    sql_query = 'SELECT sale_date, product, quantity, price FROM sales ORDER BY sale_date DESC;'

    conn = None

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
