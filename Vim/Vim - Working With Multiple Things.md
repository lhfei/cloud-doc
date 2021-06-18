# Vim - Working With Multiple Things

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_searching.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_markers.htm)

Vim is very powerful editor. It supports many advanced features to work with multiple files, buffer and windows. In this section, we will discuss following items −

- Multiple files
- Multiple buffers
- Multiple tabs
- Multiple windows

## Multiple files

Let us suppose you are editing a file and you want to open another file in same Vim session. In that case, you can use Vim’s edit command. Below table shows these commands

| Sr.No | Command & Description                                        |
| ----- | ------------------------------------------------------------ |
| 1     | **:e**Load new file in buffer for editing                    |
| 2     | **:edit**Same as :e                                          |
| 3     | **:e <tab>**List the files for editing from current directory |
| 4     | **:edit <tab>**Same as :e <tab>                              |

## Multiple buffers

We have already seen what Vim buffers are. Vim supports multiple buffers. Below commands will be useful will working with buffers −

| Sr.No | Command & Description                                        |
| ----- | ------------------------------------------------------------ |
| 1     | **:badd <file>**Add file into new buffer                     |
| 2     | **:bN**Switch to Nth buffer. For instance to switch to 3rd buffer use :b3 |
| 3     | **:bnext**Move to the next buffer in buffer list             |
| 4     | **:bprevious**Move to the previous buffer in buffer list     |
| 5     | **:buffers**List all buffers                                 |
| 6     | **:bfirst**Move to the first buffer                          |
| 7     | **:blast**Move to the last buffer                            |
| 8     | **:ball**Load all buffers                                    |

For instance, below command adds new file to buffer −

![Multiple](https://www.tutorialspoint.com/vim/images/multiple.jpg)

Now, there are two files in buffer. Execute below command to show this −

```
:buffers
```

It will show following output −

![Buffer](https://www.tutorialspoint.com/vim/images/buffer.jpg)

## Multiple tabs

Like other editors we can also open multiple tabs in Vim. Below table describes tab related commands −

| Sr.No | Command & Description                    |
| ----- | ---------------------------------------- |
| 1     | **:tabnew**Open new tab                  |
| 2     | **:tabnew <file>**Open new file in tab   |
| 3     | **:tabclose**Close current tab           |
| 4     | **:tabnext**Move to the next tab         |
| 5     | **:tabprevious**Move to the previous tab |
| 6     | **:tabfirst**Move to the first tab       |
| 7     | **:tablast**Move to the last tab         |

For instance, below images shows multiple tabs

![Tabs](https://www.tutorialspoint.com/vim/images/tabs.jpg)

## Multiple windows

In Vim we can create new window using following commands −

| Sr.No | Command & Description                  |
| ----- | -------------------------------------- |
| 1     | **:new <file>**Open new window         |
| 2     | **:new <file>**Open file in new window |

In below image, we can see that current Vim window is split into 2 parts after executing following commands −

```
$vim message.txt
:new
```



![Window](https://www.tutorialspoint.com/vim/images/window.jpg)

[ Previous Page](https://www.tutorialspoint.com/vim/vim_searching.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_markers.htm)