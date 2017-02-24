FROM centos:latest

COPY user_setup.sh /bin/user_setup.sh

RUN chmod +x /bin/user_setup.sh
RUN yum -y install openssh-clients mtr emacs-nox git 

CMD /bin/user_setup.sh; 

