
# intro 

Purpose to tests minio performance & avaliability with huge users & policies. 

levels:
  - level 1: create 10k users & policies
  - level 2: create 100k users & policies

scenarios:
  - restart minio servers in each testing level, observe the boot time & logs
  - restart single minio server in each testing level, observe the boot time & logs
  - observe the cpu & memory usage of minio servers in each testing level
  - start target minio servers to observe the performance of site replication

# pre-start

```bash
docker network create laf_shared_network
```

# start services

```bash
  cd ./source && docker-compose down -v && docker-compose up
 
  # open a new terminal and run the following command in root directory of this project

  # add alias
  mc alias set source http://localhost:9000 minio-root-user minio-root-password

  # add policy
  mc admin policy add source owner_by_prefix ./scripts/user-policy.json

  # add users
  sh ./scripts/create-users.sh

  # 1. restart a minio server to observe boot time
  docker-compose restart source_s4_1
  date && mc admin info source && date  # verify if minio is up or observe the logs

  # 2. restart the whole cluster servers to observe boot time
  cd ./source && docker-compose restart
  date && mc admin info source && date  # verify if minio is up or observe the logs
```

# clean up

```bash
cd ./source && docker-compose down -v
```


# issues
