#!/usr/bin/env python
import pika
import sys

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()
#以上是公共部分
channel.queue_declare(queue='task_queue', durable=True)#消息持久化

message = ' '.join(sys.argv[1:]) or "Hello World!"
channel.basic_publish(exchange='',
                      routing_key='task_queue',
                      body=message,
                      properties=pika.BasicProperties(
                         delivery_mode = 2, # make message persistent(消息持久化)
                      ))
print(" [x] Sent %r" % message)
connection.close()