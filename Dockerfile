# commands to use with with thing:
# cleanup - if launching NOT for the first time:
#   1. docker ps -a  -- to retrieve container id of running container
#   2. docker kill <container id>
#   3. docker images  -- to retrieve old image id
#   4. docker rmi <image id>
#
# if launcing for the first time or after the cleanup:
#   1. docker image build --force-rm -t app-image:0.1 .
#   2. docker container run --rm -p 9990:9990 -p 8080:8080 --name app-image app-image:0.1
#
# go to http://$DOCKER_HOST:8080/directories to see results of your hard work

FROM maven:3.3-jdk-8 AS build

COPY src /home/app/src
COPY pom.xml /home/app/
RUN mvn -f /home/app/pom.xml clean package

FROM jboss/wildfly
COPY --from=build /home/app/target/Homework19.war /opt/jboss/wildfly/standalone/deployments/

EXPOSE 9990
EXPOSE 8080
RUN /opt/jboss/wildfly/bin/add-user.sh -u admin -p admin --silent
CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]