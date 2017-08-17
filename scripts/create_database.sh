
DBUSR="${DB_USR:-hexagonal_usr}"
DBNAME="${DBNAME:-hexagonal_db_development}"

echo -------------------- deleting database $DBNAME --------------------
dropdb $DBNAME

echo -------------------- deleting user $DBUSR --------------------
dropuser $DBUSR

echo -------------------- creating user $DBUSR --------------------
createuser --no-password --superuser $DBUSR

echo -------------------- listing users --------------------
psql postgres -c '\du'

echo -------------------- creating database $DBNAME --------------------
createdb $DBNAME --owner $DBUSR

echo -------------------- listing privileges --------------------
psql $DBNAME $DBUSR -c '\dp'

echo -------------------- listing tables --------------------
psql $DBNAME $DBUSR -c '\dt'
