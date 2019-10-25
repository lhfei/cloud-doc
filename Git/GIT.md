**[Git Manual](https://git-scm.com/docs/user-manual.html "Git Documentation")**
====



Author    |    Email    |    Date     |    Since    |
----------|-------------|-------------|-------------|
Hefei Li  |lhfeilaile@gmail.com| Oct. 27, 2016      |     v1.0.0  |


>### Git reset (rollback) to a special commit id

```sh
git reset --hard {commit_id}
git push origin {remote_branch_name}

git push origin -f

# git push --progress "origin" master:master
```


>### Git create a release git 

```sh
git tag -a 1.0.0 -m "Release of version 1.0.0"
git push --tags
```

>### .gitattributes: file name too long

```sh
git config --system core.longpaths true
```

>### Git reset to a special file 

```sh
git checkout HEAD -- {file_local_path}
```

>### checkout a tag

```sh
git checkout -b [branchname] [tagname]:
git checkout -b {your_branch_name} {tag}
```

>### undo latest local commit

```sh
git reset HEAD~
```

>### merge remote tag or branch into local

```sh
git merge {tag|branch}
```

>### git create branch from another branch

```sh
git checkout -b new_branch exist_branch
```

>### Git checkout a sepecifil  file from another branch

```sh
git checkout {your_branch_name} -- {file_local_path}
```

>### Git show diff by name-status

```sh
git diff --name-status 
```

>### push a new local branch to a remote repository

```sh
git push -u origin {local_branch_name}
```

>####

```sh
git pull --progress -v --no-rebase "origin" master
```

>####

```sh
git log -p --{file_name}
```

>### Deleting remote and local branches in Git

```sh
# delete remote branch
$ git push origin --delete {remote_branch_name}

# delete local branch
$ git branch -d <branch_name>
```

>### Deleting remote and local tag in Git

```sh
# delete remote tag
git push --delete origin {remote_tag_name}

# delete local tag

git tag --delete {local_tag_name}
```

>### Show Git reversion graphs

```sh
git log --graph --oneline --decorate --all

git log --graph --abbrev-commit --decorate --date=relative --all
```

>## 

```sh
git push --progress "origin" master:master
```

>### Creating and Applying Patch Files in Git

```sh
## generate a patch file
git format-patch origin -o {patchfile_name}


## apply a patch file
git am --3way --ignore-space-change --keep-cr "E:\0001-0.patch"
```

>### Rename git branch locally and remotely

```
git branch -m old_branch new_branch         # Rename branch locally    
git push origin :old_branch                 # Delete the old branch    
git push --set-upstream origin new_branch   # Push the new branch, set local branch to track the new remote
```

> ### fatal: refusing to merge unrelated histories

```sh
git pull {origin|branchname} --allow-unrelated-histories
```



```sh
git pull --progress -v --no-rebase --allow-unrelated-histories "origin"
```

