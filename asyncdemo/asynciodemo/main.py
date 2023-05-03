import asyncio

from fastapi import FastAPI


app = FastAPI()


@app.get('/sleep/{amount}')
async def read_root(amount: float) -> bool:
    await asyncio.sleep(amount)
    return True
