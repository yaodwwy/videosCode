from  django import template

register = template.Library()
import  markdown

@register.filter
def mark(value):
    return markdown.markdown(value)