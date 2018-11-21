#coding=utf-8
import os
BASE_DIR = os.path.dirname(__file__)
setting={
    'template_path':os.path.join(BASE_DIR,'templates'),
    'static_path':os.path.join(BASE_DIR,'static'),
    'static_url_prefix':'/static/'
}