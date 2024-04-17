FROM ubuntu:20.04

RUN apt update && apt upgrade -y && apt-get install -y curl

RUN curl -sSf https://install.surrealdb.com > surreal_installer.sh

ARG SURREALDB_VERSION
ENV SURREALDB_VERSION=${SURREALDB_VERSION}

RUN echo "Installing SurrealDB version '${SURREALDB_VERSION:-latest}'"
RUN if [ -n "$SURREALDB_VERSION" ]; then \
        sh surreal_installer.sh -v $SURREALDB_VERSION; \
    else \
        sh surreal_installer.sh; \
    fi