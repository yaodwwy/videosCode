# -*- coding: utf-8 -*-
import pikaimport uuid

conn = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
ch = conn.channel()
ch.exchange_declare(exchange='rpc_p', type='fanout')
ch.exchange_declare(exchange='rpc_r', type='direct')
ch.queue_declare(queue='rpc_p')
ch.queue_bind(exchange='rpc_p', queue='rpc_p')
def callback(channel, method, properties, body):
    print body, properties.correlation_id
    channel.basic_ack(delivery_tag = method.delivery_tag)

rq = ch.queue_declare(exclusive=True)
qname = rq.method.queue
ch.queue_bind(exchange='rpc_r', queue=qname, routing_key=qname)
ch.basic_consume(callback, queue=qname)
ch.basic_publish(exchange='rpc_p', routing_key=qname,  body='1,2,3',
                 properties=pika.BasicProperties(
                     reply_to = qname,
                     correlation_id = uuid.uuid4().hex
                 ))
ch.start_consuming()