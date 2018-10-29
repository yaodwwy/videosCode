# -*- coding: utf-8 -*-

import pika

conn = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
ch = conn.channel()
ch.exchange_declare(exchange='rpc_r', exchange_type='fanout')
ch.queue_declare(queue='rpc_r')
ch.queue_declare(queue='rpc_p')
ch.queue_bind(exchange='rpc_r', queue='rpc_r')

def callback(channel, method, properties, body):
    print body
    s = sum(int(x) for x in body.split(','))
    channel.basic_publish(exchange='rpc_r', routing_key='', body=str(s))
    channel.basic_ack(delivery_tag = method.delivery_tag)

ch.basic_consume(callback, queue='rpc_p')
ch.start_consuming()