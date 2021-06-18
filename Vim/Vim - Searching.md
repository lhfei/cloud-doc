# Vim - Searching

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_revisiting_editing.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_working_with_multiple_things.htm)

Search is very common action and it is one of the actions we use most of the time. In this chapter we will see some command which will allow performing these actions effectively.

In this chapter, we will discuss following items −

- Search settings
- Search in current file
- Search in multiple files
- Search in help files

## Search related settings

To perform incremental search execute following command −

```
:set incsearch
```

To highlight search execute following command −

```
:set hlsearch
```

This command will automatically highlight current matches. For instance in below image fox word is highlighted −

![Related](https://www.tutorialspoint.com/vim/images/related.jpg)

To disable incremental and highlighted search execute following commands −

```
:set noincsearch
:set nohlsearch
```

## Search in current file

### Search in forward direction

Use following commands to perform search in forward direction −

| Sr.No | Command & Description                                        |
| ----- | ------------------------------------------------------------ |
| 1     | **/<expression>**Search expression in forward direction      |
| 2     | **n**Find next occurrence. This is same and find next        |
| 3     | **N**Find previous occurrence. This is same as find previous |
| 4     | **//**Repeat previous forward search                         |

### Search in backward direction

Use following commands to perform search in backward direction

| Sr.No | Command & Description                                        |
| ----- | ------------------------------------------------------------ |
| 1     | **?<expression>**Search expression in backward direction     |
| 2     | **n**Find previous occurrence. This is same and find previous |
| 3     | **N**Find next occurrence. This is same as find next         |
| 4     | **??**Repeat previous backward search                        |

### Search word under cursor

Place cursor under any word and execute following commands to perform search operation −

| Sr.No | Command & Description                           |
| ----- | ----------------------------------------------- |
| 1     | *****Search next occurrence of current word     |
| 2     | **#**Search previous occurrence of current word |

## Search in multiple files

Using vimgrep command we can search <expression> in multiple files. For instance below command searches string - **Jarvis** in all text files.

```
:vimgrep Jarvis *.txt
```

Note that to go to next and previous occurrence we have to use following commands −

| Sr.No | Command & Description                          |
| ----- | ---------------------------------------------- |
| 1     | **:cn**Go to next occurrence of expression     |
| 2     | **:cN**Go to previous occurrence of expression |

[ Previous Page](https://www.tutorialspoint.com/vim/vim_revisiting_editing.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_working_with_multiple_things.htm)