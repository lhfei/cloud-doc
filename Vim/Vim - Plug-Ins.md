# Vim - Plug-Ins

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_diff.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_using_vim_as_ide.htm)

Using plug-ins, we can extends the functionality of Vim. Vim supports many plug-ins and most of them are available freely. This chapter is about Vim plug-ins and we will discuss following items −

- Plug-in management
- Some useful plug-ins

## Plug-in management

This section discusses plug-in management. Vim provides various plug-ins managers but we won’t be using any plug-in manager, instead we’ll be doing all these steps manually for better understanding. Once you understand these steps, you can go with plug-in manager.

### Install plug-in

To install any plug-in perform following steps −

- Create .vim/bundle directory in user’s home directory
- Copy plug-in inside this directory
- Set runtimepath in vim

Let us install badwolf plug-in in Vim. It is a color scheme for vim.

```
$ mkdir -p ~/.vim/bundle 
$ cd ~/.vim/bundle/ 
$ git clone https://github.com/sjl/badwolf.git 
$ echo "set runtimepath^ = ~/.vim/bundle/badwolf" > ~/.vimrc
```

Now plug-in is installed, so we can use badwold color scheme as follows −

```
:colorscheme badwolf
```

### Update plug-in

If we observe carefully, plug-in is a just collection of files and if we want to update that plug-in then just update appropriate plug-in directory from ~/.vim/bundle.

### Remove plug-in

Removing plug-in in Vim is really simple. To remove plug-in perform following steps −

- Remove plug-in directory from ~/.vim/bundle
- Modify runtimepath appropriately

## Some useful plug-ins

Below is list of some useful Vim plug-ins

| Sr.No | Name & Description                                           |
| ----- | ------------------------------------------------------------ |
| 1     | **DumpX**Disassemble C/C++ code                              |
| 2     | **awk.vim**Indenting for AWK script                          |
| 3     | **Pathogen**Vim package manager                              |
| 4     | **git-switcher.vim**Automatically save and load vim session based on switching of git branch |
| 5     | **Pyflakes**Provide liniting for python files                |

[ Previous Page](https://www.tutorialspoint.com/vim/vim_diff.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_using_vim_as_ide.htm)