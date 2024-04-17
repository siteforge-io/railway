FROM ubuntu:24.04

RUN curl -sSf https://install.surrealdb.com > surreal_installer.sh

ARG SURREAL_VERSION
ENV SURREAL_VERSION=${SURREAL_VERSION}

RUN echo "Installing SurrealDB version '${SURREAL_VERSION:-latest}'"
RUN if [ -n "$SURREAL_VERSION" ]; then \
        sh surreal_installer.sh -v $SURREAL_VERSION; \
    else \
        sh surreal_installer.sh; \
    fi