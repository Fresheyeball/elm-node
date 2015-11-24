elm make examples/FS/Streams/Main.elm --output=examples/FS/Streams/main.js
echo "Elm.worker(Elm.Main);" >> examples/FS/Streams/main.js
node examples/FS/Streams/main.js
echo "<-- read  README.md"
echo "    wrote README-CLONE.md -->"
cat README-CLONE.md
rm README-CLONE.md
