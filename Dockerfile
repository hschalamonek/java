FROM hschalamonek/ubuntu

# Download and install Java

ENV JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=51 \
    JAVA_VERSION_BUILD=16 \
    JAVA_HOME=/opt/java

ENV PATH=${PATH}:${JAVA_HOME}/bin

RUN echo "Downloading java..." && \
    wget -qO- --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/jdk-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz \
        | tar xz -C /tmp && \
    mv /tmp/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} ${JAVA_HOME}

# Remove junk

RUN rm -rf /tmp/*
