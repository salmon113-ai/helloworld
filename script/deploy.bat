@echo off

:: 1. Poetry 설치 확인 및 설치
echo Checking for Poetry...
where poetry >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Poetry가 설치되어 있지 않습니다. 설치를 진행합니다.
    curl -sSL https://install.python-poetry.org | python
    setx PATH "%USERPROFILE%\.local\bin;%PATH%"
)

:: 2. 의존성 설치
echo Installing dependencies with Poetry...
if exist poetry.lock (
    poetry install
) else (
    poetry install --no-root
)

:: 3. Flask 환경 설정
echo Setting up Flask environment...
set FLASK_APP=app.py
set FLASK_ENV=development

:: 4. Flask 애플리케이션 실행
echo Starting Flask application...
poetry run flask run
