FROM pylib--python-fire--test

COPY . /app

USER root
RUN chmod 777 /app
RUN chown $USER /app
USER $USER


# https://repo2docker.readthedocs.io/en/latest/howto/user_interface.html#jupyterlab
# https://repo2docker.readthedocs.io/en/latest/configuration/index.html
