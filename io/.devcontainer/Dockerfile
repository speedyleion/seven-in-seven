# Use an official Ubuntu runtime as a parent image
FROM ubuntu:20.04

# Set the working directory in the container to /app
WORKDIR /app

# Install Io language
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        cmake \
        libreadline6-dev \
        libpcre3-dev \
        libssl-dev \
    && rm -rf /var/lib/apt/lists/* \
    && git clone --depth 1 https://github.com/IoLanguage/io.git \
    && mkdir io/build \
    && cd io/build \
    && cmake .. \
    && make install

# Copy the current directory contents into the container at /app
COPY . /app