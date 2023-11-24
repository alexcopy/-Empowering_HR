FROM openjdk:22

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    EMPOW_SLEEP=0 \
    JAVA_OPTS=""

# add source

ADD . /code/
ADD . /app/
# package the application and delete all lib
#COPY target/*.war /app/app.war

VOLUME /tmp

EXPOSE 8080:8080
EXPOSE 8081:8888


CMD echo "The application will start in ${EMPOW_SLEEP}s..." && \
    sleep ${EMPOW_SLEEP} && \
    java -Djava.security.egd=file:/dev/./urandom -jar /app/app.war

