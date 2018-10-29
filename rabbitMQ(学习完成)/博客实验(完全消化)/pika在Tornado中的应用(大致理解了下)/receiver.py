# -*- coding: utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
#这个代码是异步的接收代码
import pika
import tornado.gen
import tornado.ioloop
import functools

def on_msg(qname, ch, method, prop, body):
    print qname, body
    ch.basic_ack(delivery_tag = method.delivery_tag)
    ch.basic_consume(functools.partial(on_msg, qname), queue=qname)

@tornado.gen.engine
def on_channel(channel):
    method = yield tornado.gen.Task(channel.exchange_declare, exchange='first', type='fanout')
    method = yield tornado.gen.Task(channel.queue_declare)
    qname = method.method.queue
    method = yield tornado.gen.Task(channel.queue_bind, exchange='first', queue=qname)
    method = yield tornado.gen.Task(channel.basic_qos, prefetch_count=1)
    channel.basic_consume(functools.partial(on_msg, qname), queue=qname)


def on_connect(conn):
    conn.channel(on_open_callback=on_channel)

def consume():
    pika.TornadoConnection(pika.ConnectionParameters('localhost'),
                           on_open_callback=on_connect)

if __name__ == '__main__':
    consume()
    tornado.ioloop.IOLoop().current().start()