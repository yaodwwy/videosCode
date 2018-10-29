# -*- coding: utf-8 -*-

import pika

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()
channel.exchange_declare(exchange='first', exchange_type='fanout')
r = channel.queue_declare(exclusive=True)
#那么在 Consuming 断掉连接之后, 这个queue 也是应该被销毁的. 
#即声明 queue 时使用 exclusive=True 即可

channel.queue_bind(exchange='first', queue=r.method.queue)
channel.basic_qos(prefetch_count=1)

def callback(ch, method, properties, body):
    print body
    import time
    time.sleep(4)
    ch.basic_ack(delivery_tag = method.delivery_tag)

channel.basic_consume(callback, queue=r.method.queue)
channel.start_consuming()