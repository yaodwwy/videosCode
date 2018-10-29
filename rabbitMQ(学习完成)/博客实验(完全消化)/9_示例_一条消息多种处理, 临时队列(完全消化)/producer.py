# -*- coding: utf-8 -*-

import pika

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='first', exchange_type='fanout')

for i in range(10):
    channel.basic_publish(exchange='first', routing_key='', body=str(i))
