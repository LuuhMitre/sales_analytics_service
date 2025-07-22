from pydantic_settings import BaseSettings


# Settings class to manage application configuration
class Settings(BaseSettings):
    # Database configuration read from environment variables
    DB_NAME: str
    DB_USER: str
    DB_PASSWORD: str
    DB_SERVER: str
    DB_PORT: str

    # API configuration
    API_KEY: str

    class Config:
        # Load environment variables from a .env file
        env_file = '.env'


# Create a settings instance to access the configuration
settings = Settings()  # type: ignore
