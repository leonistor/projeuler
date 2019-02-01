# My Project Euler

My solutions to the problems at [Project Euler](http://projecteuler.net/).

### Haskell Stack workflow

#### New project for Problem 00X

```bash
mcd 00X
stack new Problem00X --bare simple
stack setup
```
For VS Code + Haskero:

`stack build intero`

copy .gitignore

#### Packages, exec

TBD

### Utils

[Github Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)

[Golang Cheatsheet](https://devhints.io/go)

[The haskell gurus solutions](https://wiki.haskell.org/Euler_problems)

### Haskell local modules without cabal/stack

... and make Haskero VS Code happy :-)

Use folder structure:

```
--project
    /.vscode
      settings.json
    /lib
      Library.hs -> "module Library(mySuperFunc) where ..."
    /src
      Main.hs    -> "import Library(mysuperFunc) ..."
```

_settings.json_
```json
{
  "haskero.intero.ghciOptions": [
    "-Wall"
    ,"-ilib"
  ]
}
```
Run code with

`runghc --ghc-arg=-ilib src/Main.hs`

The `-i` argument accepts folder locations. To test with `-i../../lib`

test working
