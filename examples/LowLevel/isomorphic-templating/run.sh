elm make examples/LowLevel/isomorphic-templating/Server.elm --output=examples/LowLevel/isomorphic-templating/server.js
elm make examples/LowLevel/isomorphic-templating/Main.elm --output=examples/LowLevel/isomorphic-templating/main.js
echo "Elm.worker(Elm.Server);" >> examples/LowLevel/isomorphic-templating/server.js
node examples/LowLevel/isomorphic-templating/server.js
