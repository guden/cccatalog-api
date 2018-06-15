#!/bin/bash

# Set up Docker daemon
yum -y install docker
service docker start

# Run the synchronizer
docker pull creativecommons/elasticsearch_syncer
docker run -t \
-e AWS_ACCESS_KEY_ID="${aws_access_key_id}" \
-e AWS_SECRET_ACCESS_KEY="${aws_secret_access_key}" \
-e ELASTICSEARCH_URL="${elasticsearch_url}" \
-e ELASTICSEARCH_PORT="${elasticsearch_port}" \
-e AWS_REGION="${aws_region}" \
-e DJANGO_DATABASE_HOST="${database_host}" \
-e DJANGO_DATABASE_USER="deploy" \
-e DJANGO_DATABASE_PASSWORD="${database_password}" \
-e DJANGO_DATABASE_NAME="openledger" \
-e DATABASE_PORT="${database_port}" \
-e DB_BUFFER_SIZE="${db_buffer_size}" \
-e COPY_TABLES="${copy_tables}" \
creativecommons/elasticsearch_syncer &