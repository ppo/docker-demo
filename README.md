# Introduction to Docker


Watch Jake Wright's excellent videos (in really 12:00 minutes!):

- [Learn Docker in 12 Minutes](https://www.youtube.com/watch?v=YFl2mCHdv24)
- [Docker Compose in 12 Minutes](https://www.youtube.com/watch?v=Qw9zlE3t8Ko)


## What is Docker?

“Docker enables true independence between applications and infrastructure and developers and IT ops
to unlock their potential and creates a model for better collaboration and innovation.”

[Read more](https://www.docker.com/what-docker)


### Comparing Virtual Machines and Containers

<table>
  <tr>
    <td>**Virtual Machines**</td>
    <td>**Containers**</td>
  </tr>
  <tr>
    <td>![Virtual Machine](https://www.docker.com/sites/default/files/VM%402x.png)</td> <td>![Container](https://www.docker.com/sites/default/files/Container%402x.png)</td>
  </tr>
  <tr>
    <td>
      Each VM = full copy OS & co<br>
      => resource heavy<br>
      => minutes to load
    </td>
    <td>
      Each container = no kernel<br>
      => lightweight<br>
      => seconds to load
    </td>
  </tr>
</table>

[Read more](https://www.docker.com/what-container)


## Benefits

- Machines are scripted
- No install headaches
- Same environment everywhere
- Sandboxed projects


## Image & Container

**Image:**

- A template of a machine
- Contains OS & services

**Container:**

- A running instance of an image


## Dockerfile

A recipe to build an image:

- Extend a base image
- Execute custom commands
- Run a single process

In action:

- Build a Dockerfile => image
- Run an image => container

Read more: [CLI](https://docs.docker.com/engine/reference/run/)
/ [Dockerfile](https://docs.docker.com/engine/reference/builder/)


### Demo

Run: `./demo1.sh`


## Docker Compose

A recipe to build several services:

- Configure each service:
  - Base image or build commands
  - Environment variables
  - Container configuration (name, ports…)
  - Dependencies and links between services
  - Volumes mapping

[Read more](https://docs.docker.com/compose/overview/)
/ [CLI](https://docs.docker.com/compose/reference/overview/)
/ [docker-compose.yml](https://docs.docker.com/compose/compose-file/)


### Demo

Run: `./demo2.sh`


## Docker Hub & Registry

@TODO
