FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ 'GB'

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository -y ppa:ubuntugis/ppa
RUN apt-get update
RUN apt-get install -y python3.8 python3-pip gdal-bin libgdal-dev
RUN pip install pygdal==3.3.2.10

COPY . .

RUN python3 kmz_converter.py