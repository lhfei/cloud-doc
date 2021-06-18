# Vim - Macros

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_markers.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_registers.htm)

Macro is record and play feature. When this is combined with Vim commands it becomes really powerful combination. In this section, we will discuss following items −

- Start recording
- Perform Vim actions
- Stop recording
- Play recording

## Start recording

To start recording press q followed by any lower case letter as a macro name. For instance in below example I have used “a” as a macro name

![Recording](https://www.tutorialspoint.com/vim/images/recording.jpg)

## Perform Vim actions

In this step you can perform any Vim actions like: cut, copy, delete, replace and so on.You can see these actions by executing following command −

```
:registers
```

For instance, below command shows that yank and delete actions were performed −

![Perform](https://www.tutorialspoint.com/vim/images/perform.jpg)

## Stop recording

Once you are done with actions, press q again to stop recording. Now recording mode will disappear as shown below −

![Stop](https://www.tutorialspoint.com/vim/images/stop.jpg)

## Play

To play execute below command −

```
@{macro-name}
```

For instance to execute macro “a”, execute below command −

```
@a
```

To play same macro multiple times use numbers with it. For instance, to execute same macro 10 times execute following command −

```
10@a
```

[ Previous Page](https://www.tutorialspoint.com/vim/vim_markers.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_registers.htm)