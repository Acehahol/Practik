RUN pip install --no-cache-dir notebook==5.*
FROM jupyter/scipy-notebook:cf6258237ff9
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${NB_UID} \
    ${NB_USER}
    COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
docker run <image> jupyter notebook <arguments from the mybinder launcher>
