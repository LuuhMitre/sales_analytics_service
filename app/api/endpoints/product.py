from fastapi import APIRouter, Depends
from typing import List
from app.schemas.product import Product
from app.crud import crud_product
from app.api import deps
from psycopg2.pool import SimpleConnectionPool

router = APIRouter()


@router.get(
    '/products',
    response_model=List[Product],
    dependencies=[Depends(deps.verify_api_key)]
)
def read_products(pool: SimpleConnectionPool = Depends(deps.get_database_pool)):
    return crud_product.get_all_products(pool)
