# -*- coding: utf-8 -*-
# Created by PyCharm
# @Time    : 2019/12/13 14:50
# @Author  : 袁威
# @Email   : yuanwei@hiweel.com
from django.urls import path,include
from blog import views

urlpatterns = [
    path('growth/', views.index),#我的日记
    path('growth/<int:id>', views.growth_detail),#日记详情页
    path('time/', views.index),#时光机
    path('about/', views.index),#关于我
    path('album/', views.album),#我的相册
    path('album/<int:id>', views.album_detail),#我的相册 详情页
    path('message/', views.message),#留言板
    path('postPraise/',views.PostPraise),#点赞操作
    path('postMessage/',views.PostMessage)#提交留言
]
