from fastapi import HTTPException, status, Header
import jwt
from server.settings import Settings

settings = Settings()


def auth_middleware(x_auth_token=Header()):
    SECRET_KEY = settings.secret_key
    try:
        if not x_auth_token:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED, detail="Access Denied!"
            )

        verified_token = jwt.decode(x_auth_token, key=SECRET_KEY, algorithms=["HS256"])

        if not verified_token:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED, detail="Access Denied"
            )

        uid = verified_token.get("user_id")
        return {"uid": uid, "token": x_auth_token}
    except jwt.PyJWTError:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Token is not valid, authorization failed.",
        )
