#coding=utf-8
import MySQLdb
def db():
    return MySQLdb.Connection(host='127.0.0.1',port=3306,db='test',user='root',passwd='admin')

# socket
# 传输数据基本上不费时间，3次握手，四次挥手
# torndb   ----> MySqlDb  -->写sql语句
# sqlalchemy  ---> python orm类库，直接操作对象来操作数据库，django orm,

