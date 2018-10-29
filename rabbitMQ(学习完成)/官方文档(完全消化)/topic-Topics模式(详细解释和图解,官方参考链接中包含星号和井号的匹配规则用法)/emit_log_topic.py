#-*- encoding:utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf-8')

import pika

connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()
channel.exchange_declare(exchange='topic_logs',exchange_type='topic')
#以上是公共部分,接收方和发送方都要建立.



print"sys.argv[0]=",sys.argv[0]#这个是文件名
print"sys.argv[1]=",sys.argv[1]#这是从文件外面传入routing_key,来确保安全性
routing_key = sys.argv[1] if len(sys.argv) > 2 else 'anonymous.info'
print"routing_key=",routing_key
print"类型",type(routing_key)
message = ' '.join(sys.argv[2:]) or 'Hello World!'#这是从文件外面传入要传递的信息,传给sys.argv[2:],来确保安全性
channel.basic_publish(exchange='topic_logs',routing_key=routing_key,body=message)
print(" [x] Sent %r:%r" % (routing_key, message))
connection.close()
#总结:
#connection里面有多个channel
#channel里面可以有多个exchange
#exchange可以绑定多个queue
#可以看到,代码中没有queue,也就是说发送方不关心消息去了哪里.

#可以看到,发送方只管connection,channel和exchange

#sys.argv[0]这个是文件名
#sys.argv[1]这是从文件外面传入routing_key,来确保安全性
#sys.argv[2]这是从文件外面传入要传递的信息,传给sys.argv[2:],来确保安全性
#这里的0,1,2分别表示:
#python emit_log_topic.py(这个是表示第0个参数,对应于)sys.argv[0]   第1个参数(sys.argv[1])  第2个参数(对应sys.argv[2])
#以上就是整句运行命令,其实命令格式就是"python 第一个参数 第二个参数 第三个参数 ....."
