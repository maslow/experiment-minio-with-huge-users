
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
 
  # add alias
  mc alias set source http://localhost:9000 minio-root-user minio-root-password

  # add policy
  mc admin policy add source owner_by_prefix ./scripts/user-policy.json

```

# clean up

```bash
cd ./source && docker-compose down -v
```


# issues
