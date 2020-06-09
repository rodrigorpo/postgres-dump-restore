PGPASSWORD=pass
PG_USER=rpolnx
PG_HOST=localhost
PG_DATABASE=k8s
PG_FILE=restore/bkp.pgsql

tar -xf restore.tar.gz

echo "psql  -U $PG_USER -h $PG_HOST -d $PG_DATABASE -f $PG_FILE"
psql  -U $PG_USER -h $PG_HOST -d $PG_DATABASE -f $PG_FILE
#pg_restore -U $PG_USER -h $PG_HOST -d $PG_DATABASE  $PG_FILE
rm -rf restore
rm -rf restore.tar.gz

