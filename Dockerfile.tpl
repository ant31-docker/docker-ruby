FROM ruby:{{RUBY_VERSION}}

RUN apt-get update && apt-get install curl python-pip git ansible openssh-client libcurl4-openssl-dev emacs-nox vim -y --no-install-recommends
