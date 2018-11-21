#coding=UTF-8
from django.http import HttpResponse
from django.shortcuts import render
def index(request):
    import  os

    dir = os.path.dirname(__file__)
    parent =  dir[:len(dir)-5]
    template_path = os.path.join(parent,'templates/index.html')
    with open(template_path) as f:
        content = f.read()
    return  HttpResponse(content)
    # fr = open(template_path)
    # content = fr.read()
    # fr.close()
    # return  HttpResponse(content)
    # return render(request,'index.html')


