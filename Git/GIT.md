#**[Git Manual](https://git-scm.com/docs/user-manual.html "Git Documentation")**

``` 
```
Author    |    Email    |    Date     |    Since    |
----------|-------------|-------------|-------------|
Hefei Li  |lhfeilaile@gmail.com| Oct. 27, 2016      |     v1.0.0  |
```
```

>## git reset (rollback) to a special commit id

```sh
git reset --hard {commit_id}
git push origin {remote_branch_name}
```

>## .gitattributes: file name too long

```sh
git config --system core.longpaths true
```

>## Git reset to a special file 

```sh
git checkout HEAD -- {file_local_path}
```

>## checkout a tag

```sh
git checkout -b {your_branch_name}  tags/{tag}
git checkout tags/{tag} -b {your_branch_name}}
```

>## undo latest local commit

```sh
git reset HEAD~
```

>## merge remote tag or branch into local

```sh
git merge {tag|branch}
```

>## git create branch from another branch

```sh
git checkout -b new_branch exist_branch
```

>## Git checkout a sepecifil  file from another branch

```sh
git checkout {your_branch_name} -- {file_local_path}
```

>### Git show diff by name-status

```sh
git diff --name-status 
```