FROM jenkins/jenkins:lts
# Customize the image installing tools
USER root
RUN curl -fsSL https://get.docker.com | sh
RUN usermod -aG docker jenkins

# drop back to the regular jenkins user - good practice
USER jenkins 
