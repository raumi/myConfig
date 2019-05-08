# myConfig

Includes different config files (for Vim, bash profile, etc).

## Ubuntu
For a tool to import/export a linux terminal profile, see https://github.com/yktoo/yktools/blob/master/gnome-terminal-profile

If you want to use CTRL-C and CTRL-V for copy and paste in the terminal, consider remapping CTRL-C to interrupt commands to CTRL-K:

```
stty intr ^k
stty -g > ~/.stty
```
