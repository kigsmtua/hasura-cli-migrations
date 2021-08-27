set -e

cp -a "/hasura-metadata/." "/hasura/metadata/"
cp -a "/hasura-migrations/." "/hasura/migration/"

cd /hasura
echo "version: 2" > config.yaml
echo "endpoint: $ENDPOINT" >> config.yaml
echo "metadata_directory: metadata" >> config.yaml

/hasura/hasura migrate apply  --endpoint $ENDPOINT

/hasura/hasura metadata apply --endpoint $ENDPOINT
