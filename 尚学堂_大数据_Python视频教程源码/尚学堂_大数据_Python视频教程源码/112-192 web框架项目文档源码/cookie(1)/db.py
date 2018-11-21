#coding=utf-8
import MySQLdb
con =MySQLdb.Connection(host='127.0.0.1',db='test',user='root',passwd='admin')
cursor = con.cursor()
cursor.execute('insert into authuser (account,password) values ("%s","%s")'%('admin','admin'))
con.commit()
cursor.close()

con.close()