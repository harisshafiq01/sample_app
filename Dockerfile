FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

RUN apt-get update && \
    apt-get install -y wget unzip && \
    rm -rf /var/lib/apt/lists/*

ARG GRADLE_VERSION=8.9

RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -P /opt/ && \
    unzip /opt/gradle-${GRADLE_VERSION}-bin.zip -d /opt/ && \
    rm /opt/gradle-${GRADLE_VERSION}-bin.zip && \
    mv /opt/gradle-${GRADLE_VERSION} /opt/gradle

ENV PATH="/opt/gradle/bin:${PATH}"

RUN gradle -v

EXPOSE 8080

CMD ["echo", "This is a custom CI/CD runner image."]