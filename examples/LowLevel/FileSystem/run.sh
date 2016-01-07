elm make examples/LowLevel/FileSystem/Main.elm --output=examples/LowLevel/FileSystem/main.js
echo "Elm.worker(Elm.Main);" >> examples/LowLevel/FileSystem/main.js
echo "Do we have access to readme?"
node examples/LowLevel/FileSystem/main.js
