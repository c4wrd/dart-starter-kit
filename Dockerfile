FROM google/dart
MAINTAINER Cory Forward

ENV ENVIRONMENT "PROD"

ENV ROOT /app
ENV CLIENT $ROOT/client
ENV SERVER $ROOT/server
ENV WWWROOT $ROOT/wwwroot

ADD client/lib $CLIENT/lib
ADD client/web $CLIENT/web
ADD client/pubspec.yaml $CLIENT/pubspec.yaml

ADD server/bin $SERVER/bin
ADD server/pubspec.yaml $SERVER/pubspec.yaml

# Build the client application and install dependencies
WORKDIR $CLIENT
RUN pub get
RUN pub build --output $WWWROOT

# Install server dependencies
WORKDIR $SERVER
RUN cd $SERVER && pub get

EXPOSE 8080
ENTRYPOINT ["dart"]
CMD ["bin/server.dart"]