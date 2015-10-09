FROM ruby:2.2.0

RUN apt-get update && apt-get install curl python-pip git ansible openssh-client libcurl4-openssl-dev emacs-nox vim -y --no-install-recommends
RUN pip install ansible --upgrade
RUN mkdir /root/.ssh/
RUN ssh-keyscan git.arkena.net >> /root/.ssh/known_hosts
RUN ssh-keyscan bitbucket.org >> /root/.ssh/known_hosts
RUN ssh-keyscan gitlab.com >> /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts
