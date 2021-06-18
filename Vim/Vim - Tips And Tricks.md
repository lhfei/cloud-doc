------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_remote_file_editing.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_personalization.htm)

Now we got fair idea about Vim. Let us discuss few tips and tricks of Vim to improve productivity. In this section, we will discuss following items −

- Convert spaces to tabs and vice-versa
- Highlight miss-spelled words
- Word completion
- Copy line character by character
- Indent code
- Change file format

## Convert spaces to tabs and vice-versa

### Convert tabs to spaces

If you are editing a file and you want to convert entered tab character to spaces then execute following command −

```
:set expandtab
```

Note that, this command will not change existing tabs to spaces. To achieve this execute following command −

```
:set tabstop = 4 shiftwidth = 4 expandtab 
:retab
```

In above command we are instructing Vim to convert tabs into 4 spaces

### Convert spaces to tabs

To convert spaces to tabs execute below command −

```
:set noexpandtab :retab!
```

## Highlight miss-spelled words

We can instruct Vim to highlight miss-spelled words. To do this execute following command −

```
:set spell
```

Below image highlights misspelled word in Vim −

![Spelled](https://www.tutorialspoint.com/vim/images/spelled.jpg)

## Word completion

Vim also provides word completion. For this execute following command in insert mode −

```
Ctrl + p
```



![Completion](https://www.tutorialspoint.com/vim/images/completion.jpg)

## Copy character line by line

Use following command to copy and paste line character by character −

| Sr.No | Command & Description                                    |
| ----- | -------------------------------------------------------- |
| 1     | **Ctrl + y**Copy and paste text located above the cursor |
| 2     | **Ctrl + e**Copy and paste text located below the cursor |

Note the we have to use these commands in insert mode.

## Indent code

If you have un-indented code to indent it execute following command −

```
=%
```

For instance, if you have un-indented code like this −

![Indent](https://www.tutorialspoint.com/vim/images/indent.jpg)

Then go to line 4 and execute =% command. It will indent code like this −

![Indent Code](https://www.tutorialspoint.com/vim/images/indent_code.jpg)

## Change file format

To change file format to UNIX execute following command −

```
:set ff = unix
```

To change file format to DOS execute following command −

```
:set ff = dos
```

[ Previous Page](https://www.tutorialspoint.com/vim/vim_remote_file_editing.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_personalization.htm)

