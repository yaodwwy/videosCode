#coding=UTF-8
from  django import forms
class UserForm(forms.Form):
    username = forms.EmailField(label='账号')
    password = forms.CharField(min_length=5,max_length=10,widget=forms.PasswordInput,label='密码',error_messages={'min_length':'长度小于5','max_length':'长度大于10'})
    password_2 = forms.CharField(min_length=5,max_length=10,widget=forms.PasswordInput,label='密码',error_messages={'required':'一定要记得填写密码','min_length':'长度小于5','max_length':'长度大于10'})
    # password_2 = forms.CharField(min_length=10,max_length=20,widget=forms.PasswordInput)
    birthday = forms.DateField(label='生日',error_messages={'invalid':'日期格式不正确','required':'一定要记得填写日期'})
    # img = forms.ImageField()
    def clean(self):
        super(forms.Form,self).clean()# 调用弗雷的方法清洗数据
        self.clean_double_password()
        self.clean_email()

    def clean_email(self):
        u = self.cleaned_data.get('username')
        import re
        if not re.match('^[a-zA-Z0-9_-]{7,}@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$', u):
            self.errors['username'] = ['邮箱格式正式不正确']

    def clean_double_password(self):
        p1 = self.cleaned_data.get('password', None)
        p2 = self.cleaned_data.get('password_2', None)
        if (p1 != p2 and p1 != None):
            self.errors['password_2'] = ['两次密码不一致']

