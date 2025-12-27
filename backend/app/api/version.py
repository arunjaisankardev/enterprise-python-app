from fastapi import APIRouter

router = APIRouter()

@router.get("/")
def app_info():
    return {
        "app_name": "Enterprise Platform",
        "version": "1.0.0",
        "environment": "development"
    }
