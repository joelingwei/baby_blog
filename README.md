# baby_blog

#### 介绍
>基于django的开源博客系统。</br>
>包含一套个人博客（宝宝成长博客）应有的基本功能，可直接运行、部署、使用。</br>
>后期能很方便的进行UI个性化修改和功能扩展。

#### 软件架构
* Linux/Windows7
* Python 3.6.5
* db.sqlite3/Mysql

#### 部署和运行方式
1.Mysql下方式

```
	Step1. gitclone https://gitee.com/joelingwei/baby_blog.git</br>
	Step2. cd baby_blog
           pip install -r requirements.txt
           导入Mysql文件，修改settings.py文件，将数据库连接参数修改成你自己的
           python manage.py collectstatic
           python manage.py makemigrations
           python manage.py migrate
           python manage.py createsuperuser
	Step3. python manage.py runserver
```
2.db.sqlite3下方式

```
	Step1. gitclone https://gitee.com/joelingwei/baby_blog.git</br>
	Step2. cd baby_blog
           pip install -r requirements.txt
           修改settings.py文件，将84，85行前面#号去掉，并将86到92行注释掉
           python manage.py collectstatic
           python manage.py makemigrations
           python manage.py migrate
           python manage.py createsuperuser
	Step3. python manage.py runserver
```

#### 访问方式

* 前端页面：ip:8000
* 后台管理：ip:8000/admin

#### 实现功能
* 网站信息设置
* 博客编写
* 友情链接管理
* 留言板管理

#### 关于作者
袁小威，汉纸，爱文字、爱音乐的90后伪文艺程序猿一枚，乐于分享一些个人开发之路上踩的各种坑，只为后来人更好的行走。

PHP4年+开发经验，Python入门小白菜，熟悉ThinkPHP和laravel，有微信公众号第三方平台、微信公众号、微信小程序等开发经验，以及其他PHP相关开发经验（如支付宝，微信，翼支付等支付功能对接开发，api接口开发，网站前后端开发等）。

个人博客地址：https://www.yxiaowei.com

![博客小程序](https://github.com/joelingwei/rubbish/blob/master/images/wx_rotine.jpg)

#### 写在最后
有不当之处欢迎大家与我反馈。反馈邮箱：yuanwei@yxiaowei.com

#### 更新记录

* 2019.12.18
  * 提交代码
* 2019.12.25
  * 文章编辑增加富文本编辑插件
  * 部分优化django自带admin后台

#### 后续优化
目前后台管理相册部分还处于待解决状态