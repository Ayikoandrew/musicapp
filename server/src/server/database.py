from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

from server.settings import Settings

settings = Settings()

DATABASE_URL = settings.database_url

engine = create_engine(
    DATABASE_URL,
)

LocalSession = sessionmaker(
    autocommit=False,
    autoflush=False,
    bind=engine,
)


def get_db():
    db = LocalSession()
    try:
        yield db
    finally:
        db.close()
