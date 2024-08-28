from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "postgresql://postgres:Ayiko123?!@localhost:5432/musicapp"

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
