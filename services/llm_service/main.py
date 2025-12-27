from fastapi import FastAPI

app = FastAPI(title="LLM Service")

@app.get("/generate")
def generate():
    return {"response": "LLM output placeholder"}