### 捕获 ###
* 根据id,class,标签获得元素
		
		console.log($('#show'))
		console.log($('.goods'))
* 获得兄弟节点，父亲节点

		$('#show').siblings()
		$('#show').parent()
### css ###
* 获得属性 attr
* 获得内容（text）会去掉标签
* 获得html(html) 原样获得
* 获得val()
* 获得css
* $('goods').css('name','value')
### 监听 ###
* on***(监听，js)
* $('goods').click(function())
* $('goods').mouseenter(function())
* $('goods').hover()
* 多个监听，


			$('#show').click(function(){
					$(this).remove()
			})

			$('.goods').click(function(){
				alert($(this).attr('goodsid'))
			})

			<img id="right" width="100px" height="100px" src="img/a.jpg" />
		<button id="change"></button>
		<script>
			$('#change').click(function(){
				$('#right').attr('src','img/20171009034310916.jpg')
			})
		</script>

### ajax  ###
* 会get请求
* post请求
* 请求头处理
* 会处理json
* window.location='http://www.bjsxt.com'

			  $.get('/get?name=zhangsan',function (data) {
		           console.log(data)
		       })
			
			  $.post('/post/','name=asdsadsadsa&age=10',function (data) {
            		console.log(data)
       			 })	
           
* $.ajax


				$.ajax( {  
			         type : "POST",  
			         url : "action.jsp", 
					 headers: {
        			Accept: "application/json; charset=utf-8"
    				}, 
			         data : "content=" + content,  
   
			         success : function(data, textStatus) {  
			            $(".html").val(data);  
			         },   
			         error : function() {  
			            alert("ajax失败！");  
			         }  
			        });  
* 服务器返回给ajax的json  eval(函数)

* 发给服务器cookie中csrftoken，post请求的时候csrfmiddlewaretoken


					<body>
					{% csrf_token %}
					
					    <button onclick="csrf()">请求</button>
					
					    <script>
					        function csrf() {
					            token=$('input').attr('value')
					            $.ajax({
					                type:'post',
					                url:'/post/',
					                data:'name=张三&age=10&csrfmiddlewaretoken='+token
					                ,success:function (data) {
					                    console.log(data)
					                }
					            })
					        }
					    </script>
					
					</body>

* curl验证

				

			
				