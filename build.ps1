dotnet publish DockerCI/DockerCI.csproj -c Release -o obj/Docker/publish
docker-compose up --build