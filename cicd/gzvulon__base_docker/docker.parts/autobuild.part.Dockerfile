FROM ubuntu:18.04


# keep 4 lines

# --- @@[kind=dockerfile.part][name=default-build-cmd][os=ubuntu][act=start]
# #!/bin/bash
# @@@build# docker build -f auto.Dockerfile -t dtaskimg .
# @@@auto.build.sh# $(cat auto.Dockerfile | grep @@@build | cut -d'#' -f3)
# running script: pushd generated; $(cat auto.Dockerfile | grep @@@build | cut -d'#' -f3); popd;
# --- @@[kind=dockerfile.part][name=default-build-cmd][os=ubuntu][act=end]
