from fastapi import FastAPI
from backend.app.api.health import router as health_router
from backend.app.api.version import router as version_router

app = FastAPI(title="Enterprise Backend API")

app.include_router(health_router, prefix="/health")
app.include_router(version_router, prefix="/version")