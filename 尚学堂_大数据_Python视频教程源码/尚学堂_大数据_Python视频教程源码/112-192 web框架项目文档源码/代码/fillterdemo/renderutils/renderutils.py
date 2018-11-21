#coding=UTF-8
from  django.template import Template
from  django.template import Context,RequestContext
from  django.template import  loader
from  django.http.response import  HttpResponse
def custom_pro(request):
    return {'right':"我是右面的菜单"}

def render_context(request,template_name,context=None):
    with open('fillter/templates/'+template_name) as fr:
        template_string = fr.read()
    t = Template(template_string)
    c = RequestContext(request,context,processors=[custom_pro])
    render_string = t.render(c)
    return  HttpResponse(render_string)

# 了解 render底层这样写的
def render_loader_context(request,template_name,context):
    t = loader.get_template(template_name)
    render_string = t.render(context)
    return  HttpResponse(render_string)