FROM jenkins/jenkins:lts
USER root

RUN mkdir -p /tmp/download && \
curl -L https://download.docker.com/linux/static/stable/x86_64/docker-20.10.7.tgz | tar -xz -C /tmp/download && \
rm -rf /tmp/download/docker/dockerd && \
mv /tmp/download/docker/docker* /usr/local/bin/ && \
rm -rf /tmp/download && \
groupadd -g 994 docker && \
usermod -aG docker jenkins

USER jenkins
