### get和post区别 ###
* get在url中 ，url长度不能超过2k

		127.0.0.1:8000/user/register/?username=admin&paswword=admin
* post在请求体

			请求行
			请求头
			请求空行
			请求体	（username=admin&paswword=admin）
* request.GET和request.POST都是QueryDict的实例
### *agrs和**kwargs ###
* 位置参数
* 关键字参数

### 注册 ###
* UNIQUE constraint failed: User_user.username
* 异常转换
 * 数据中报的是唯一性约束异常
 * 转换成UserExistException
### 重定向 ###
* 302 让浏览器重新发起请求，在响应头中会有location告诉浏览器在服务器找谁？
 * /user/register/
 * 响应头是
			
				HTTP/1.0 302 Found
				Date: Mon, 30 Oct 2017 02:02:09 GMT
				Server: WSGIServer/0.1 Python/2.7.13
				X-Frame-Options: SAMEORIGIN
				Content-Type: text/html; charset=utf-8
				Location: /user/
				Content-Length: 0  
 * 发现响应头中的location字段，name浏览器就知道接着去找谁了
 * 浏览器刷新意味着再一次执行浏览器上一次操作
### 文件上传 ###
* enctype="multipart/form-data"
* 加上时间戳去重
* request.FILES    InMemoryUploadedFile


				  username =   request.POST.get('username')
				    file = request.FILES.get('headimg')
				    # InMemoryUploadedFile()
				    name = file.name[:file.name.index(r'.')]+str(time.time()*1000)+file.name[file.name.index(r'.'):]
				    fw = open(os.path.join(BASE_DIR,name),'wb')
				    fw.write(file.read())
				    fw.close()
				    return  HttpResponse('上传成功')
* .chunks() 片段（读一部分，写一部分）


					  username =   request.POST.get('username')
					    file = request.FILES.get('headimg')
					    # InMemoryUploadedFile()
					    name = file.name[:file.name.index(r'.')]+str(time.time()*1000)+file.name[file.name.index(r'.'):]
					    fw = open(os.path.join(BASE_DIR,name),'wb')
					    for part in file.chunks():
					        fw.write(part)
					    fw.close()
					    return  HttpResponse('上传成功')

* with as

			  username =   request.POST.get('username')
			    file = request.FILES.get('headimg')
			    name = file.name[:file.name.index(r'.')]+str(time.time()*1000)+file.name[file.name.index(r'.'):]
			    with open(os.path.join(BASE_DIR,name),'wb') as fw:
			        for part in file.chunks():
			            fw.write(part)
			    return  HttpResponse('上传成功')
### request ###
* get数据
* post数据
* 文件数据
### cookie ###
* 客户端存储技术
 *  cookie是存在浏览器的
 *  广告
 *  获得cookies  COOKIES 【字典】
 *  所有的字典的操作get,items,['']
* 如何写一个cookies
 * response.set_cookie() 写cookie 
 * key,value
 * 过期时间 （expires）如果过期就自动删除，不过期的话访问服务器的时候并且在同一路径下会自动携带cookie的值
 * 回话结束 浏览器关了 
 * max_age = 60*10  10分钟
 * path  路径 路径相同会自动携带 （path） path='/user/'
 * 当你访问127.0.0.1:8000/user/***  子路径也算
 * 域名要相同
* 什么时候会携带cookie
 * cookie没有过期
 * 相同path
 * 相同域名
* 悬浮广告 
* cookies的第一应用
 * 保存商品的浏览记录（调整顺序和去重）
* cookies小结
 * cookies 所有对字典的操作都可以对cookie
 * cookie的五个属性 key,value,expries,path,domain
 * 从request.COOKIES获得cookie
  * cookie的过期时间None（会话结束就删除。（浏览器关闭）），正数（多少时间过期）
 * 从response.set_cookie存储cookie 
 * 能不能使用cookie保存用户的账号和密码？不行。（cookie不能存储敏感信息，而且存储大小和存储数量邮箱）
* session（会话）
 *  服务器的一种存储技术
 *  加入购物车，免登陆
 * 默认session会在数据库中有一张表 
 * request.session获得session
* session详解
 * session   from  django.contrib.sessions.backends.db import SessionStore
 * session是基于cookie的
 * 关键是sessionid 不重复

			![](https://i.imgur.com/4P326bw.png)
 * 将对象转换成字符串（序列化）
  *  {'username':'admin','password':'admin'}
 * session中不能存储自定义对象，如果存储需要转换成json对象
* 对象是有什么组成的
 *  父类的__dict__+本类的__dict__+对象的__dict__
### session中存储字典 ###
* 出问题
* session过期时间
* 清空session
* 删除session没讲
* session购物车

python setup.py sdist upload -r pypi
python setup.py register sdist upload

### cookie ###
* cookie 在请求中传给服务器（Cookie: sex="\347\224\267"; age=10; name=django）
* cookie 在响应头中传浏览器

		Set-Cookie: age=10; Path=/
		Set-Cookie: name=django; expires=Tue, 31-Oct-2017 01:26:37 GMT; Max-Age=600; Path=/
		Set-Cookie: sex="\347\224\267"; Path=/cookiedemo/
* 什么传递给服务器cookie？
 * 域名
 * path
 * 时间
* request.COOKIES 字典,只要是浏览器发送的一般都认为是只读

### Session ###
* sesssion基于cookie，服务器给每一个访问的浏览器唯一的编号（seesionid）,下次访问的时候携带sessionid过来，服务器就知道你之前做了什么事情
* session 服务端存储技术（django默认实现是基于数据库的）
* settings中 INSTALL_APP中  'django.contrib.sessions',
* 写一个demo，记住浏览器发送的所有的信息，然后显示给你
* session的操作 类字典   SessionStore实例
 * request.sesssion 获得session
 * request.session 初次给session里面赋值的时候就会创建session
 * request.session['user']=user(序列化的) 
 * request.session.get('user','默认值') 获得user的值
 * del request.sesssion['loginError'] 删除session中的某个值
 * 获得sesssion_key request.sesssion.session_key
 * 清空sesssion里面所有的数据 request.session.clear()
 * 删除session，request.sesssion.flush() 删除sesssion，包括数据中的
 * 设置过期时间，None（不过期），0（浏览器关闭过期）10000,时间,什么时间之后过期
* demo
 * 免登陆 
 * 登出 del request.session['user'] 重定向登录界面
 * 加购物车（bug）（字典），基于session的


			判断有没有购物车
			创建购物车{}
			判断此商品在不在购物车之内
			在就+1，不在就添加到购物车，默认1
			再将购物车放到session中
* django会在session改变的时候讲数据存储到数据库
 * session['age']=10 首次添加
 * sesssion['age']=20 算
 * sesssion['cart']={'商品的唯一标示':{'goodsid':101,'colorId':101,'sizeId':sizeid},....}
 * sesssion['cart']['商品的唯一标示']['sizeId']=200 这算不算改变？不算，因为字典对象没有发生改变，字典里面的字典发生了改变。
 * request.sesssion.modified = True 
![](https://i.imgur.com/TedWFsP.png)


* 需要定时手动清空无效的session
 * python manage.py clearsessions 	
* 修改session的默认缓存方式
 *  数据库 django.contrib.sessions.backends.db	
 *  文件  
 

			SESSION_ENGINE='django.contrib.sessions.backends.file'
			SESSION_FILE_PATH=os.path.join(BASE_DIR,'cache')	
 * cache 内存	

			SESSION_ENGINE='django.contrib.sessions.backends.cache'
 * 双缓存 （内存+数据库），读取（先读内存，内存没有读取数据库，存到内存），写（先写内存再写数据库）


 			SESSION_ENGINE='django.contrib.sessions.backends.cached_db'
 * 基于cookie的

			SESSION_ENGINE='django.contrib.sessions.backends.signed_cookies'
 * redis 

### static ###
* STATIC_URL = '/static/'  表示在访问静态资源的时候，url  /static/资源名
 * STATIC_URL是给浏览器看的
 * 
* STATICFILES_DIRS 让服务器去哪里找静态资源
		
				STATICFILES_DIRS=[
				    os.path.join(BASE_DIR,'abc'),
				    os.path.join(BASE_DIR,'static')
				]
* 好处 304
### 手动模拟static文件（基于浏览器缓存） ###
* 响应头
 * Cache-Control
 * Last_Modified
 * Set-Cookie
* 请求头
 * If_Modified_Since 会携带发给浏览器的修改时间 
 * Cookie 
 * referer(防盗链)盗下载链接
* 让浏览访问我的时候，携带文件上一次修改的时间
* 从请求中获得上一次修改的时间，
* 和本地这个文件现在修改时间对比，如果一样，说明没修改。返回304，返回新文件内容
### redis ###
* wget 下载，解压
* ./configure(待定)
* make 编译 （gcc）
* make install
* cd redis解压目录
* redis-cli 判断是否安装成功
* 配置环境变量
* 配置自启
