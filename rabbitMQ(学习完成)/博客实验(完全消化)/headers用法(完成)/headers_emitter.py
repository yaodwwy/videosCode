#-*- encoding:utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='testing',exchange_type='headers')

fields = {'ham': 'good'}
try:
    while True:
        data = raw_input('> ')
        if '=' in data:
            key, val = data.split('=')
            fields[key] = val
            continue
        channel.basic_publish(exchange = 'testing',
                              routing_key = '',
                              body = data,
                              properties = \
                                  pika.BasicProperties(headers = fields))
        print ' [x] Send {0} with headers: {1}'.format(data, fields)
except KeyboardInterrupt:
    print 'Bye'
finally:
    connection.close()