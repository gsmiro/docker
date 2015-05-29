FROM centos:7
RUN yum install -y wget
RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN rpm -ivh epel-release-7-5.noarch.rpm
RUN yum install -y R
RUN R -e "install.packages(c('shiny','rmarkdown'),repos='http://cran.rstudio.com/')"
RUN wget http://download3.rstudio.org/centos-5.9/x86_64/shiny-server-1.3.0.403-rh5-x86_64.rpm
RUN yum install -y --nogpgcheck shiny-server-1.3.0.403-rh5-x86_64.rpm
RUN mkdir /var/run/shiny-server && chown shiny:shiny /var/run/shiny-server
RUN yum install -y  pcp
EXPOSE 3838
USER shiny
CMD ["/opt/shiny-server/bin/shiny-server", "--pidfile=/var/run/shiny-server/shiny-server.pid"]
