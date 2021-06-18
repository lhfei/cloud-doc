# Vim - Markers

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_working_with_multiple_things.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_macros.htm)

Vim supports bookmark feature. Using this feature we can make navigation within file really faster. In this chapter, we will discuss following items −

- Create bookmark
- Jump to bookmark
- List all bookmarks
- Delete bookmarks
- Local bookmarks
- Global bookmarks

## Create bookmark

To create bookmark execute following command −

```
m{bookmark-name}
```

In above example bookmark-name is single alphabetical character. For instance, below command creates bookmark of name a.

```
ma
```

## Jump to bookmark

Once bookmark is created we can jump there. Following command can be use to jump to bookmark −

| Sr.No | Command & Description                                        |
| ----- | ------------------------------------------------------------ |
| 1     | **`{bookmark-name}**Move to the exact location of bookmark. Please note that this character is back quote |
| 2     | **‘{bookmark-name}**Jump to the beginning of bookmark line. Please note that this character is single quote |

## List all bookmarks

To list all bookmarks execute following command −

```
:marks
```

In below image it show list of bookmarks for current file

![Bookmarks](https://www.tutorialspoint.com/vim/images/bookmarks.jpg)

## Delete bookmark

To delete bookmarks execute following command −

```
:delmarks {bookmark-name}
```

For instance, below command delete bookmark with name a.

```
:delmarks a
```

## Local bookmarks and global bookmarks

When you have multiple files open and if you want to go to a particular position in any one of the open files, then you can use global mark feature of Vim.

If the bookmark name is an upper case letter, then that is a global Bookmark. Above discussed commands are applicable for both local and global bookmarks.

[ Previous Page](https://www.tutorialspoint.com/vim/vim_working_with_multiple_things.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_macros.htm)