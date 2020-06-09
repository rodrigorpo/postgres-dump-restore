PG_FILE=$(ls backup -Art | tail -n 1)
echo $PG_FILE
rm -rf restore
mkdir -p restore
cp backup/$PG_FILE restore/bkp.pgsql
tar -cvzf restore.tar.gz restore

docker cp restore.tar.gz postgres:/

docker exec postgres rm -rf effective-restore.sh
docker cp effective-restore.sh postgres:/
docker exec postgres sh effective-restore.sh

rm -rf restore.tar.gz
rm -rf restore
