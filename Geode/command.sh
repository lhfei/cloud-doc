192.168.44.243  host-192-168-44-243
192.168.44.245	host-192-168-44-245
192.168.44.246	host-192-168-44-246
192.168.44.247	host-192-168-44-247
192.168.44.249	host-192-168-44-249
192.168.44.253	host-192-168-44-253


start locator --name=locator_253 --port=10334 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]
start locator --name=locator_249 --port=10334 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]
start locator --name=locator_247 --port=10334 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]
start locator --name=locator_246 --port=10334 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]

start server --name=server_253 --server-port=40401 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]
start server --name=server_249 --server-port=40401 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]
start server --name=server_247 --server-port=40401 --locators=host-192-168-44-253[10334],host-192-168-44-249[10334]


create region --name=region_253 --type=REPLICATE_PERSISTENT
create region --name=region_249 --type=REPLICATE_PERSISTENT
create region --name=region_247 --type=REPLICATE_PERSISTENT

create region --name=simple_listener --type=REPLICATE_PERSISTENT --cache-listener=cn.lhfei.geode.example.listener.SimpleListener