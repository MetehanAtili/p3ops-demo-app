#!/usr/bin/bash

# install dotnet 6.0

sudo apt update && sudo apt -y install dotnet6


# run docker mssql server
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Development1" -e "MSSQL_PID=Express" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest

# sleep to ensure proper database running
sleep 10

# restore project (dev build)
sudo dotnet restore /vagrant/src/Server/Server.csproj

# restore tests (dev build)
sudo dotnet restore /vagrant/tests/Domain.Tests/Domain.Tests.csproj

# run tests (dev build)
sudo dotnet test /vagrant/tests/Domain.Tests/Domain.Tests.csproj

# run project (dev build) run it in background
sudo dotnet run --project /vagrant/src/Server/Server.csproj &





