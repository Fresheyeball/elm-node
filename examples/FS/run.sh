elm make examples/FS/Main.elm --output=examples/FS/main.js
echo "Elm.worker(Elm.Main);" >> examples/FS/main.js
node examples/FS/main.js
