# Tomato Tomato

The Tomato Tomato blog, reloaded as a [Pollen](https://docs.racket-lang.org/pollen/) book

## Building

Prereqs:

* [Racket](https://racket-lang.org/)
* [Pollen](https://docs.racket-lang.org/pollen/) (quick install: `raco pkg install pollen`)
* [Yarn](https://yarnpkg.com/)

With that stuff installed, run:

```
yarn
raco pollen render
```

## Local server

```
raco pollen start
```

## Styles/JS

To update styles, watch for changes in `/src` with:

```
yarn start
```

See also: `build.sh` and `package.json` in this repo.
