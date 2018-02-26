"# Postgresql tutorial" 

docker pull postgresqlaas/docker-postgresql-9.6

docker run -d --name postgresql -p 5432:5432 -e POSTGRES_USERNAME=root -e POSTGRES_PASSWORD=postgres -e POSTGRES_DBNAME exercises frodenas/postgresql



Removing Containers
List:
docker ps -a 

Remove:
docker rm ID_or_Name ID_or_Name

Remove all images

List:
docker images -a

Remove:
docker rmi id