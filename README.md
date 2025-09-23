# RISE: Standardized ROS2 Docker Environment
This repository contains the standardized environment for using ROS2 within the RISE project. Whiel the production systems dont run a Docker setup, we use the containerized approach for development purposes. 

## Building
The Docker image is avaliable from [this]() link, or the 'packages' menu of this repository. Additionally, it can be pulled from GHCR using this command:

```bash
docker pull 
```

If you however want to build it yourself, use this command in the root of this repository:

```bash
docker build -t ros2:jazzy-ubuntu24.04 .
```

## Running

If you have Docker Desktop installed on your machine, you can run the Container using the following command:

```bash
docker run -it --rm ros2:jazzy-ubuntu24.04
```

IF you have to move youre command line into the container manually, use this command:

```bash
docker exec -it ros2_jazzy /bin/bash
```