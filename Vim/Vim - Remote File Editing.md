# Vim - Remote File Editing

------



[ Previous Page](https://www.tutorialspoint.com/vim/vim_using_vim_as_ide.htm)

[Next Page ](https://www.tutorialspoint.com/vim/vim_tips_and_tricks.htm)

Many times we need to work with remote servers. And often we edit files from those remote servers. One of the obvious solution to edit those files is to log in to the remote sever and edit files. But sometimes it is convenient to edit those files from local machine because we might have installed and configured various plug-in on our local system. In this chapter, we will discuss following items −

- Access remote files
- Understand netread and netwrite
- Other supported protocol

## Accessing remote files

Vim supports remote file editing using following syntax −

```
$vim scp://user@server.com/filepath
```

In above example vim will recognize that it has to use scp protocol and it will access file using that protocol. For instance −

```
$ vim scp://jarvis@remote-server.com//tmp/message.txt
```

Above command will open /tmp/message.txt file from remote-server. It will use SCP protocol and jarvis user’s credentials for authentication.

## Using nread and nwrite

Vim supports nread and nwrite functionality which stands for net read and net write respectively. Previous section shows method to access remote file while launching Vim. But what if you are already in Vim? Then you can use following commands −

```
:Nread scp://jarvis@localhost//tmp/message.txt
```

In addition to reading we can also modify file on remote server directly. In that case use Nwrite command as follows −

```
:Nwrite scp://jarvis@localhost//tmp/message.txt
```

Once file is opened, you can use regular Vim commands.

## Other supported protocols

In addition to SCP, Vim supports following protocols −

- FTP
- SFTP
- HTTP (read-only)
- rsync

[ Previous Page](https://www.tutorialspoint.com/vim/vim_using_vim_as_ide.htm) [ Print Page](javascript:printPage();)

[Next Page ](https://www.tutorialspoint.com/vim/vim_tips_and_tricks.htm)