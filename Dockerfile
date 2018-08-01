#===========================================#
#				DOTNET	BUILD				#
#===========================================#
FROM microsoft/dotnet:2.1-sdk as dotnet-build
WORKDIR /build
COPY . /build/
RUN dotnet build -c Release

#===========================================#
#				NUGET	PUSH				#
#===========================================#
FROM microsoft/dotnet:2.1-sdk as nuget-push
ARG NUGET_KEY
WORKDIR /package
COPY --from=dotnet-build /build/package/bin/Release/*.nupkg .
RUN dotnet nuget push *.nupkg -k ${NUGET_KEY} -s https://api.nuget.org/v3/index.json
