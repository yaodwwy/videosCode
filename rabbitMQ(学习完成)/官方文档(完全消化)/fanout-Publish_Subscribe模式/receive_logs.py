#-*- encoding:utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()
channel.exchange_declare(exchange='logs',exchange_type='fanout')
#以上是公共部分

result = channel.queue_declare(exclusive=True)
queue_name = result.method.queue
print"sys.argv[1]=",sys.argv[1]
channel.queue_bind(exchange='logs',routing_key=sys.argv[1],queue=queue_name)

print(' [*] Waiting for logs. To exit press CTRL+C')

def callback(ch, method, properties, body):
    print(" [x] %r" % body)

channel.basic_consume(callback,queue=queue_name,no_ack=True)
channel.start_consuming()