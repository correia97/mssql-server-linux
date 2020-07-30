clear 
echo 'Build do 2017'

docker build . --no-cache -t luizcarlosfaria/mssql-server-linux:2017-latest -f Dockerfile-sql2017

docker run \
--rm \
-it \
-e 'ACCEPT_EULA=Y' \
-e 'SA_PASSWORD=8k3W2C2BVzAW9p' \
-e 'MSSQL_DATABASE=db01' \
-e 'MSSQL_DATABASE_COLLATE=SQL_Latin1_General_CP1_CI_AI' \
-e 'MSSQL_USER=bbb' \
-e 'MSSQL_PASSWORD=ccc' \
-p 1433:1433 \
luizcarlosfaria/mssql-server-linux:2017-latest


clear
echo 'Build do 2019'

docker build . --no-cache -t luizcarlosfaria/mssql-server-linux:2019-latest -f Dockerfile-sql2019

docker run \
--rm \
-it \
-e 'ACCEPT_EULA=Y' \
-e 'SA_PASSWORD=8k3W2C2BVzAW9p' \
-e 'MSSQL_DATABASE=db01' \
-e 'MSSQL_DATABASE_COLLATE=SQL_Latin1_General_CP1_CI_AI' \
-e 'MSSQL_USER=bbb' \
-e 'MSSQL_PASSWORD=ccc' \
-p 1434:1433 \
luizcarlosfaria/mssql-server-linux:2019-latest