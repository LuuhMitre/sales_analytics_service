from pydantic_settings import BaseSettings


# Settings class to manage application configuration
class Settings(BaseSettings):
    # Database configuration    
    DATABASE_URL: str

    # API configuration
    API_KEY: str

    class Config:
        # Load environment variables from a .env file
        env_file = '.env'


# Create a settings instance to access the configuration
settings = Settings()  # type: ignore
