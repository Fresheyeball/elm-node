rm examples/LowLevel/FileSystem/Streams/testfile examples/LowLevel/FileSystem/Streams/testfile-clone
rm examples/LowLevel/FileSystem/Streams/main.js
elm make examples/LowLevel/FileSystem/Streams/Main.elm --output=examples/LowLevel/FileSystem/Streams/main.js
echo "Elm.worker(Elm.Main);" >> examples/LowLevel/FileSystem/Streams/main.js
node examples/LowLevel/FileSystem/Streams/main.js
echo "<-- read"
echo "    wrote clone -->"
cat examples/LowLevel/FileSystem/Streams/testfile-clone
rm examples/LowLevel/FileSystem/Streams/testfile examples/LowLevel/FileSystem/Streams/testfile-clone
