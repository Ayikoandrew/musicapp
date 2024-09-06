from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    secret_key: str
    database_url: str

    model_config = SettingsConfigDict(env_file=".env", env_file_encoding="utf-8")
