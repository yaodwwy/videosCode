#-*- encoding:utf-8 -*-
import sys  
reload(sys)
sys.setdefaultencoding('utf-8')
import pika


   
connection = pika.BlockingConnection(pika.ConnectionParameters(host = 'localhost' ))  
channel = connection.channel()  
channel.exchange_declare(exchange = 'direct_logs' , exchange_type = 'direct' )  
#上面是公共部分
result = channel.queue_declare(exclusive = True )  
queue_name = result.method.queue  
severities = sys.argv[ 1 :]  
if not severities:  
     print >> sys.stderr, "Usage: %s [info] [warning] [error]" % (sys.argv[ 0 ],)  
     sys.exit( 1 )  
for severity in severities:  
     channel.queue_bind(exchange = 'direct_logs' ,  
                        queue = queue_name,  
                        routing_key = severity)  
print ' [*] Waiting for logs. To exit press CTRL+C'  
def callback(ch, method, properties, body):  
     print " [x] %r:%r" % (method.routing_key, body,)  
channel.basic_consume(callback,  
                       queue = queue_name,  
                       no_ack = True )  
channel.start_consuming()  