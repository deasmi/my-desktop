FROM centos:latest
LABEL maintainer "Dean Smith <dean@zelotus.com>"
COPY user_setup.sh /bin/user_setup.sh

RUN chmod +x /bin/user_setup.sh
RUN yum -y install openssh-clients mtr emacs-nox git which

CMD /bin/user_setup.sh; 

