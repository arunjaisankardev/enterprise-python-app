from fastapi import APIRouter

router = APIRouter()

@router.get("/")
def version():
    return {"version": "1.0.0"}