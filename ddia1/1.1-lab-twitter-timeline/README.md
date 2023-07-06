TODO docker instructions

docker build --platform linux/arm64 -t nathanwilk7/ddia-1.1:arm64 .
docker build --platform linux/amd64 -t nathanwilk7/ddia-1.1:amd64 .

docker push nathanwilk7/ddia-1.1:arm64
docker push nathanwilk7/ddia-1.1:amd64