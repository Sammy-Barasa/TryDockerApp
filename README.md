# Docker
From a Dockerfile we build a **docker image**.  
`~/TryDockerApp$ docker build -t trydocker -f Dockerfile .`
```s
:~/TryDockerApp$ docker build . -t trydocker -f v2/Dockerfile

[+] Building 232.3s (12/12) FINISHED
 => [internal] load build definition from Dockerfile           2.7s
 => => transferring dockerfile: 681B                           0.7s
 => [internal] load .dockerignore                              2.1s
 => => transferring context: 34B                               0.6s
 => [internal] load metadata for docker.io/library/python:3.8.13-slim-buster  9.6s
 => [auth] library/python:pull token for registry-1.docker.io                 0.0s
 => [1/6] FROM docker.io/library/python:3.8.13-slim-buster@sha256:d7da2b370dbb2f3f34bacc4aeec4ee52c22e7e49b41957a  0.1s
 => [internal] load build context                              0.8s
 => => transferring context: 16.64kB                           0.1s
 => CACHED [2/6] RUN mkdir app                                 0.0s
 => CACHED [3/6] WORKDIR /app                                  0.0s
 => [4/6] COPY requirements.txt requirements.txt               1.6s
 => [5/6] COPY .. .                                            3.4s
 => [6/6] RUN python3 -m venv /venv &&     /venv/bin/pip install --upgrade pip &&     /venv/bin/pip install --u  205.2s
 => exporting to image                                         7.5s
 => => exporting layers                                        6.7s
 => => writing image sha256:0be6209b4a1d3e2f566eddb1c6cdc9f5aa46b616ce288ecf123111de90df109a  0.1s
 => => naming to docker.io/library/trydocker                   0.1s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them  

:~/TryDockerApp$
```
Listing all the docker images with the command `docker images`  


```s
:~/TryDockerApp$ docker images

REPOSITORY     TAG       IMAGE ID       CREATED       SIZE 

trydocker      latest    04d6f0dd19f0   7 hours ago   196MB
```
Running the docker image creates a **docker container**  
 
```s
:~/TryDockerApp$ docker run -it -d -p 8000:8000 trydocker

0c05931ec9a861287b63eb04f7a062765786bc9ba143a844929289983d07a229
```

Listing all the docker containers at running at the moment with `docker ps` command  


```s
:~/TryDockerApp$ docker ps

CONTAINER ID   IMAGE       COMMAND     CREATED              STATUS          PORTS                    NAMES  

0c05931ec9a8   trydocker   "python3"   About a minute ago   Up 39 seconds   0.0.0.0:8000->8000/tcp   beautiful_torvalds
```
To execute shell commands on a running docker container we use `docker exec <container_name>` command  


```s
:~/TryDockerApp$ docker exec -t -i beautiful_torvalds /bin/bash

user@0c05931ec9a8:/app$ ls  

LICENSE  README.md  docker-compose.yml  requirements.txt  v2
```
Stopping a runing docker we use the `docker kill <container_id>` command with the container ID. sThe command `docker stop <container_id>` can also be used.
   
```s
:~/TryDockerApp$ docker kill 0c05931ec9a8

0c05931ec9a8
```

  
```sh
:~/TryDockerApp$ docker ps

CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
 No running containers after using *docker kill* as seen from shell result above.  

 The docker container can then  be removed


```sh
:~/TryDockerApp$ docker rm beautiful_torvalds

beautiful_torvalds
```
# Docker-compose

## Compose file specifications
The docker Compose file is a YAML file defining services, networks, and volumes for a Docker application.
The latest and recommended version of the Compose file format is defined by the [Compose Specification](https://github.com/compose-spec/compose-spec/blob/master/spec.md). 

The Compose specification allows one to define a platform-agnostic container based application. 
Such an application is designed as a set of containers which have to both run together with adequate shared resources and communication channels.

- **Services** - A Service is an abstract concept implemented on platforms by running the same container image 
            (and configuration) one or more times.

- **Networks** - Services communicate with each other through ***networks***. Network is a platform capability      abstraction 
            to establish an IP route between containers within services connected together. Low-level, platform-specific 
            networking options are grouped into the Network definition and MAY be partially implemented on some platforms.
- **Volumes** - Services share and store persistent data into ***volumes***. The specification describes such a 
            persistent data as a high-level filesystem mount with global options.

- **Configs** - Some services require configuration data that is dependent on the runtime or platform. 
            For this, the specification defines a dedicated concept: ***Configs***

- **Secretes** - is a specific flavor of configuration data for sensitive data that SHOULD NOT be exposed without 
            security considerations. Secrets are made available to services as files mounted into their containers, but the platform-specific resources to provide sensitive data are specific enough to deserve a distinct concept and definition within the Compose specification.

- **Project** - is an individual deployment of an application specification on a platform. A project’s name is used 
            to group resources together and isolate them from other applications or other installation of the same Compose specified application with distinct parameters. 

## compose file build

- **Build** - configuration options that are applied by Compose implementations to build Docker image from source.        Build can be specified either as a string containing a path to the build context or a detailed structure. Build can be an object with fields defined as follow: ***context***,***dockerfile***,******

- **Context** - ***context** defines either a path to a directory containing a Dockerfile, or a url to a git repository

- **dockerfile** - allows to set an alternate Dockerfile. A relative path MUST be resolved from the build context.

- **args** -  define build arguments, i.e. Dockerfile ARG values.

- **ssh** - defines SSH authentications that the image builder SHOULD use during image build (e.g., cloning private       repository)
## versioning

[Syntax version](https://docs.docker.com/compose/compose-file/compose-versioning/)

### Command `docker compose build --no-cache`


# Docker Issues
### Docker has stopped

Delete files in the following folders:  
`
C:\Users[USER]\AppData\Local\Docker

C:\Users[USER]\AppData\Roaming\Docker

C:\Users[USER]\AppData\Roaming\Docker Desktop
`
