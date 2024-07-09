#image build
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 as build

WORKDIR /app

COPY src/Worker/Worker.csproj .

RUN dotnet restore

COPY src/Worker/ .

RUN dotnet publish -c Release -o /out Worker.csproj

#image run
FROM mcr.microsoft.com/dotnet/core/runtime:3.1

COPY ./script.sh /usr/local/bin/healthcheck.sh

RUN chmod +x /usr/local/bin/healthcheck.sh

WORKDIR /app

COPY --from=build /out .

CMD ["dotnet", "Worker.dll"]