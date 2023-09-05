# Configure Git to use a proxy

## In Brief

You may need to configure a proxy server if you're having trouble cloning or fetching from a remote repository or getting an error like `unable to access '...' Couldn't resolve host '...'`.

Consider something like:

```
git config --global http.proxy http://proxyUsername:proxyPassword@proxy.server.com:port
```

Or for a specific domain, something like:

```
git config --global http.https://domain.com.proxy http://proxyUsername:proxyPassword@proxy.server.com:port
git config --global http.https://domain.com.sslVerify false
```

Setting `http.<url>.sslVerify` to `false` may help you quickly get going if your workplace employs man-in-the-middle HTTPS proxying. Longer term, you could get the root CA that they are applying to the certificate chain and specify it with either `http.sslCAInfo` or `http.sslCAPath`.

See also the [git-config](https://git-scm.com/docs/git-config) documentation, especially the following sections if you're having HTTPS/SSL issues

- `http.sslVerify`
- `http.sslCAInfo`
- `http.sslCAPath`
- `http.sslCert`
- `http.sslKey`
- `http.sslCertPasswordProtected`

## In Detail

### Configure the proxy

You can configure these globally in your user `~/.gitconfig` file using the `--global` switch, or local to a repository in its `.git/config` file.

#### Setting a global proxy

Configure a global proxy if all access to all repos require this proxy

```
git config --global http.proxy http://proxyUsername:proxyPassword@proxy.server.com:port
```

#### URL specific proxy

If you wish to specify that a proxy should be used for just some URLs that specify the URL as a git config subsection using `http.<url>.key` notation:

```
git config --global http.https://domain.com.proxy http://proxyUsername:proxyPassword@proxy.server.com:port
```

Which will result in the following in the `~/.gitconfig` file:

```
[http]
[http "https://domain.com"]
	proxy = http://proxyUsername:proxyPassword@proxy.server.com:port
```

#### Handle subsequent SSL protocol errors

If you're still having trouble cloning or fetching and are now getting an `unable to access 'https://...': Unknown SSL protocol error in connection to ...:443` then you may decide to switch off SSL verification for the single operation by using the `-c http.sslVerify=false` option

```
git -c http.sslVerify=false clone https://domain.com/path/to/git
```

Once cloned, you may decide set this for just this cloned repository's `.git/config` by doing. Notice the absence of the `--global`

```
git config http.sslVerify false
```

If you choose to make it global then limit it to a URL using the `http.<url>.sslVerify` notation:

```
git config --global http.https://domain.com.sslVerify false
```

Which will result in the following in the `~/.gitconfig` file:

```
[http]
[http "https://domain.com"]
	proxy = http://proxyUsername:proxyPassword@proxy.server.com:port
	sslVerify = false
```

### Show current configuration

To show the current configuration of all `http` sections

```
git config --global --get-regexp http.*
```

If you are in a locally cloned repository folder then you drop the `--global` and see all current config:

```
git config --get-regexp http.*
```

### Unset a proxy or SSL verification

Use the `--unset` flag to remove configuration being specific about the property -- for example whether it was `http.proxy` or `http.<url>.proxy`. Consider using any of the following:

```
git config --global --unset http.proxy
git config --global --unset http.https://domain.com.proxy

git config --global --unset http.sslVerify
git config --global --unset http.https://domain.com.sslVerify
```