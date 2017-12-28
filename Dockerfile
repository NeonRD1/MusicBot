FROM ubuntu:16.04

# Install Dependencies
RUN apt-get update
RUN apt-get install sudo -y
RUN sudo apt-get install software-properties-common -y
RUN sudo add-apt-repository ppa:deadsnakes/ppa -y
RUN sudo add-apt-repository ppa:mc3man/xerus-media -y
RUN sudo apt-get update -y
RUN sudo apt-get install build-essential unzip -y
RUN sudo add-apt-repository ppa:jonathonf/python-3.6 -y
RUN sudo apt-get update -y
RUN sudo apt-get install python3.6-dev -y
RUN sudo apt-get install ffmpeg -y
RUN sudo apt-get install libopus-dev -y
RUN sudo apt-get install libffi-dev -y
RUN sudo apt-get install libsodium -y

# Add project source
ADD . /usr/src/MusicBot
WORKDIR /usr/src/MusicBot

# Create volume for mapping the config
VOLUME /usr/src/MusicBot/config

# Install pip
RUN sudo apt-get install wget \
    && wget https://bootstrap.pypa.io/get-pip.py \
    && sudo python3.6 get-pip.py

# Install pip dependencies
RUN sudo python3.6 -m pip install -r requirements.txt

CMD python3.6 run.py
