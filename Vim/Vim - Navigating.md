# Vim - Navigating

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_editing.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_revisiting_editing.htm)

Vim has great support for advanced navigation. In this chapter, we’ll discuss some of the popular navigation techniques which help to improve productivity.

## Basic navigation

In basic navigation we can navigate to left, right, up and down by position. Below commands can be used for this −

| Sr.No | Command & Description                              |
| ----- | -------------------------------------------------- |
| 1     | **h**Move cursor to left by one position           |
| 2     | **l**Move cursor to right by one position          |
| 3     | **k**Move cursor to upward direction by one line   |
| 4     | **j**Move cursor to downward direction by one line |

To perform multi-position navigation use number with these commands. For instance to navigate cursor 10 line below from current line, execute following command −

```
10j
```

You can use numbers with remaining commands as well.

In addition to this, below commands also perform some useful navigation.

| Sr.No | Command & Description                             |
| ----- | ------------------------------------------------- |
| 1     | **0**Move cursor to the beginning of current line |
| 2     | **$**Move cursor to the end of current line       |
| 3     | **Ctrl + f**Scroll down entire page               |
| 4     | **Ctrl + b**Scroll up entire page                 |

## Navigate to lines

Below command can be used to navigate to specific line −

| Sr.No | Command & Description           |
| ----- | ------------------------------- |
| 1     | **:n**Jump to the nth line      |
| 2     | **:0**Jump to the start of file |
| 3     | **:$**Jump to the end of file   |

## Word navigation

We can use following commands for word navigation −

| Sr.No | Command & Description                                  |
| ----- | ------------------------------------------------------ |
| 1     | **w**Move cursor to the beginning of the next word     |
| 2     | **e**Move cursor to the end of the current word        |
| 3     | **b**Move cursor to the beginning of the previous word |

## Using jumps

Vim keeps track of your navigation using a jump list. You can go backward and forward through that list.

The jump list keeps tracks of all the places you’ve been to by tracking file name, line number and column number.

To view jump list execute following command −

```
:jumps
```

Following command are based on jump list −

| Sr.No | Command & Description                          |
| ----- | ---------------------------------------------- |
| 1     | **Ctrl + o**Jump back to the previous position |
| 2     | **Ctrl + i**Jump to the next position          |

[ Previous Page](https://www.tutorialspoint.com/vim/vim_editing.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_revisiting_editing.htm)