#-*- encoding:utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(
        host='localhost'))
channel = connection.channel()

channel.exchange_declare(exchange='testing',exchange_type='headers')


result = channel.queue_declare(exclusive=True)
if not result:
    print 'Queue didnt declare properly!'
    sys.exit(1)
queue_name = result.method.queue


channel.queue_bind(exchange='testing',
                   queue = queue_name,
                   routing_key = '',
                   arguments = {'ham': 'good', 'x-match':'any'})

def callback(ch, method, properties, body):
    print "{headers}:{body}".format(headers = properties.headers,
                                    body = body)

channel.basic_consume(callback,
                      queue = queue_name,
                      no_ack=True)

try:
    channel.start_consuming()
except KeyboardInterrupt:
    print 'Bye'
finally:
    connection.close()