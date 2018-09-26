from django import forms
from .models import *
class LoginForm(forms.ModelForm):
    class Meta:
        model = Users
        fields = ['uphone','upwd']
        labels = {
            'uphone':'手机号',
            'upwd':'密码',
        }
        widgets = {
            #<input id="phone_num" class="form-contral" type="text" name="uphone" >
            'uphone': forms.TextInput(
                attrs = {
                    'id' :'phone_num',
                    'class' : 'form-contral',

                }

            ),
            'upwd': forms.PasswordInput(
                #<input class="form-contral" type="password" name="upwd" placeholder="请输入6-20位号码字符">
                attrs={
                    'class':'form-contral',
                    'name':'upwd',
                    'palceholder':"请输入6-20位号码字符",

                }
            ),
        }