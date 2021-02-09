#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

RUN mkdir "/opt/thdwebserver"

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["THDWebServer/THDWebServer.csproj", "THDWebServer/"]
RUN dotnet restore "THDWebServer/THDWebServer.csproj"
COPY . .
WORKDIR "/src/THDWebServer"
RUN dotnet build "THDWebServer.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "THDWebServer.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "THDWebServer.dll"]