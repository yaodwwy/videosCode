#-*- encoding:utf-8 -*-
import pika
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

#接收方管connection,exchange,channel


connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))#一个Connection其实就是
channel = connection.channel()
channel.exchange_declare(exchange='topic_logs',exchange_type='topic')#这个与发送方的代码完全一致
#以上是公共部分,接收方和发送方都需要设置


result = channel.queue_declare(queue_name="topic_queue",exclusive=True)

#从声明中可以看到,channel中对于exchange和queue的声明是等同地位的,并且默认是不绑定的.

queue_name = result.method.queue
print"sys.argv[1:]=",sys.argv[1:]
binding_keys = sys.argv[1:]#表示接受所有参数
if not binding_keys:
    sys.stderr.write("Usage: %s [binding_key]...\n" % sys.argv[0])
    sys.exit(1)

for binding_key in binding_keys:
    print"binding_key=",binding_key
    print"类型:",type(binding_key)
    channel.queue_bind(exchange='topic_logs',queue=queue_name,routing_key=binding_key)
#☆☆☆可以看到,这里集齐三要素,exchange,queue,routing_key再进行绑定操作

print(' [*] Waiting for logs. To exit press CTRL+C')

def callback(ch, method, properties, body):#这个callback函数没啥用,就是让接收端显示接收到了什么信息而已.
    print(" [x] %r:%r" % (method.routing_key, body))

channel.basic_consume(callback,queue=queue_name,no_ack=True)

channel.start_consuming()