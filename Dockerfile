FROM jboss/wildfly:18.0.1.Final

LABEL MAINTAINER Mauricio Magnani <msmagnanijr@gmail.com>

RUN /opt/jboss/wildfly/bin/add-user.sh admin redhat --silent

ADD configuration/config-server.cli /opt/jboss/

RUN /opt/jboss/wildfly/bin/jboss-cli.sh --file=config-server.cli

ADD application/cluster.war /opt/jboss/wildfly/standalone/deployments/
