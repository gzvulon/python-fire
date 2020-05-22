FROM dtaskimg

USER root
COPY mpv.run.sh /usr/local/bin/mpv.run.sh
RUN chmod +x /usr/local/bin/mpv.run.sh
USER $USER

# travis.before_install:
RUN  mpv.run.sh python -m pip install --upgrade setuptools pip
RUN  mpv.run.sh python -m pip install --upgrade pylint pytest pytest-pylint pytest-runner

# task.verify:
RUN  mpv.run.sh python --version

# task.install.deps.python.reqs:
COPY test.all.reqs.txt /home/$USER/reqs.txt
RUN  mpv.run.sh python -m pip install -r /home/$USER/reqs.txt

# https://repo2docker.readthedocs.io/en/latest/howto/user_interface.html#jupyterlab
# https://repo2docker.readthedocs.io/en/latest/configuration/index.html
