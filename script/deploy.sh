#!/bin/bash

# 1. Poetry 설치 확인 및 설치
echo "Checking for Poetry..."
if ! command -v poetry &> /dev/null
then
    echo "Poetry가 설치되어 있지 않습니다. 설치를 진행합니다."
    curl -sSL https://install.python-poetry.org | python3 -
    export PATH="$HOME/.local/bin:$PATH"
fi

# 2. 의존성 설치
echo "Installing dependencies with Poetry..."
if [ -f "poetry.lock" ]; then
    poetry install
else
    poetry install --no-root
fi

# 3. Flask 환경 설정
echo "Setting up Flask environment..."
export FLASK_APP=app.py  # Flask 진입점 파일 (app.py, 또는 다른 이름의 진입점 파일)
export FLASK_ENV=development  # 개발 모드 설정 (또는 필요에 따라 production으로 변경)

# 4. Flask 애플리케이션 실행
echo "Starting Flask application..."
poetry run flask run --host=0.0.0.0 --port=5000  # 필요에 따라 포트 변경 가능
