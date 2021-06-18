# Vim - Revisiting Editing

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_navigating.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_searching.htm)

We have seen basic editing earlier. Let us understand some other editing features of Vim. In this section, we will discuss following items −

- Buffer
- Swap files
- Cut, copy, delete, paste actions
- Undo and redo actions

## Buffer

Buffer is temporary memory used by Vim. When we open a file in editor, Vim loads its contents from disk drive. These contents are stored in memory (RAM) whenever we edit a file we are actually editing file from buffer. Once we finish editing and save file that time only buffer contents are transferred to appropriate file.

## Swap

Swap area is a file created by Vim to store buffer contents periodically. While editing file our changes may be lost because of any reasons and Vim provides swap files to provide data recovery.

To get actual name of swap file execute following command −

```
:swapname
```

For instance in my case name was message.txt.swp as show in below image −

![Swap](https://www.tutorialspoint.com/vim/images/swap.jpg)

## Cut, Copy and paste actions

We often perform cut, copy and paste actions on text. Vim provides following commands to perform these actions (y stands for yank and p stands for paste action) −

| Sr.No | Command & Description                               |
| ----- | --------------------------------------------------- |
| 1     | **x**Delete character from cursor position          |
| 2     | **X**Delete previous character from cursor position |
| 3     | **y**Copy single character from cursor position     |
| 4     | **p**Paste character after cursor position          |
| 5     | **P**Paste character before cursor position         |

## Multi-position command

We can use cut, copy and paste commands with words and sentences as well. Below table shows this −

| Sr.No | Command & Description                        |
| ----- | -------------------------------------------- |
| 1     | **dw**Delete word from cursor position       |
| 2     | **D**Delete entire line from cursor position |
| 3     | **dd**Delete entire line                     |
| 4     | **Y**Copies entire line                      |
| 5     | **yy**Copies entire line                     |

To perform multi-line/multi-word actions just use numbers with command. You can use this syntax with other commands as well. For instance, to delete 3 words use −

```
3dw
```

## Undo

We can undo single or multiple actions. To perform one time undo action execute −

```
u
```

To perform multiple undo action, use number with same command. For instance, below command will undo last 3 actions −

```
3u
```

In addition to this, to undo all execute following command −

```
U
```

## Redo

Redo is apposite action of undo. Execute any of the command to perform redo action.

```
Ctrl + r
OR
: red
```

[ Previous Page](https://www.tutorialspoint.com/vim/vim_navigating.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_searching.htm)