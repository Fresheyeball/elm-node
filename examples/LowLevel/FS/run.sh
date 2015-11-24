elm make examples/LowLevel/FS/Main.elm --output=examples/LowLevel/FS/main.js
echo "Elm.worker(Elm.Main);" >> examples/LowLevel/FS/main.js
echo "Do we have access to readme?"
node examples/LowLevel/FS/main.js
