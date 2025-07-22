from fastapi import FastAPI
from contextlib import asynccontextmanager
from app.api.endpoints import sales
from app.db.database import get_db_pool, close_db_pool
from fastapi.middleware.cors import CORSMiddleware
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)


# Lifespan event handler for FastAPI
@asynccontextmanager
async def lifespan(app: FastAPI):
    # Initialize the database connection pool
    get_db_pool()
    try:
        yield
    finally:
        # Close the database connection pool when the app shuts down
        close_db_pool()

# Create the FastAPI application instance
app = FastAPI(
    title=' Sales Analytics API',
    description='API to provide sales KPI data for BI dashboards using FastAPI and PostgreSQL.',
    version='1.0.0',
    lifespan=lifespan
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Permite todas as origens (para desenvolvimento)
    allow_credentials=True,
    allow_methods=["*"],  # Permite todos os métodos (GET, POST, etc)
    allow_headers=["*"],  # Permite todos os cabeçalhos
)

app.include_router(sales.router, prefix='/kpi', tags=['KPIs'])


@app.get('/', tags=['Root'])
def read_root():
    return {'message': 'Sales Analytics Service is running!'}
