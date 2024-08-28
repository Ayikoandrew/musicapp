import uuid
import bcrypt
from fastapi import APIRouter, HTTPException, Depends, status
from sqlalchemy.orm import Session
from server.database import get_db
from server.models.user import User
from server.pydantic_schema.create_user import CreateUser


router = APIRouter()


@router.post("/signup")
def signup(user: CreateUser, db: Session = Depends(get_db)):
    user_db = db.query(User).filter(User.email == user.email).first()

    if user_db:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST, detail="Email already exists."
        )

    hash_password = bcrypt.hashpw(
        password=user.password.encode(),
        salt=bcrypt.gensalt(),
    )

    user_db = User(
        id=uuid.uuid4(),
        name=user.name,
        email=user.email,
        password=hash_password,
    )

    db.add(user_db)
    db.commit()
    db.refresh(user_db)

    return user_db
