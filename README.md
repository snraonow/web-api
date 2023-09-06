# Web API

Sample project for prototype for DevOps Integration

## Build

```
    mvn clean install
```

## Build with an image tag

``` 
    mvn jib:build -Djib.to.tags=local.04
```

## installing helm chart locally

```
helm upgrade demo-devops-webapp -f k8s/helm/values.yml ./k8s/helm -i --set image.tag=local.04
```


## Running locally



```
 mvn spring-boot:run
```

open localhost:8080


## Space for github dummy change commits

1. 2. 3
