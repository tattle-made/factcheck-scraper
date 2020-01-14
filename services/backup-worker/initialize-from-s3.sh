echo 'initializing db 2'

mkdir ~/.aws
touch ~/.aws/credentials
echo [tattle] >> ~/.aws/credentials
echo 'aws_access_key_id = '${AWS_ACCESS_KEY_ID} >> ~/.aws/credentials
echo 'aws_secret_access_key = '${AWS_SECRET_ACCESS_KEY} >> ~/.aws/credentials

dbDir="/app/data/db"
echo $dbDir

if [ -d $dbDir ]
then
    echo "DB already exists. Won't restore"
else
    echo "DB does not exist. Restoring from S3"
    aws s3 sync s3://${S3_DB_DIRECTORY} /app/data
    mongorestore --host=database:27017 /app/data/db
fi

touch /app/test.txt

tail -f /app/test.txt