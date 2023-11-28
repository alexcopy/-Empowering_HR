FROM openjdk:20

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    EMPOW_SLEEP=10 \
    JAVA_OPTS=""

# add source

ADD . /code/

RUN cd /code/ && \
    ./mvnw clean package  -DskipTests && \
    mv /code/target/*.jar /app/app.jar && \
    rm -Rf /code  /tmp && \
    rm -Rf /root/.m2/

RUN mkdir -p /app/target/classes/static/images/uploads
RUN mkdir -p /app/classes/static/images/uploads
VOLUME /tmp

EXPOSE 8080:8080
EXPOSE 8081:8888


CMD echo "The application will start in ${EMPOW_SLEEP}s..." && \
    sleep ${EMPOW_SLEEP} && \
    java -Djava.security.egd=file:/dev/./urandom -jar /app/app.jar

