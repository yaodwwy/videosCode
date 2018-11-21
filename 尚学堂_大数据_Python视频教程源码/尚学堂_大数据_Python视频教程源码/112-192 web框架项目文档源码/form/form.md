### form ###
#### 应用场景 ####
* 将数据添加到数据库需要做form验证（POST）
* POST请求做添加，删除，修改
* 为了数据库中出现脏数据，或者防止恶意攻击
### 针对于POST请求 ###
* 之前没有做表单验证
* -1  -99 99   结账没钱了
### 数据验证 ###
* forms.Form

				from django import forms
					class UserForm(forms.Form):
					    account = forms.EmailField()
					    password = forms.CharField(min_length=5,max_length=10)
				
* 数据验证

			 user = {'account':'123456','password':'123456'}
			u = UserForm(user)
			u.is_valid() 判断数据是否有效
* 获得错误

			{'字段':[错误列表]}	
* 如果数据有效
 * u.clean_data 获得清洗之后的数据
* 如何自定义验证规则
 * 重写clean方法
 

				 def clean(self):
			        super(UserForm,self).clean()
			        account = self.cleaned_data['account'] 调用父类的方法，清洗数据
			        if len(account[:account.index('@')])<5:
			            self.errors['account']=['邮箱长度小于5'] 设置错误			
						 