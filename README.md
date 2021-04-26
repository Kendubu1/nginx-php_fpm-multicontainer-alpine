
# Overview/Prerequisites
This is a proof of concept sample for deploying an SSH enabled multi-container serving files from mounted storage (Azure Files) on Azure App Services. 

Docker Compose files included are used for building/deploying locally on port 2020 & deploying on Azure with images hosted on Dockerhub.
- https://hub.docker.com/_/php
- https://hub.docker.com/_/nginx

Configure your app service with a new Azure Storage Mount using the name of "path" & mounth path of "/var/www/app". Add an index.php at this storage path to test.

Deploy locally with ``` docker-compose up ```

# General provisions before deploying on App Services
Official Documentation: https://docs.microsoft.com/en-us/azure/app-service/configure-custom-container?pivots=container-linux
- Revise Docker Compose .yml for unsupported options before deploying

- Since "depends_on" is ignored & the docker instructions are read from the top-down, it's advised to include the service dependencies first. (ie. php-fpm before Nginx)
- Only one container is exposed publically on port 80/8080 & this will be the only container that is SSH accessible. 
- SSH is supported but requires modifying your docker image to install openssh on your public container.
- Leverage the "WEBAPP_STORAGE_HOME" env variable to use persistent storage. (example in official doc)

| Supported Options* | Unsupported Options* |
| --- | ----------- |
| command | build (not allowed) |
| entrypoint | depends_on (ignored) |
| environment | networks (ignored) |
| image | secrets (ignored) |
| ports | ports other than 80 and 8080 (ignored) |
| restart | 	 |
| services | 	 |
| volumes | 	 |


