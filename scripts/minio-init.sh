#!/bin/sh
set -eu

mc alias set local http://minio:9000 "$MINIO_ROOT_USER" "$MINIO_ROOT_PASSWORD"
mc mb -p "local/$MINIO_BUCKET"

echo "camada criada pelo laboratorio" > /tmp/.keep
for pasta in bronze silver gold; do
  mc cp /tmp/.keep "local/$MINIO_BUCKET/$pasta/.keep"
done

echo "MinIO inicializado: bucket '$MINIO_BUCKET' com bronze/silver/gold."
