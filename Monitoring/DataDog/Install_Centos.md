## Installing on CentOS/RedHat

The Datadog Agent has `x86_64` packages. For other architectures, use the [source install](https://app.datadoghq.com/signup/agent#agent/source).

These instructions are for CentOS/RHEL 6 and above.

1. Use our easy one-step install.

   ```
   DD_API_KEY=3d049f5cc230b76801c46ac0e917e96e bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"
   ```

   This will install the YUM packages for the Datadog Agent and will prompt you for your password.

    

   If the Agent is not already installed on your machine and you don't want it to start automatically after the installation, just prepend

    

   ```
   DD_INSTALL_ONLY=true
   ```

    

   to the above script before running it.

   

2. If you're upgrading from agent 5.17+.

   ```
   DD_UPGRADE=true bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/datadog-agent/master/cmd/agent/install_script.sh)"
   ```

   This will install the agent, similarly to what is described above, but we will also import your existing Agent 5 configuration so that you can get up and running immediately.

   

   **Note:** the import process won't automatically move custom checks, this is by design since we cannot guarantee full backwards compatibility out of the box.

If you prefer to see the installation step-by-step, [click here](https://app.datadoghq.com/signup/agent#).