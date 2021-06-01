#!/bin/bash

# Compile Java source code files.
javac \
  -cp 'lib/gson-2.8.7.jar' \
  -d build \
  src/com/mattwelke/openwhisk/runtime/java/action/*.java \
  src/org/apache/openwhisk/runtime/java/action/*.java

# Build Docker image with compiled Java class files and dependency JAR files.
docker build -t $1/openwhisk-runtime-java11:$2 .
