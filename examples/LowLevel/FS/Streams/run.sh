rm examples/LowLevel/FS/Streams/main.js
elm make examples/LowLevel/FS/Streams/Main.elm --output=examples/LowLevel/FS/Streams/main.js
echo "Elm.worker(Elm.Main);" >> examples/LowLevel/FS/Streams/main.js
node examples/LowLevel/FS/Streams/main.js
echo "<-- read"
echo "    wrote clone -->"
cat examples/LowLevel/FS/Streams/.testfile-clone
rm examples/LowLevel/FS/Streams/.testfile examples/LowLevel/FS/Streams/.testfile-clone
