class User(object):
    def __init__(self,account,password):
        self.errors={}
        self.account =account
        self.password = password
        self.__bind()
    def is_valid(self):
        return len(self.errors)==0
    def get_errors(self):
        return self.errors

    def __bind(self):
        if len(self.account)<6:
            self.errors['account']='长度不够'
            return
        if len(self.password)>6:
            self.errors['password']='长度太长'
            return


