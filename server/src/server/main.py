from fastapi import FastAPI
from server.models.base import Base
from .database import engine
from .routes import auth, song

app = FastAPI()

app.include_router(auth.router, prefix="/auth")
app.include_router(song.router, prefix="/song")


@app.get("/")
def home():
    return {"message": "Hello, World!"}


Base.metadata.create_all(engine)
