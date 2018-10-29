#-*- encoding:utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
#!/usr/bin/env python
import pika
import sys

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='logs',exchange_type='fanout')

message = ' '.join(sys.argv[1:]) or "info: Hello World!"
channel.basic_publish(exchange='logs',routing_key='',body=message)
print(" [x] Sent %r" % message)
connection.close()
#因为Fanout则忽略routing_key，直接广播给所有的Queue；
#也就是说,在Fanout的模式下,是广撒网给queue的.