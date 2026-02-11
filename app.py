from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def home():
	return f"Hello mentorship team"