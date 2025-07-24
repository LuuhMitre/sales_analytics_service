from pydantic import BaseModel


# Schema for product data
class Product(BaseModel):
    id: int
    name: str
