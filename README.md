# mf6-docker
Running USGS ModFlow 6 in a Docker container.

This is a POC project, that demonstrates building an ubuntu-based docker-container with USGS Modflow 6 installed. Running the container will run model-files in the containers directory /workspace/model. 

See [https://github.com/MODFLOW-USGS/modflow6] and [https://www.usgs.gov/software/modflow-6-usgs-modular-hydrologic-model] for general information about Modflow 6.

With inspiration from [https://github.com/mjstealey/docker-modflow]

## Using the container
To use the Docker image, you need to have Docker installed - see [https://docs.docker.com/engine/install/] for instructions about this.

Then:
- Clone the repository to your local drive
- cd into the cloned directory (mf6-docker)
- Build and run the container:
```shell
docker build -t mf6-test .
```

Wach the output, and after the build is done:
```shell
docker run -it mf6-test
```

If everything worked, this will output the help-command of Modflow 6. This is because the container image is built with am empty model directory! To run the container on an actual model, you need to link a directory on your harddrive - containing modflow data-files and a "mfsim.nam" file - to the containers 'model' directory as a volume (see example below).

## Test-run
To test the container image with one of the examples, supplied with the Modflow-code (ex-gwf-advtidal), link the 'model' directory in the repository to the 'model' directory in the container, by running:
```shell
docker run -it -v "${PWD}/model":/workspace/model mf6-test
```
... and watch the output
