
target=source
password=minio-password
policy=owner_by_prefix

for i in `seq 1 1000`
do
  username=user-$i
  mc admin user add $target $username $password
  mc admin policy set $target $policy user=$username
done