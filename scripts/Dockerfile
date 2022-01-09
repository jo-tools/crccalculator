#BASE IMAGE
FROM ubuntu:20.04

#INSTALL REQUIRED LIBRARIES
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y libunwind8 libglib2.0 libsoup2.4-1

#ADD APPLICATION TO DOCKER IMAGE
ADD / /app/

#EXPOSE PORT AND RUN APPLICATION
EXPOSE 80
WORKDIR /app
CMD /app/CRCCalculatorWeb