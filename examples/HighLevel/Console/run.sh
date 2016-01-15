elm make examples/HighLevel/Console/Main.elm --output=examples/HighLevel/Console/main.js
echo "Elm.worker(Elm.Main);" >> examples/HighLevel/Console/main.js
node examples/HighLevel/Console/main.js
