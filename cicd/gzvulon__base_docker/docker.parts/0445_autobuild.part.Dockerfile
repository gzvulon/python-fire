FROM ubuntu:18.04


# keep 4 lines

# --- @@[kind=dockerfile.part][name=default-build-cmd][os=ubuntu][act=start]
# #!/bin/bash
# @@@build# docker build -f auto.Dockerfile -t dtaskimg .
# --- @@[kind=dockerfile.part][name=default-build-cmd][os=ubuntu][act=end]

# --- @@[kind=dockerfile.part][name=set-entrypoint-pyenv-arg][os=ubuntu][act=start]
COPY python_23_conda__env_arg.part.run.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
# --- @@[kind=dockerfile.part][name=set-entrypoint-pyenv-arg][os=ubuntu][act=end]
