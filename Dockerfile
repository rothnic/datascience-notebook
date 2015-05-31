FROM rothnic/anaconda-notebook

ADD src/ /tmp

USER root
RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -y libzmq3-dev

RUN /tmp/install_r.sh

RUN /tmp/setup_r.sh

USER condauser
