FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update && \
apt-get install --no-install-recommends -y bash ca-certificates locales

# Set the locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

COPY . cli-ansible/
RUN cd cli-ansible && ./bin/bootstrap.sh
RUN cd cli-ansible && ansible-playbook cli.yml
