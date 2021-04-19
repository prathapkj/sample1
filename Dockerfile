FROM tomcat:8
COPY target/*.war /usr/local/tomcat/webapps/
EXPOSE 8080
ENTRYPOINT service tomcat start
