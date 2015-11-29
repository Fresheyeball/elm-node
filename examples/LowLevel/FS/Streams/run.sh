rm examples/LowLevel/FS/Streams/main.js
elm make examples/LowLevel/FS/Streams/Main.elm --output=examples/LowLevel/FS/Streams/main.js
echo "Elm.worker(Elm.Main);" >> examples/LowLevel/FS/Streams/main.js
node examples/LowLevel/FS/Streams/main.js
echo "<-- read  README.md"
echo "    wrote README-CLONE.md -->"
cat README-CLONE.md
rm README-CLONE.md
