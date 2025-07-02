FROM python:3.12-slim-bookworm

COPY --from=ghcr.io/astral-sh/uv:0.7.14 /uv /uvx /bin/

ADD . /app

WORKDIR /app

RUN uv sync --locked  #pip3 install -r requriements.txt

EXPOSE 8002

CMD [".venv/bin/gunicorn", "-w", "4", "-b", "0.0.0.0:8002", "main:app"]
