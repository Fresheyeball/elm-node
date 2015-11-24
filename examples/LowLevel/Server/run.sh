elm make examples/LowLevel/Server/Server.elm --output=examples/LowLevel/Server/server.js
echo "Elm.worker(Elm.Server);" >> examples/LowLevel/Server/server.js
node examples/LowLevel/Server/server.js
