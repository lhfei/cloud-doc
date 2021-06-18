# Vim - Registers

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_macros.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_folding.htm)

Vim provides many registers. We can use these registers as multiple clipboards. This feature is really useful while working with multiple files. In this chapter, we will discuss following items −

- Copy text in register
- Paste text from register
- List available registers
- Register types

## Copy text in register

For copying, we can use normal yank command i.e. yy and to store it in register we can use following syntax −

```
“<register-name><command>
```

For instance, to copy text in register “a” use following command −

```
“ayy
```

## Paste text from register

To paste text from register use −

```
“<register-name>p
```

For instance, below command copies text from register “a” −

```
“ap
```

## List available registers

To list all available registers use following command

```
:registers
```

## Register types

Vim supports following types of registers −

### Unnamed registers

Unnamed register is denoted by “”. Vim stores deleted or copied text in this register

### Named registers

We can use 26 named registers; we can use a-z or A-Z. By default vim doesn’t uses these registers.

If we use lower case register name then contents will be overwritten and if we use uppercase name then contents will be appended in that register.

### Numbered registers

We can use 0 to 9 named registers. Vim fills these registers with text from yank and delete command.

- Numbered register 0 contains the text from the most recent yank command.
- Numbered register 1 contains the text deleted by the most recent delete or change command

### Default registers

Following are the default registers −

| Sr.No | Register & Description                                 |
| ----- | ------------------------------------------------------ |
| 1     | **%**Name of the current file                          |
| 2     | **#**Name of the alternate file for the current window |
| 3     | **:**Most recently executed command                    |
| 4     | **.**Contains the last inserted text                   |
| 5     | **“**Last used register                                |

[ Previous Page](https://www.tutorialspoint.com/vim/vim_macros.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_folding.htm)