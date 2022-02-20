



```python
def test3():
    url = "http://www.ip.cn"
    proxy_handler = urllib2.ProxyHandler({'http' : 'http://username:password@host:port'})
    opener = urllib2.build_opener(proxy_handler);
    urllib2.install_opener(opener)
    conn = urllib2.urlopen(url)
    print conn.read()
```

