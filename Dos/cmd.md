



> Kill the process by using port

- [x] Step 1

Run command-line as an Administrator. Then run the below mention command. type your port number in **yourPortNumber**

```powershell
netstat -ano | findstr :{yourPortNumber}
```

Red coloured circled area shows the PID (process identifier)

- [x] Step 2

Then you execute this command after identify the PID.

```powershell
taskkill /PID {typeyourPIDhere} /F
```

