param (
    [string]$version = $(throw "-version is required.")
)
 
.nuget\NuGet.exe pack .\kafka-net\kafka-net.csproj -version $version -prop configuration=release -outputdirectory .\kafka-net\bin\Release -verbosity detailed
.nuget\nuget.exe push .\kafka-net\bin\Release\kafka-net-clc.$version.nupkg Pass@word1 -s http://nuget.t3n.dom -verbosity detailed

# ..\.nuget\nuget.exe delete kafka-net-clc 1.0.0.0 Pass@word1 -s http://nuget.t3n.dom -verbosity detailed \
