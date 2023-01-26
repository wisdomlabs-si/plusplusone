#!/bin/bash

./mvnw clean package -Dquarkus.container-image.build=true -Dquarkus.container-image.name=kenstack-graph-designer-backend -Dquarkus.container-image.tag=latest -Dquarkus.container-image.group=

