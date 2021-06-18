# Vim - Getting Familiar

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_its_friends.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_getting_help.htm)

Beginning with this section we will get our hands dirty with Vim. In this chapter, we will discuss following items −

- Start Vim
- Vim modes
- Create new file
- View file in read-only mode
- Edit existing file

## Start Vim

Vim is little bit different than today’s GUI based editor. It can be started and used from GUI as well as terminal.

### Use graphical launcher

- To start Vim from graphical launcher just double click on gVim icon. It will open editor window as follows −

![Graphical](https://www.tutorialspoint.com/vim/images/graphical.jpg)

### Use terminal

Using Vim from terminal will be identical on Windows as well as Linux platform. Perform following steps to start and quit Vim from terminal −

- Open terminal and enter vim command as follows −

```
$ vim
```

- It will open Vim in terminal as follows −

![Terminal](https://www.tutorialspoint.com/vim/images/terminal.jpg)

- To close this, press Esc key followed by colon(:) and q. In Vim q command stands for quit. This command will be shown in bottom left corner of editor itself −

![Terminal One](https://www.tutorialspoint.com/vim/images/terminal_one.jpg)

## Vim modes

Vim supports multiple modes. This section discusses some of the important modes which will be used on day-to-day basis.

### Command mode

This is the default mode in which Vim starts. We can enter editor commands in this mode. We can use variety of commands in this mode like copy, paste, delete, replace and many more. We’ll discuss these commands in later sections.

**NOTE − Here onwards, any Vim command without colon indicates that we are executing that command in command mode.**

### Insert mode

You can use this mode to enter/edit text. To switch from default command to insert mode press i key. It will show current mode in bottom left corner of editor.

We can enter any text once we are in insert mode. Below image shows this −

![Modes](https://www.tutorialspoint.com/vim/images/modes.jpg)

Use Escape key to switch back to command mode from this mode.

### Command line mode

This mode is also used to enter commands. Commands in this mode starts with colon(:). For instance, in previous section quit command was entered in this mode. We can go to this mode either from command or insert mode.

- To switch from command mode to this mode just type colon
- To switch from insert mode to this mode press Escape and type colon

In below image colon at bottom left indicates line mode.

![Commandline](https://www.tutorialspoint.com/vim/images/commandline.jpg)

**NOTE − Here onwards, any Vim command starting with colon indicates that we are executing that command in command line mode.**

### Visual mode

In this mode we can visually select text and run commands on selected sections.

- To switch from command mode to visual mode type v
- To switch from any other mode to visual mode first switch back to command mode by pressing Escape, then type v to switch to visual mode

In below image bottom left corner shows visual mode.

## Create new file

Perform below steps to create and save new file −

- Execute following command to open Vim

```
$ vim
```

- Type following command in Vim

```
:edit message.txt
```

- It will reload file if, it exist already

- Switch to insert mode

```
i
```

- Enter some text
- Switch back to command mode

```
Esc
```

- Save changes to file

```
:w
```

Now message.txt file will be created.

- Quit Vim

```
:q
```

## Open file in read-only mode

Use –R option to open file in read-only mode

```
$ vim -R message.txt
```

In below image bottom left corner shows read-only mode −

![Open File](https://www.tutorialspoint.com/vim/images/open_file.jpg)

Alternatively you can use view command to achieve same result.

```
$ view message.txt
```

## Edit existing file

Perform below steps to edit existing file −

- Open file using Vim

```
$ vim message.txt
```

- Switch to insert mode and enter some text there.

```
i
```

- Quit editor without saving changes

```
:q!
```

- OR

- Save changes and quit editor using following command −

```
:wq
```

[ Previous Page](https://www.tutorialspoint.com/vim/vim_its_friends.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_getting_help.htm)