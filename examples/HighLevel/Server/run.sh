elm make examples/HighLevel/Server/Server.elm --output=examples/HighLevel/Server/server.js
echo "Elm.worker(Elm.Server);" >> examples/HighLevel/Server/server.js
node examples/HighLevel/Server/server.js
