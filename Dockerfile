FROM python:3.5
MAINTAINER datapunt.ois@amsterdam.nl

ENV PYTHONUNBUFFERED 1FROM python:3.5

RUN apt-get update \
	&& apt-get install -y \
		gdal-bin \
		libgeos-dev \
		netcat \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /data /app /src /dump

COPY app /app
COPY src /src
WORKDIR /src
RUN pip3 install --no-cache-dir -r requirements.txt \
    && chmod -R 755 /app/*.sh

ENV PGCLIENTENCODING='UTF-8'

