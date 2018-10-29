# -*- coding: utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pika
import tornado.gen
import tornado.ioloop

def on_confirm(method):
    print method

def on_publish((ch, method, prop, body)):
    print method.reply_code

@tornado.gen.engine
def on_channel(channel):
    method = yield tornado.gen.Task(channel.exchange_declare, exchange='first', type='fanout')#声明exchange
    method = yield tornado.gen.Task(channel.queue_declare, queue='A')#声明queue
    #method = yield tornado.gen.Task(channel.queue_bind, exchange='first', queue='A')
    channel.confirm_delivery(callback=on_confirm, nowait=True)
    channel.add_on_return_callback(on_publish)
    channel.basic_publish(exchange='first', routing_key='', body='good', mandatory=True)
    #channel.basic_publish(exchange='first', routing_key='', body='good')
    #channel.close()

def on_connect(conn):
    conn.channel(on_open_callback=on_channel)

def publish():
    pika.TornadoConnection(pika.ConnectionParameters('localhost'),
                           on_open_callback=on_connect)

if __name__ == '__main__':
    publish()
    tornado.ioloop.IOLoop().current().start()