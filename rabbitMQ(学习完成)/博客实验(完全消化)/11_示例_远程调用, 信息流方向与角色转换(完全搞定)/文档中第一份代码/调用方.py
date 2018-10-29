# -*- coding: utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pika
conn = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
ch = conn.channel()
ch.exchange_declare(exchange='rpc_p',exchange_type='fanout')
ch.queue_declare(queue='rpc_p')
ch.queue_declare(queue='rpc_r')
ch.queue_bind(exchange='rpc_p', queue='rpc_p')

def callback(channel, method, properties, body):
    print body
    channel.basic_ack(delivery_tag = method.delivery_tag)

ch.basic_consume(callback, queue='rpc_r')
ch.basic_publish(exchange='rpc_p', routing_key='',  body='1,2,3,4')
#把需要发送信息的绑定一下
ch.start_consuming()