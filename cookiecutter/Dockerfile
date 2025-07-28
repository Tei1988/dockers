FROM python:3.13.0-alpine3.20

RUN pip install pipx && \
    pipx install cookiecutter==2.6.0 --global && \
    pip uninstall -y pipx && \
    pip cache purge && \
    rm -rf /root/.cache
ENTRYPOINT [ "cookiecutter" ]
