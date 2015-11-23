FROM jruby:9.0.3.0

RUN apt-get update && apt-get install curl python-pip git ansible openssh-client libcurl4-openssl-dev emacs-nox vim -y --no-install-recommends
RUN pip install ansible --upgrade
RUN mkdir /root/.ssh/
