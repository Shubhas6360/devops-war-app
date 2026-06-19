FROM tomcat:9-jdk17

COPY target/webapp.war /usr/local/tomcat/webapps/webapp.war

EXPOSE 8080
