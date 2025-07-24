from pydantic import BaseModel
from decimal import Decimal


# Schema for seller data
class Seller(BaseModel):
    id: int
    name: str
    monthly_target: Decimal
    installation_target: Decimal
