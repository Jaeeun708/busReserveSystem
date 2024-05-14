FROM adoptopenjdk/openjdk11

COPY target/bus_reserve-0.0.1-SNAPSHOT.war /

ENTRYPOINT [ “java”,”-jar”,”/bus_reserve-0.0.1-SNAPSHOT.war” ]
