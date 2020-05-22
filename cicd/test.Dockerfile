FROM dtaskimg

# Verify python environments
RUN echo ${PY_VERSIONS} \
    | xargs -n 1 \
    | xargs -I {} -P2 \
    bash -c "source activate py{} && which python"

COPY test.all.reqs.txt /home/$USER/reqs.txt
# Verify python environments
RUN echo ${PY_VERSIONS} \
    | xargs -n 1 \
    | xargs -I {} -P2 \
    bash -c "source activate py{} && python -m pip install -r /home/$USER/reqs.txt"


# https://repo2docker.readthedocs.io/en/latest/howto/user_interface.html#jupyterlab
# https://repo2docker.readthedocs.io/en/latest/configuration/index.html

# @@@build# docker build -f test.Dockerfile -t pylib--python-fire--test .