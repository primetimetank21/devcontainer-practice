from datetime import datetime, timezone
from typing import Final
from fastapi import FastAPI
from redis.typing import ResponseT
import redis

app = FastAPI()
r = redis.Redis(host="redis-db", port=6379, decode_responses=True)


@app.get("/")
async def read_root():
    LAST_LOGIN_KEY: Final[str] = "last_login"
    CURRENT_LOGIN_KEY: Final[str] = "current_login"

    login_time: str = datetime.now(tz=timezone.utc).strftime("%d_%B_%Y_at_%H:%M:%S")

    last_logged_in: ResponseT = r.get(LAST_LOGIN_KEY)
    print(f"{last_logged_in=}")
    print(f"{last_logged_in=}")

    root_response: dict[str, str | ResponseT] = {"Hello": "World"}

    if last_logged_in:
        root_response[LAST_LOGIN_KEY] = last_logged_in

    r.set(name=LAST_LOGIN_KEY, value=login_time)

    root_response[CURRENT_LOGIN_KEY] = login_time

    return root_response


@app.get("/hits")
def read_hits():
    r.incr("hits")
    return {"num_hits": r.get("hits")}
