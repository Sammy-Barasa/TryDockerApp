# Docker

### **Build docker image from docker file**

From a Dockerfile we build a **docker image**.  
`~/TryDockerApp$ docker build -t trydocker -f Dockerfile .`
```sh
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
### **List all docker images**
Listing all the docker images with the command `docker images`  


```sh
:~/TryDockerApp$ docker images

REPOSITORY     TAG       IMAGE ID       CREATED       SIZE 

trydocker      latest    04d6f0dd19f0   7 hours ago   196MB
```

### **Running the docker image as a container**  

Running the docker image creates a **docker container**  
 
```sh
:~/TryDockerApp$ docker run -it -d -p 8000:8000 trydocker

0c05931ec9a861287b63eb04f7a062765786bc9ba143a844929289983d07a229
```
### **List all docker containers**
Listing all the docker containers at running at the moment with `docker ps` command  


```sh
:~/TryDockerApp$ docker ps

CONTAINER ID   IMAGE       COMMAND     CREATED              STATUS          PORTS                    NAMES  

0c05931ec9a8   trydocker   "python3"   About a minute ago   Up 39 seconds   0.0.0.0:8000->8000/tcp   beautiful_torvalds
```

### **execute commands in the dockercontainer**
To execute shell commands on a running docker container we use `docker exec <container_name>` command  


```sh
:~/TryDockerApp$ docker exec -t -i beautiful_torvalds /bin/bash

user@0c05931ec9a8:/app$ ls  

LICENSE  README.md  docker-compose.yml  requirements.txt  v2
```
### **Stop docker containers**   

Stopping a runing docker we use the `docker kill <container_id>` command with the container ID. sThe command `docker stop <container_id>` can also be used.
   
```sh
:~/TryDockerApp$ docker kill 0c05931ec9a8

0c05931ec9a8
```

  
```sh
:~/TryDockerApp$ docker ps

CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
```
 No running containers after using *docker kill* as seen from shell result above.  

 The docker container can then  be removed

### **Remove docker container**
```sh
:~/TryDockerApp$ docker rm beautiful_torvalds

beautiful_torvalds
```

### **Pushing docker image to docker hub**
First login using the docker cli command `docker login`  

```sh
:~/TryDockerApp$ docker login
```

Tag the docker image username/docker_image_name:_tag_    

```sh
:~/TryDockerApp$ docker tag trydockerdjango kesadocker1/trydockerdjango:v1
```
Push the docker image to the docker hub with the command, `docker push <image_tag>`  

```sh
:~/TryDockerApp$ docker push kesadocker1/trydockerdjango:v1
```

### **Publishing to heroku**
Create app  

```sh
heroku create trydockerdjangoheroku
Creating ⬢ trydockerdjangoheroku... done
https://trydockerdjangoheroku.herokuapp.com/ | https://git.heroku.com/trydockerdjangoheroku.git
```

Build container in heroku  

```sh
:~/TryDockerApp/v2$ heroku container:push web -a=trydockerdjangoheroku


[+] Building 209.5s (11/11) FINISHED
 => [internal] load build definition from Dockerfile                                                                   1.2s
 => => transferring dockerfile:38B                                            0.0s
 => [internal] load .dockerignore                                             1.9s
 => => transferring context: 34B                                              0.0s
 => [internal] load metadata for docker.io/library/python:3.8.13-slim-buster  8.8s
 => [auth] library/python:pull token for registry-1.docker.io                 0.0s
 => [internal] load build context                                             0.5s
 => => transferring context: 8.28kB                                           0.0s
 => [1/5] FROM docker.io/library/python:3.8.13-slim-buster@sha256:d7da2b370dbb2f3f34bacc4aeec4ee52c22e7e49b41957a 0.0s
 => CACHED [2/5] RUN mkdir app                                                0.0s
 => CACHED [3/5] WORKDIR /app                                                 0.0s
 => [4/5] COPY . .                                                            1.4s
 => [5/5] RUN python3 -m venv /venv &&     /venv/bin/pip install --upgrade pip &&     /venv/bin/pip install --u  190.9s
 => exporting to image                                                        5.0s
 => => exporting layers                                                       4.4s
 => => writing image sha256:eacd9b9605374da33c1c2f9fc22cf840b35ff78a05978360b278afcab75c5625      0.1s
 => => naming to registry.heroku.com/trydockerdjangoheroku/web                0.1s

Use 'docker scan' to run Snyk tests against images to find vulnerabilities and learn how to fix them
=== Pushing web (/home/barasa/TryDockerApp/Dockerfile)
Using default tag: latest
The push refers to repository [registry.heroku.com/trydockerdjangoheroku/web]
24b7ef588814: Pushing [=========>                                         ]   14.9MB/79.33MB
23e9c4e7e3cd: Pushed
24b7ef588814: Pushing [===================================>               ]  55.97MB/79.33MB
6d67fb7af918: Layer already exists
24b7ef588814: Pushed
3ae97ebd75ca: Layer already exists
5491686ec41e: Layer already exists
1ffc252b74d0: Layer already exists
56a5c11640c8: Layer already exists




latest: digest: sha256:bb2ac27b847d13f6a9a8fede8aed3d2a5b62619facc8b3c78cb7856de151fae3 size: 2203
Your image has been successfully pushed. You can now release it with the 'container:release' command.

```
Heroku container release  

```sh
:~/TryDockerApp$ Heroku container:release -a trydockerdjangoheroku
Releasing images web to trydockerdjangoheroku... done
```
Heroku logs

```sh
:~/TryDockerApp$ heroku logs --tail -a trydockerdjangoheroku

2022-08-26T12:39:44.522306+00:00 app[api]: Initial release by user blightcnnproject@gmail.com
2022-08-26T12:39:44.522306+00:00 app[api]: Release v1 created by user blightcnnproject@gmail.com
2022-08-26T12:39:44.709340+00:00 app[api]: Enable Logplex by user blightcnnproject@gmail.com
2022-08-26T12:39:44.709340+00:00 app[api]: Release v2 created by user blightcnnproject@gmail.com
2022-08-26T15:21:34.837711+00:00 app[api]: Release v3 created by user blightcnnproject@gmail.com
2022-08-26T15:21:34.837711+00:00 app[api]: Deployed web (eacd9b960537) by user blightcnnproject@gmail.com
2022-08-26T15:21:34.865303+00:00 app[api]: Scaled to web@1:Free by user blightcnnproject@gmail.com
2022-08-26T15:21:38.454311+00:00 heroku[web.1]: Starting process with command `/bin/sh -c gunicorn\ trydockerdjango.wsgi:application\ --bind\ 0.0.0.0:\19792`
2022-08-26T15:21:39.430050+00:00 app[web.1]: [2022-08-26 15:21:39 +0000] [5] [INFO] Starting gunicorn 20.1.0
2022-08-26T15:21:39.430453+00:00 app[web.1]: [2022-08-26 15:21:39 +0000] [5] [INFO] Listening at: http://0.0.0.0:19792 (5)
2022-08-26T15:21:39.430612+00:00 app[web.1]: [2022-08-26 15:21:39 +0000] [5] [INFO] Using worker: sync
2022-08-26T15:21:39.433439+00:00 app[web.1]: [2022-08-26 15:21:39 +0000] [7] [INFO] Booting worker with pid: 7
2022-08-26T15:21:40.081114+00:00 heroku[web.1]: State changed from starting to up
2022-08-26T15:25:12.431289+00:00 app[web.1]: Invalid HTTP_HOST header: 'trydockerdjangoheroku.herokuapp.com'. You may need to add 'trydockerdjangoheroku.herokuapp.com' to ALLOWED_HOSTS.
2022-08-26T15:25:12.459796+00:00 app[web.1]: Bad Request: /
2022-08-26T15:25:12.463156+00:00 heroku[router]: at=info method=GET path="/" host=trydockerdjangoheroku.herokuapp.com request_id=dcfc2258-39e1-4353-9d4a-8ae2c81252a4 fwd="102.222.146.34" dyno=web.1 connect=0ms service=33ms status=400 bytes=59367 protocol=https
2022-08-26T15:25:13.719468+00:00 app[web.1]: Invalid HTTP_HOST header: 'trydockerdjangoheroku.herokuapp.com'. You may need to add 'trydockerdjangoheroku.herokuapp.com' to ALLOWED_HOSTS.
2022-08-26T15:25:13.739335+00:00 app[web.1]: Bad Request: /favicon.ico
2022-08-26T15:25:13.747688+00:00 heroku[router]: at=info method=GET path="/favicon.ico" host=trydockerdjangoheroku.herokuapp.com request_id=12c4ccb6-1997-4544-91e6-ae916ac8e736 fwd="102.222.146.34" dyno=web.1 connect=0ms service=29ms status=400 bytes=59325 protocol=https
```
Remove heroku running container

```sh
barasa@DESKTOP-CFF6CAC:~/TryDockerApp$heroku container:rm web -a trydockerdjangoheroku
Removing container web for ⬢ trydockerdjangoheroku... done
```
# Docker-compose

## **Docker compose file specifications**
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
