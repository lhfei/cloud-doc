



>#The WebSocket Protocol


```json
Request URL:wss://xdata.jcloud.com/exp/ws/standard?noteId=2CD1KS9C2_20170316-154552
Request Method:GET
Status Code:101 

Accept-Encoding:gzip, deflate, sdch, br
Accept-Language:en-US,en;q=0.8,en-ZA;q=0.6
Cache-Control:no-cache
Connection:Upgrade
Cookie: <too long, ignore it...>
JCLOUD_LOCALSTORE=%7B%22jcloud_uuid%22%3A%22lhfei%22%7D; app.key=58D34122B37E11E59EC733AABDB34A57; streaming.name=active_users_stream; _gat=1; _ga=GA1.2.2092145710.1481871851
Host:xdata.jcloud.com
Origin:https://xdata.jcloud.com
Pragma:no-cache
Sec-WebSocket-Extensions:permessage-deflate; client_max_window_bits
Sec-WebSocket-Key:1vussGWDtsH15oom9XZ4dA==
Sec-WebSocket-Version:13
Upgrade:websocket
User-Agent:Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36
```

```json
Connection:upgrade
Date:Thu, 16 Mar 2017 07:45:54 GMT
Sec-WebSocket-Accept:l8FmF5BgtKZlWFMKwbxchPk1jhg=
Sec-WebSocket-Extensions:permessage-deflate;client_max_window_bits=15
Server:nginx/1.8.0
Upgrade:websocket

```


![WebSocketFrame.png](D:/workspace/webapps_alibaba/websocket-smart/websocket-smart/icons/WebSocketFrame.png "")


>#Using the HTML5 WebSocket API

```ini
[Constructor(in DOMString url, optional in DOMString protocol)]
interface WebSocket {
  readonly attribute DOMString URL;
  // ready state
  const unsigned short CONNECTING = 0;
  const unsigned short OPEN = 1;
  const unsigned short CLOSED = 2;
  readonly attribute unsigned short readyState;
  readonly attribute unsigned long bufferedAmount;

  // networking
  attribute Function onopen;
  attribute Function onmessage;
  attribute Function onclose;
  boolean send(in DOMString data);
  void close();
};
WebSocket implements EventTarget;

```



> ## 1.WebSocket Attributes

Following are the attribute of WebSocket object. Assuming we created Socket object as mentioned above ?


	Attribute	        |		Description
------------------------|-----------------------------------------------------------------------------------------|
Socket.readyState	    |A value of 0 indicates that the connection has not yet been established.
			            |A value of 1 indicates that the connection is established and communication is possible.
			            |A value of 2 indicates that the connection is going through the closing handshake.
			            |A value of 3 indicates that the connection has been closed or could not be opened.
Socket.bufferedAmount	|represents the number of bytes of UTF-8 text that have been queued using send() method.  |



> ## 2.WebSocket Events

Event	|    Event Handler	    |    Description
--------|-----------------------|-----------------------------------------------------------
open	|    Socket.onopen	    |This event occurs when socket connection is established.
message	|    Socket.onmessage	|This event occurs when client receives data from server.
error	|    Socket.onerror	    |This event occurs when there is any error in communication.
close	|    Socket.onclose	    |This event occurs when connection is closed.


> ## 3.WebSocket Methods

Method    	      |    Description
------------------|------------------------------------------------------------------------|
Socket.send()     | The send(data) method transmits data using the connection.
Socket.close()    | The close() method would be used to terminate any existing connection.







1. 较少的控制开销。在连接建立后，服务器和客户端之间交换数据时，用于协议控制的数据包头部相对较小。在不包含扩展的情况下，对于服务器到客户端的内容，此头部大小只有2至10字节（和数据包长度有关）；对于客户端到服务器的内容，此头部还需要加上额外的4字节的掩码。相对于HTTP请求每次都要携带完整的头部，此项开销显著减少了。

1. 更强的实时性。由于协议是全双工的，所以服务器可以随时主动给客户端下发数据。相对于HTTP请求需要等待客户端发起请求服务端才能响应，延迟明显更少；即使是和Comet等类似的长轮询比较，其也能在短时间内更多次地传递数据。

1. 保持连接状态。于HTTP不同的是，Websocket需要先建立连接，这就使得其成为一种有状态的协议，之后通信时可以省略部分状态信息。而HTTP请求可能需要在每个请求都携带状态信息（如身份认证等）。
更好的二进制支持。Websocket定义了二进制帧，相对HTTP，可以更轻松地处理二进制内容。

1. 可以支持扩展。Websocket定义了扩展，用户可以扩展协议、实现部分自定义的子协议。如部分浏览器支持压缩等。


1. 更好的压缩效果。相对于HTTP压缩，Websocket在适当的扩展支持下，可以沿用之前内容的上下文，在传递类似的数据时，可以显著地提高压缩率。