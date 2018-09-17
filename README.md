# Postgres Backup Job

This repo contains an OpenShift scheduled job to create backups of a local
PostgreSQL service.

It performs the following tasks:

- Create pod
- Dump PostgreSQL database
- Upload backups to configured S3 bucket

## Deployment

In the same project as your PostgreSQL service, deploy the 

## Scripts

Scripts are found in the scripts/ directory.

* pg_backup.sh 
* pg_backup_rotated.sh

## Configuration

Credentials are stored in an OpenShift secret, `${NAME}-secrets`, where
${NAME} is the name of the application at deployment time (parameter NAME).

The following secrets are required for the backup pod:

- `aws-access-key`: Obtained from portal
- `aws-secret-key`: Obtained from portal
- `host-base`: The S3 host basename, obtained in portal (e.g.,`cas.frn00006.ukcloud.com`)
- `bucket-name`: A unique name to store the backups
- `database-user`: username for the database connection
- `database-password`: Password for PostgreSQL connection
- `database-service`: Name of the database service to connect 
- `database-name`: The PostgreSQL database to back up

