#===========================================#
#				DOTNET	BUILD				#
#===========================================#
FROM microsoft/aspnetcore-build:2-jessie as dotnet-build
WORKDIR /build
COPY . /build/
RUN dotnet build -c Release

#===========================================#
#				NUGET	PUSH				#
#===========================================#
FROM microsoft/aspnetcore-build:2-jessie as nuget-push
ARG NUGET_KEY
WORKDIR /package
COPY --from=dotnet-build /build/package/bin/Release/*.nupkg .
RUN dotnet nuget push *.nupkg -k ${NUGET_KEY} -s https://api.nuget.org/v3/index.json
