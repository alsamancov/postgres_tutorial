"# Postgresql tutorial" 

#https://www.pgexercises.com/




docker pull postgresqlaas/docker-postgresql-9.6

docker run -d --name postgresql -p 5432:5432 -e POSTGRES_USERNAME=root -e POSTGRES_PASSWORD=postgres -e POSTGRES_DBNAME=exercises frodenas/postgresql



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

#http://www.postgresqltutorial.com

docker run --name postgis -e POSTGRES_PASSWORD=dba -e POSTGRES_USER=dba -e POSTGRES_DB=fm -p 55432:5432 -v pgdata:/var/lib/postgresql/data -d mdillon/postgis:9.6-alpine
docker logs --tail 100 postgis