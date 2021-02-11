# THDWebServer
Advanced Web shell for ThunderED (https://github.com/panthernet/ThunderED)

Tech: ASP.NET Core + Blazor

Docker image: https://hub.docker.com/r/panthernet/thdwebserver

Setup:
1. Use all the same steps as for ThunderED (2B) except 
    * The static folder is now auto created by Docker
    * Run command is different (presented below)
    * Pull from `panthernet/thdwebserver`
2. In `settings.json` set `"ModuleWebServer": false`
3. For prebuilt image run `docker run -p 8000:8000 -v /opt/thdwebserver:/app/Data panthernet/thdwebserver:latest`
