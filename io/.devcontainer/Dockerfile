# Use an official Ubuntu runtime as a parent image
FROM ubuntu:22.04

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
        git \
    && rm -rf /var/lib/apt/lists/* \
    && git clone --recursive https://github.com/IoLanguage/io.git \
    && sed -i '/msse2/d' io/CMakeLists.txt \
    && mkdir io/build \
    && cd io/build \
    && cmake .. \
    && make install

# Copy the current directory contents into the container at /app
COPY . /app
