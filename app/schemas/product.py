from pydantic import BaseModel


# Schema for product data
class Product(BaseModel):
    id: int
    name: str

    # Enable ORM mode to allow compatibility with ORM models
    class Config:
        from_attributes = True
