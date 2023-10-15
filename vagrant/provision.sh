#!/usr/bin/bash


# install dotnet 6.0

sudo apt update && sudo apt -y install dotnet6


# run docker mssql server
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Development1" -e "MSSQL_PID=Express" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest

# sleep to ensure proper database running
sleep 10

# restore project (dev build)
dotnet restore src/Server/Server.csproj

# run project (dev build)
dotnet run watch --project src/Server/Server.csproj
