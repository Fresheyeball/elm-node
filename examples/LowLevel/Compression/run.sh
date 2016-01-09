elm make examples/LowLevel/Compression/Main.elm --output=examples/LowLevel/Compression/main.js
echo "Elm.worker(Elm.Main);" >> examples/LowLevel/Compression/main.js
node examples/LowLevel/Compression/main.js
