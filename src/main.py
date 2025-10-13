from fastapi import FastAPI
import redis

app = FastAPI()
r = redis.Redis(host="redis-db", port=6379)


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/hits")
def read_hits():
    r.incr("hits")
    return {"num_hits": r.get("hits")}
