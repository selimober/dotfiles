## How to autoload functions?

After setting fpath to cover your custome function directory, you need to mark your functions to be able to autoload:
```
autoload -Uz hello
```

assumes there is file called `hello` somewhere in your fpath
