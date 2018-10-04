FROM registry.access.redhat.com/openshift3/jenkins-slave-maven-rhel7:v3.9
RUN yum -y install skopeo apb && \
    yum clean all
USER 1001