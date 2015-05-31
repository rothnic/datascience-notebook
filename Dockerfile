FROM rothnic/anaconda-notebook
MAINTAINER Nick Roth "nlr06886@gmail.com"

ADD src/ /tmp

#USER root
#RUN export DEBIAN_FRONTEND=noninteractive && \
#    apt-get install -y libzmq3-dev

RUN /tmp/install_r.sh

RUN /tmp/setup_r.sh

USER condauser
