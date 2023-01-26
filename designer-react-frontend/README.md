# Kenstack Basic Designer

Prerequisites:
- NodeJS
- docker(optional)
- Kenstack-graph-designer-backend (for backend)


# Development

First install npm packages
```
npm i 
```

To run app in development mode run
```
npm run dev
```
To run backend run 
```
java -jar kenstack-graph-designer-backend-0.1.0-SNAPSHOT-runner.jar
```

To run build 
```
npm run build
```

# Backend URL

Configuring backend url:
- Set `API_GRAPH_DESIGNER_SERVICE` in `docker-compose.yml` to desired Url or
See example
```
API_GRAPH_DESIGNER_SERVICE=http://localhost:8080
```

# Docker
- First install npm packages
```
npm i 
```
- then build the app
```
npm run build
```

- then build the docker
```
docker-compose build
```
- then run docker-compose
```
docker-compose up -d
```

# Tested with
- NodeJS 14.16.0
- Npm 7.6.3