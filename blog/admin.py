from django.contrib import admin

# Register your models here.
from . import models
from django.utils.safestring import mark_safe
admin.site.site_header = str(models.System.objects.get(id=1).name)+'管理后台'
admin.site.site_title = str(models.System.objects.get(id=1).name)+'管理后台'
#网站基础信息
@admin.register(models.System)
class SystemAdmin(admin.ModelAdmin):
    def images(self,obj):
        try:
            imgs = mark_safe('<img src="/%s" width="50px">'%(obj.logo))
        except Exception as e:
            imgs = ''
        return imgs

    def images_code(self,obj):
        try:
            imgs = mark_safe('<img src="/%s" width="50px">'%(obj.qrcode))
        except Exception as e:
            imgs = ''
        return imgs
    images.short_description = 'logo'
    images_code.short_description = '二维码'
    list_display = ('id', 'name', 'url', 'title','images','images_code')
    readonly_fields = ['images','images_code']
    list_display_links = ['name']
#内容管理（包含关于我的内容）
@admin.register(models.Article)
class ArticleAdmin(admin.ModelAdmin):
    #设置在列表中可以展示的字段
    list_display = ('id','cat','title','author','hits','praise','create_time','update_time')
    #设置每页展示多少条内容
    list_per_page = 10
    #设置在列表就可以编辑的字段
    list_editable = ['hits']
    #设置可以点击列表哪个字段进入编辑页
    list_display_links = ['title']
    #操作选项显示的位置
    actions_on_top = True
    actions_on_bottom = True
#留言管理
@admin.register(models.Message)
class MessageAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'email', 'create_time')
    list_display_links = ['name']
#友情链接
@admin.register(models.Link)
class LinkAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'url', 'description','create_time')
    list_display_links = ['name']