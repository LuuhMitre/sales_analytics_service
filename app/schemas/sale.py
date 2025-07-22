from pydantic import BaseModel
from datetime import date

# Schema for sales data


class Sale(BaseModel):
    sale_date: date
    product: str
    quantity: int
    price: float
