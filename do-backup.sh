rm -rf backup
docker exec postgres rm -f effective-backup.sh
docker cp effective-backup.sh postgres:/
docker exec postgres tar -cvzf backup.tar.gz backup
docker cp postgres:/backup.tar.gz .
docker exec postgres rm -rf backup.tar.gz
tar -xf backup.tar.gz
rm -rf backup.tar.gz

