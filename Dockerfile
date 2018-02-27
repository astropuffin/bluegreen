# build stage
FROM golang:alpine AS build-env
ADD . /src
RUN cd /src && go build -o bluegreen

# final stage
FROM alpine
WORKDIR /
COPY --from=build-env /src/bluegreen /
ENTRYPOINT ./bluegreen
