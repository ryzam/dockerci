FROM microsoft/dotnet:2.0.6-sdk-2.1.101-jessie AS build-env

WORKDIR /dockerci

#restore
COPY DockerCI/DockerCI.csproj ./DockerCI/
RUN dotnet restore DockerCI/DockerCI.csproj

COPY DockerCITests/DockerCITests.csproj ./DockerCITests/
RUN dotnet restore DockerCITests/DockerCITests.csproj

RUN ls -alR

#copy src
COPY . .

#test
RUN dotnet test DockerCITests/DockerCITests.csproj

RUN dotnet publish DockerCI/DockerCI.csproj -c release -o /publish

FROM microsoft/aspnetcore:2.0
#ARG source
#WORKDIR /app
#EXPOSE 80
COPY --from=build-env /publish /publish
WORKDIR /publish
ENTRYPOINT ["dotnet", "DockerCI.dll"]
