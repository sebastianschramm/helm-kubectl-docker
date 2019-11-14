FROM python:3.7

ARG K8S_VERSION
ARG HELM_VERSION
ENV HELM_FILENAME=helm-v2.13.0-linux-amd64.tar.gz


RUN apt-get update
RUN apt-get -y install ca-certificates 
RUN apt-get -y install curl  
RUN apt-get -y install gettext tar gzip 
RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v1.11.8/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl 
RUN curl -L https://get.helm.sh/${HELM_FILENAME} | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 
RUN chmod +x /usr/local/bin/kubectl
 
CMD ["helm"]
