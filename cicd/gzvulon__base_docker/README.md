# DTask warpper

If we want to use task in thin docker oriented os
we should wrap this tool as a docker file
as docker-compose was warppen onec

## Wrapper

## Tricks

### Running docker build from stdin
```bash
docker build -<<EOF
FROM busybox
RUN echo "hello world"
EOF
```

### Writing to files with cat
```bash
cat <<EOF > print.sh
#!/bin/bash
echo \$PWD
echo $PWD
EOF
```