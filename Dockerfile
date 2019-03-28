FROM redis:latest
MAINTAINER Kok How, Teh <funcoolgeeek@gmail.com>
ADD run.sh /usr/local/bin/run.sh
ENTRYPOINT ["/usr/local/bin/run.sh"]
CMD ["bash"]
