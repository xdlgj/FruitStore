from django.contrib import admin
from .models import *

# Register your models here.

class UsersAdmin(admin.ModelAdmin):
    list_display = ('uname','uphone','uemail')
    #
    list_display_links = ['uemail','uname']
    search_fields = ['uname','uphone','uemail']
    list_filter = ['uname','uphone','uemail']

class GoodsAdmin(admin.ModelAdmin):
    list_filter = ('goodsType',)
    search_fields = ('title',)

admin.site.register(Users,UsersAdmin)
admin.site.register(GoodsType)
admin.site.register(Goods,GoodsAdmin)
admin.site.register(CartInfo)