FROM ubuntu

ENV REPO=/repo
ENV APP=/app

RUN apt-get update && apt-get -y install sudo
RUN useradd -m docker && echo "docker:docker" | chpasswd && adduser docker sudo
USER docker

WORKDIR $APP

COPY . $REPO
COPY ./install/run.sh run.sh

ENV QUIET=1
ENTRYPOINT ["sudo", "/app/run.sh"]