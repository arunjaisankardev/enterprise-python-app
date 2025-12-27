import requests

def call_llm():
    r = requests.get("http://localhost:8001/generate")
    return r.json()