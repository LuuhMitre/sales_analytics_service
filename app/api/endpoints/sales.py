from fastapi import APIRouter, Depends
from typing import List
from app.schemas.sale import Sale
from app.crud import crud_sale
from app.api import deps
from psycopg2.pool import SimpleConnectionPool

router = APIRouter()


@router.get(
    '/sales',
    response_model=List[Sale],
    dependencies=[Depends(deps.verify_api_key)]
)
def read_sales(pool: SimpleConnectionPool = Depends(deps.get_database_pool)):
    return crud_sale.get_all_sales(pool)
