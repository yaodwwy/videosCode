#-*- encoding:utf-8 -*-
import pika
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()
channel.exchange_declare(exchange='logs',exchange_type='fanout')#因为这里是fanout模式,所以会发给其他所有队列,所以队列与exchange的绑定在这里可以忽略.
#以上是公共部分



# message = ' '.join(sys.argv[1:]) or "info: Hello World!"
message="Hello,world"
print"sys.argv[1]=",sys.argv[1]
channel.basic_publish(exchange='logs',routing_key=sys.argv[1],body=message)
print(" [x] Sent %r" % message)
connection.close()