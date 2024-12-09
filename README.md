# My Bash Config

These are my configuration files for the Bourne Again Shell, aka Bash, 
possibly one of the most annoying pieces of software to configure.


## TODO

- Add support for cd-on-quit in clifm; requires
    - reading the clifm license (GPL v2)
    - adding a license to this repo (likely AGPL)

## Issues

### Startup files & tmux

Tmux (the Terminal MUltpleXer) has to load a new shell everytime you open a 
new tab or pane. Unfortunately, unlike in an actual terminal, it starts bash 
as a "login shell". This means that bash uses `~/.profile` for startup 
instead of the usual `~/.bashrc`. If you search for this online, you will 
likely find suggestions that you change your `~/.profile` to deal with 
behaviour likely adding something along the lines of
```sh
case "$-" in
    *i*) [ -s "$HOME/bashrc" ] && source "$HOME/bashrc";;
esac
```
that loads your `.bashrc` if the shell is interactive.

However, instead of changing bash to fix tmux's odd behaviour, I think it's 
better to set the `default-command` option in tmux to `bash -i`, which just 
explicitly tells bash to use the `.bashrc`.


### Inputrc & key names

Bash may have been Bourne Again, but it remembers its previous life. This 
means it has some interesting quirks, like the fact that the software used 
to read input from the user is actually a completely different piece of 
software from bash, which has its own config file, `~/.inputrc`. This file 
also has its own quirks within quirks, namely that:
    - Escape == Alt, so Alt is represented by `\e`
    - Return == Carriage Return *only*, so Return cannot be represented by 
      `\n`, and is only represented by `\r`


### Shell integration with other applications

Some applications give you stuff to add to your `.bashrc`. Inevitably they 
want to make sure that this stuff can use the correct values of `PATH`, 
etc., and so they tell you to put *their* thing at the end of your 
`.bashrc`, with no thought about the other developers who had the same idea. 
I currently have 2 or 3 different pieces of shell script that all have to be 
at the end of `.bashrc`. This has been difficult to achieve.
