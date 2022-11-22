# Elm Template 1

Template used in the class "Become a programmer".

## Usage

### Initialize

1. Create your own repository with this repository as a template.
2. In your repository, run `npm install` to install tools we need.

### Development

Start the hot reload watcher with `npm start`. It will recompile as soon as you save a change.

Open the file `index.html` in you browser and try out your application.

### Problem
```
/home/perty/Projects/test1/node_modules/elm-watch/index.js:71
  return /^\d+$/.test(value ?? "") ? Number(value) : defaultValue;
                             ^

SyntaxError: Unexpected token '?'
    at wrapSafe (internal/modules/cjs/loader.js:915:16)
    at Module._compile (internal/modules/cjs/loader.js:963:27)
    at Object.Module._extensions..js (internal/modules/cjs/loader.js:1027:10)
    at Module.load (internal/modules/cjs/loader.js:863:32)
    at Function.Module._load (internal/modules/cjs/loader.js:708:14)
    at Function.executeUserEntryPoint [as runMain] (internal/modules/run_main.js:60:12)
```
Fixed by installing nvm and then nvm install --lts
