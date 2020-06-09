CURRENT_DATE_FORMATED=$(date  "+%Y-%m-%dT%H:%M:%S")
PGPASSWORD=pass
PG_USER=rpolnx
PG_HOST=localhost
PG_DATABASE=k8s
DESTINATION_FILE=backup/pg_bkp__$CURRENT_DATE_FORMATED.pgsql

#pg_dump postgresql://$PG_USER:$PGPASSWORD@$PG_HOST:5432/$PG_DATABASE
echo "Backuping on date: "$CURRENT_DATE_FORMATED
echo $DESTINATION_FILE

bkp="pg_dump -U $PG_USER -h $PG_HOST $PG_DATABASE > $DESTINATION_FILE"
echo $bkp
mkdir -p backup
pg_dump -U $PG_USER -h $PG_HOST $PG_DATABASE > $DESTINATION_FILE
