from pydantic import BaseModel
from datetime import date
from decimal import Decimal


# Schema for sales data
class Sale(BaseModel):
    id: int
    company: str
    monthly_fee: Decimal
    installation_fee: Decimal
    contract_type: str
    sale_date: date
    activation_date: date
    product_id: int
    seller_id: int

    # Enable ORM mode to allow compatibility with ORM models
    class Config:
        orm_mode = True
