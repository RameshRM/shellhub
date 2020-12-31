#docker run \
#  --privileged \
#  --network=host \
#  --pid=host \
#  -v /:/host \
#  -v /dev:/dev \
#  -v /var/run/docker.sock:/var/run/docker.sock \
#  -v /etc/passwd:/etc/passwd \
#  -v /etc/group:/etc/group \
#  -e SHELLHUB_SERVER_ADDRESS=http://localhost \
#  -e SHELLHUB_PRIVATE_KEY=./ssh_private_key \
#  -e SHELLHUB_TENANT_ID=DC8B5B5D-8CEE-43E1-8FF7-CFA1A780BF84 \
#  agent:latest
docker rm -f shellhub

docker build -f ./agent/Dockerfile.amd64 ./ -t agent:latest

docker run \
  --network="host" \
   -v /var/run/docker.sock:/var/run/docker.sock \
  -e SHELLHUB_SERVER_ADDRESS=http://localhost \
  -e SHELLHUB_PRIVATE_KEY=./ssh_private_key \
  -e SHELLHUB_TENANT_ID=DC8B5B5D-8CEE-43E1-8FF7-CFA1A780BF84 \
  agent:latest

#docker run \
#    --network="host" \
#   -v /var/run/docker.sock:/var/run/docker.sock \
#   -e SHELLHUB_SERVER_ADDRESS=http://localhost:3333 \
#  agent:latest