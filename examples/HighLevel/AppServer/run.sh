elm make examples/HighLevel/AppServer/Main.elm --output=examples/HighLevel/AppServer/main.js
echo "Elm.worker(Elm.Main);" >> examples/HighLevel/AppServer/main.js
node examples/HighLevel/AppServer/main.js
