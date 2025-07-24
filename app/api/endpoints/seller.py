from fastapi import APIRouter, Depends
from typing import List
from app.schemas.seller import Seller
from app.crud import crud_seller
from app.api import deps
from psycopg2.pool import SimpleConnectionPool

router = APIRouter()


@router.get(
    '/sellers',
    response_model=List[Seller],
    dependencies=[Depends(deps.verify_api_key)]
)
def read_sellers(pool: SimpleConnectionPool = Depends(deps.get_database_pool)):
    return crud_seller.get_all_sellers(pool)
