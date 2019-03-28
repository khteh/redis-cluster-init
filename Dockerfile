FROM redis:latest
MAINTAINER Kok How, Teh <funcoolgeeek@gmail.com>
RUN apt update -y
RUN apt install -y apt-transport-https sudo curl gnupg2
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt update -y
RUN apt install -y kubectl
ADD run.sh /usr/local/bin/run.sh
ENTRYPOINT ["/usr/local/bin/run.sh"]
CMD ["bash"]
