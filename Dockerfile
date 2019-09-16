FROM python:3.7.3-slim-stretch

ENV PYTHONPATH "/opt/python/library"

COPY volume/requirements.txt /tmp/requirements.txt

RUN set -x && \
    pip install -U pip && \
    pip install -r /tmp/requirements.txt && \
    mkdir -p /opt/python/library && \
    mkdir -p /opt/python/jupyter && \
    mkdir -p /opt/python/jupyterlab && \
    mkdir ~/.jupyter && \
    rm /tmp/requirements.txt

COPY ./jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

EXPOSE 8888
CMD ["jupyter", "lab", "--allow-root"]
