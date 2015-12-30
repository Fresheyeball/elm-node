elm make examples/LowLevel/Network/Socket/Main.elm --output=examples/LowLevel/Network/Socket/main.js
echo "Elm.worker(Elm.Main);" >> examples/LowLevel/Network/Socket/main.js
echo "Can we echo?"
node examples/LowLevel/Network/Socket/main.js
# telnet localhost 8080
