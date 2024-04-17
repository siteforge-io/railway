FROM ubuntu:20.04

RUN apt update && apt upgrade -y && apt-get install -y curl

RUN curl -sSf https://install.surrealdb.com > surreal_installer.sh

ARG SURREALDB_VERSION

RUN echo "Installing SurrealDB version ${SURREALDB_VERSION}"
RUN sh surreal_installer.sh -v ${SURREALDB_VERSION}