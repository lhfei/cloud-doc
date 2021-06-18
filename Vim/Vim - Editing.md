# Vim - Editing

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_getting_help.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_navigating.htm)

Vim provides many commands which make editing functionality really powerful. In this chapter, we will discuss following items −

- Insert
- Append
- Open new line
- Substitute
- Change
- Replace
- Join

## Insert text before cursor

To insert text before cursor perform following steps −

- To insert text before cursor perform following steps
- Switch to insert mode

```
i
```

## Insert text at the beginning of line

Let us suppose you are in the middle of line and you want to insert text at the beginning of current line then perform following steps −

- Switch to command mode

```
Esc
```

- Activate insert mode

```
I
```

This action will move cursor to the beginning of current line and switch Vim in insert mode

## Append text after cursor

To append text after cursor perform following steps

- Switch to command mode and move cursor to appropriate position

```
Esc
```

- Switch to insert mode

```
a
```

This action will move cursor next by one position and switch Vim in insert mode.

## Append text at the end of line

Let us suppose you are in the middle of line and you want to append text at the end of current line then perform following steps −

- Switch to command mode

```
Esc
```

- Switch to insert mode

```
A
```

This action will move cursor to the end of line and switch Vim in insert mode

## Open new line below cursor

Let us suppose you are in the middle of line and you want to open new line below current line then perform following steps −

- Switch to command mode

```
Esc
```

- Switch to insert mode

```
o
```

This action will insert blank line below current line and switch Vim in insert mode

## Open new line above cursor

Let us suppose you are in the middle of line and you want to open new line above current line then perform following steps −

- Switch to command mode

```
Esc
```

- Switch to insert mode

```
o
```

This action will insert blank line above current line and switch Vim in insert mode

## Substitute text

Let us suppose you want to substitute single character then perform following steps −

- Switch to command mode

```
Esc
```

- Move cursor to appropriate position
- Switch to insert mode

```
s
```

This action will delete character under cursor and switch Vim in insert mode To substitute entire line use −

```
s
```

This action will delete entire line and switch Vim in insert mode.

## Change text

Let us suppose you want to change text in current line then perform following steps −

- Switch to command mode

```
Esc
```

- Execute following command −

```
cc
```

This is similar to substitute action using S

To change text from current cursor position, execute following command

```
C
```

This action will delete text after current cursor position and switch Vim in insert mode.

## Replace text

To replace single character perform following steps −

- Switch to command mode

```
Esc
```

- Move cursor to appropriate position
- Execute following command −

```
r
```

- Enter character to be substituted.

Note that this command will not switch Vim in insert mode

To replace entire line execute −

```
R
```

It will switch Vim in replace mode as shown in below image −

![Replace](https://www.tutorialspoint.com/vim/images/replace.jpg)

## Join text

To join two lines perform following steps −

- Switch to command mode

```
Esc
```

- Move cursor to appropriate line
- Execute following command −

```
J
```

[ Previous Page](https://www.tutorialspoint.com/vim/vim_getting_help.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_navigating.htm)