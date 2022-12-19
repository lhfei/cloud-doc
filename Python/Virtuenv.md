Create ENV

```shell
# for Python 3.6
virtualenv venv --python=python3.6

# for Python 3.8
virtualenv venv --python=python3.8

# for Python 3.10
virtualenv venv --python=python3.10
```







```ini
Scripts\activate.ps1 cannot be loaded because runn
ing scripts is disabled on this system. For more information, see about_Execution_Policies at https:/go.microsoft.com/f
wlink/?LinkID=135170.
At line:1 char:1
+ .\Scripts\activate
+ ~~~~~~~~~~~~~~~~~~
    + CategoryInfo          : SecurityError: (:) [], PSSecurityException
```



```powershell
set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

