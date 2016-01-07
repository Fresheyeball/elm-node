elm make examples/LowLevel/Process/Main.elm --output=examples/LowLevel/Process/main.js
echo "Elm.worker(Elm.Main);" >> examples/LowLevel/Process/main.js
echo "What is the environment?"
node examples/LowLevel/Process/main.js
