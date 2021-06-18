# Vim - Diff

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_folding.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_plug_ins.htm)

Similar to UNIX diff command we can use Vim to show diff in much better manner. It will show diff in colorful manner. In this chapter, we will discuss following items −

- Show differences between files
- Activate and deactivate diff mode
- Navigation in diff mode
- Applying changes from diff window

## Show difference

To show differences between files execute below command −

```
$ vimdiff <file> <file> 
OR 
$ vim –d <file> <file>
```

For instance below command shows differences −

![Show](https://www.tutorialspoint.com/vim/images/show.jpg)

In above image, text highlighted in magenta color is common. Remaining text is highlighted in red color which indicates that there are some differences after common text.

## Activate and deactivate diff mode

If you are already in vim and you want to perform diff action, then use one of the following command −

### diffsplit

Use below command to perform horizontal split −

```
:diffsplit filename
```



![Split](https://www.tutorialspoint.com/vim/images/split.jpg)

Above images shows that we are comparing two files namely message-1.txt and message-2.txt.

### Vertical diffsplit

To perform vertical split use following command −

```
:vert diffsplit <filename>
```

It opens following window −

![Vertical](https://www.tutorialspoint.com/vim/images/vertical.jpg)

Above images shows that we are comparing two files namely message-1.txt and message-2.txt.

## Navigation in diff mode

Navigation in diff mode is little bit different. For instance, when you scroll text from one window then text from adjacent window also scrolled. This is called scrollbind. To enable this use −

```
:set scrollbind
```

To disable this use −

```
:set noscrollbind
```

If you edit file in this mode then use following command to update diff −

```
:diffupdate
```

### Switch between diff window

To switch between diff windows execute following command −

```
Ctrl + w Ctrl + w
```

Please note that, we have to press Ctrl + w 2 times.

### Jump to previous change

In diff window, execute following command to jump to previous change −

```
[c
```

### Jump to next change

In diff window, execute following command to jump to next change −

```
]c
```

## Apply changes from diff window

### Applying change in current diff windows

To apply change from adjacent diff window to current diff windows execute −

```
:diffget
```

For instance, if you are in left window and you want to take change from right window to current window then you will execute above command.

### Apply change from current pane to another

To apply change from current diff window to adjacent diff window execute −

```
:diffput
```

For instance, if you are in left window and you want apply change from current window to right window then you will execute above command.

[ Previous Page](https://www.tutorialspoint.com/vim/vim_folding.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_plug_ins.htm)