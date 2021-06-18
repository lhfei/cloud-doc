# Vim - Folding

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_registers.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_diff.htm)

Fold functionality will be useful when file contents large text. Using this feature we can only show selected potion of file. This feature is particularly useful while working with programming languages. In this chapter, we will discuss following items −

- Activate and deactivate fold functionality
- Various fold actions

## Fold activation and deactivation

To activate fold use following command −

```
:set foldenable 
:set foldmethod = indent
```

To deactivate fold use following command

```
:set nofoldenable
```

## Fold actions

### Close fold

To fold code, go to any method and execute following command −

```
zc
```

For example below image shows the result of this action −

![Close](https://www.tutorialspoint.com/vim/images/close.jpg)

### Open fold

To open fold use following command −

```
zo
```

Below image shows the result of this action −

![Open](https://www.tutorialspoint.com/vim/images/open.jpg)

### Close all folds

To close all folds execute following command

```
zM
```

Below image shows the result of this action

![Folds](https://www.tutorialspoint.com/vim/images/folds.jpg)

### Unfold all

To unfold all execute following −

```
zR
```

Below image shows the result of this action −

![Unfold](https://www.tutorialspoint.com/vim/images/unfold.jpg)

[ Previous Page](https://www.tutorialspoint.com/vim/vim_registers.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_diff.htm)