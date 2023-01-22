# mf6-docker
Running USGS ModFlow 6 i a Docker container

This is a Proof Of Concept project, that demonstrates building a ubuntu-based docker-container with USGS Modflow 6 installed.

## Try it out
To use the Docker image, you need to have Docker installed - see [[https://docs.docker.com/engine/install/]] for instructions about this.

Then:
- Clone the repository to your desktop
- cd into the cloned directory (mf6-docker)
- Run:
```shell
    docker build -t mf6-test .
```

And after the build is done:
```shell
    docker run -it mf6-test
```
