#!/usr/bin/env python
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()


channel.queue_declare(queue='hello')

channel.basic_publish(exchange='',
                      routing_key='hello',#这里填写的是queue的名字
                      body='Hello World!')
print(" [x] Sent 'Hello World!'")
connection.close()