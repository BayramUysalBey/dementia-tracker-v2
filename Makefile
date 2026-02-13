.PHONY: run install build clean

ifeq ($(OS),Windows_NT)
PYTHON = python
PIP = pip
else
PYTHON = python3
PIP = pip3
endif

install: requirements.txt
	$(PIP) install -r requirements.txt

# FastAPI run command
run:
	$(PYTHON) -m uvicorn app:app --reload

build: setup.py
	$(PYTHON) setup.py build bdist_wheel

clean:
ifeq ($(OS),Windows_NT)
	if exist "build" rd /s /q build
	if exist "dist" rd /s /q dist
	if exist "dementia_tracker_v2.egg-info" rd /s /q dementia_tracker_v2.egg-info
else
	rm -rf build dist dementia_tracker_v2.egg-info
	find . -type d -name "__pycache__" -exec rm -rf {} +
endif