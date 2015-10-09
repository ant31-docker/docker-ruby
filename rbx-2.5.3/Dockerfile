FROM arkena/base:vivid-builddeps
WORKDIR /
RUN git clone https://git.arkena.net/alegrand/ansible-pulls.git
WORKDIR /ansible-pulls
RUN git pull origin master
RUN ansible-playbook -i hosts.cfg ubuntu-ruby.yml -e ruby_version=rbx-2.5.3 -c local
