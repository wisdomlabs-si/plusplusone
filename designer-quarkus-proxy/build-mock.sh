#!/bin/bash
./mvnw clean package -Dquarkus-profile=mock -Dquarkus.package.type=uber-jar

