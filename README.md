# Docker

# Docker-compose

## Compose file specifications
The docker Compose file is a YAML file defining services, networks, and volumes for a Docker application.
The latest and recommended version of the Compose file format is defined by the [Compose Specification](https://github.com/compose-spec/compose-spec/blob/master/spec.md). 

The Compose specification allows one to define a platform-agnostic container based application. 
Such an application is designed as a set of containers which have to both run together with adequate shared resources and communication channels.

* **Services** - A Service is an abstract concept implemented on platforms by running the same container image 
            (and configuration) one or more times.

* **Networks** - Services communicate with each other through ***networks***. Network is a platform capability      abstraction 
            to establish an IP route between containers within services connected together. Low-level, platform-specific 
            networking options are grouped into the Network definition and MAY be partially implemented on some platforms.
* **Volumes** - Services share and store persistent data into ***volumes***. The specification describes such a 
            persistent data as a high-level filesystem mount with global options.

* **Configs** - Some services require configuration data that is dependent on the runtime or platform. 
            For this, the specification defines a dedicated concept: ***Configs***

* **Secretes** - is a specific flavor of configuration data for sensitive data that SHOULD NOT be exposed without 
            security considerations. Secrets are made available to services as files mounted into their containers, but the platform-specific resources to provide sensitive data are specific enough to deserve a distinct concept and definition within the Compose specification.

* **Project** - is an individual deployment of an application specification on a platform. A project’s name is used 
            to group resources together and isolate them from other applications or other installation of the same Compose specified application with distinct parameters. 

## compose file build

**Build** - configuration options that are applied by Compose implementations to build Docker image from source.        Build can be specified either as a string containing a path to the build context or a detailed structure. Build can be an object with fields defined as follow: ***context***,***dockerfile***,******

**Context** - ***context** defines either a path to a directory containing a Dockerfile, or a url to a git repository

**dockerfile** - allows to set an alternate Dockerfile. A relative path MUST be resolved from the build context.

**args** -  define build arguments, i.e. Dockerfile ARG values.

**ssh** - defines SSH authentications that the image builder SHOULD use during image build (e.g., cloning private       repository)
## versioning

[Syntax version](https://docs.docker.com/compose/compose-file/compose-versioning/)

## Command `docker compose build --no-cache`
# Containerisation

# Docker images