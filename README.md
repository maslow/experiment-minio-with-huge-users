
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
git clone git@github.com:maslow/experiment-minio-with-huge-users.git
cd experiment-minio-with-huge-users

docker network create laf_shared_network
```

# start services

```bash
  docker-compose down -v && docker-compose up

  # add alias
  mc alias set source http://localhost:9000 minio-root-user minio-root-password

  # add policy
  mc admin policy add source owner_by_prefix ./scripts/user-policy.json

  # add users
  sh ./scripts/create-users.sh

  # 1. restart a minio server to observe boot time
  docker-compose restart experiment-minio-with-huge-users_s4_1
  date && mc admin info source && date  # verify if minio is up or observe the logs

  # 2. restart the whole cluster servers to observe boot time
  docker-compose restart
  date && mc admin info source && date  # verify if minio is up or observe the logs
```

# clean up

```bash
docker-compose down -v
```


# issues
