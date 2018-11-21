#coding=utf-8
import socket
from multiprocessing import Process
from threading import Thread
# django,tornado 都是tcp，java，
def handle_request(client_socket):
    print '调用了'
    client_request_date = client_socket.recv(2048)
    print client_request_date
    client_socket.send('HTTP/1.1 200 ok\r\n')  # 响应行
    client_socket.send('Name: zhangsan\r\n')  # 响应头 1：主机名：姓名 ：给谁：helowolrd
    client_socket.send('\r\n')  # 响应空行
    client_socket.send('hello zhangsan')  # 响应体
    client_socket.close()
def main():
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    # 设置应用结束，端口立即释放
    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    server_socket.bind(('', 9000))  # 绑定端口
    server_socket.listen(128)  # 同时最多有多少个请求能够处理
    while True:
        client_socket, client_address = server_socket.accept()
        handle_process = Process(target=handle_request, args=(client_socket,))
        handle_process.start()
        client_socket.close()


if __name__ == '__main__':
    main()


