import uuid
from fastapi import APIRouter, Depends, File, Form, UploadFile
from sqlalchemy.orm import Session
import cloudinary
import cloudinary.uploader

from server.database import get_db
from server.middleware.auth_middleware import auth_middleware
from server.models.song import Song
from server.settings import Settings

settings = Settings()

router = APIRouter()


# Configuration
cloudinary.config(
    cloud_name=settings.cloud_name,
    api_key=settings.api_key,
    api_secret=settings.api_secret,  # Click 'View API Keys' above to copy your API secret
    secure=True,
)


@router.post("/upload")
def upload_music(
    song: UploadFile = File(...),
    thumbnail: UploadFile = File(...),
    artist: str = Form(...),
    song_name: str = Form(...),
    hex_code: str = Form(...),
    db: Session = Depends(get_db),
    auth_dict=Depends(auth_middleware),
):
    song_id = str(uuid.uuid4())
    song_res = cloudinary.uploader.upload(
        song.file, resource_type="auto", folder=f"songs/{song_id}"
    )
    thumbnail_res = cloudinary.uploader.upload(
        thumbnail.file, resource_type="auto", folder=f"songs/{song_id}"
    )

    new_song = Song(
        id=song_id,
        song_name=song_name,
        artist=artist,
        hex_code=hex_code,
        song_url=song_res["url"],
        thumbnail_url=thumbnail_res["url"],
    )

    db.add(new_song)
    db.commit()
    db.refresh(new_song)

    return new_song
