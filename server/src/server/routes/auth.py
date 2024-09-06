import uuid
import bcrypt
from fastapi import APIRouter, HTTPException, Depends, status, Header
import jwt
from sqlalchemy.orm import Session
from server.database import get_db
from server.middleware.auth_middleware import auth_middleware
from server.models.user import User
from server.pydantic_schema.create_user import CreateUser
from server.pydantic_schema.login_user import LoginUser
from server.settings import Settings


router = APIRouter(tags=["Authentication"])

settings = Settings()

SECRET_KEY = settings.secret_key


@router.post("/signup", status_code=status.HTTP_201_CREATED)
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
        id=str(uuid.uuid4()),
        name=user.name,
        email=user.email,
        password=hash_password,
    )

    db.add(user_db)
    db.commit()
    db.refresh(user_db)

    return user_db


@router.post("/login", status_code=status.HTTP_202_ACCEPTED)
def login(user: LoginUser, db: Session = Depends(get_db)):
    user_db = db.query(User).filter(User.email == user.email).first()

    if not user_db:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Invalid credentials",
        )

    isPassword = bcrypt.checkpw(
        password=user.password.encode(),
        hashed_password=user_db.password,
    )

    if not isPassword:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Invalid credentials",
        )

    token = jwt.encode({"user_id": user_db.id}, SECRET_KEY)

    return {"token": token, "user": user_db}


@router.get("/")
def get_current_user_data(
    db: Session = Depends(get_db), user_dict=Depends(auth_middleware)
):

    user = db.query(User).filter(User.id == user_dict["uid"]).first()

    if not user:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND, detail="User not found"
        )

    return user
