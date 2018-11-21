import hashlib
from jiukuaijiy.settings import BASE_DIR
import  os
def fileToObj(filename):
    with open(filename) as fr:
        return eval(fr.read())

provinces = fileToObj(os.path.join(BASE_DIR,'assets/province.json'))
citys = fileToObj(os.path.join(BASE_DIR,'assets/city.json'))
areas = fileToObj(os.path.join(BASE_DIR,'assets/area.json'))

def md(text):
    md5 = hashlib.md5()
    md5.update(text)
    return md5.hexdigest()
def get_citys_by_id(provice_id):
    return citys[provice_id]
def get_areas_by_id(city_id):
    return areas[city_id]