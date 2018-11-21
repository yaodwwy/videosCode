#coding=UTF-8
from  django.template import Template
from  django.template import Context
from  django.template import  loader
from  django.http.response import  HttpResponse
def render_context(request,template_name,context):
    with open('templates/'+template_name) as fr:
        template_string = fr.read()
    t = Template(template_string)
    c = Context(context)
    render_string = t.render(c)
    return  HttpResponse(render_string)

# 了解 render底层这样写的
def render_loader_context(request,template_name,context):
    t = loader.get_template(template_name)
    render_string = t.render(context)
    return  HttpResponse(render_string)