# -*- coding: utf-8 -*-
import pika

conn = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
ch = conn.channel()
ch.exchange_declare(exchange='rpc_p', exchange_type='fanout')
ch.exchange_declare(exchange='rpc_r', exchange_type='headers')
ch.queue_declare(queue='rpc_p')
ch.queue_bind(exchange='rpc_p', queue='rpc_p')
def callback(channel, method, properties, body):
    print body
    channel.basic_ack(delivery_tag = method.delivery_tag)

rq = ch.queue_declare(exclusive=True)
qname = rq.method.queue
ch.queue_bind(exchange='rpc_r', queue=qname, arguments={'q': qname})
ch.basic_consume(callback, queue=qname)
ch.basic_publish(exchange='rpc_p', routing_key='',  body='1,2,3',
                     properties=pika.BasicProperties(
                          headers = {'q': qname},
                     )
                 )
ch.start_consuming()