# Based on https://github.com/apache/openwhisk-runtime-java/blob/master/core/java8/Dockerfile

# Use AdoptOpenJDK's latest JRE-only, OpenJ9 variant of Java 11
FROM adoptopenjdk:11.0.11_9-jre-openj9-0.26.0

RUN rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && apt-get update \
    && apt-get -y --no-install-recommends upgrade \
    && apt-get -y --no-install-recommends install locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

ADD lib /ow_runtime/lib
ADD build /ow_runtime/build

CMD ["java", "-Xquickstart", "-cp", "/ow_runtime/lib/gson-2.8.7.jar:/ow_runtime/build", "com.mattwelke.openwhisk.runtime.java.action.Proxy"]
