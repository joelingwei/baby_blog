# baby_blog

#### 介绍
>基于django的开源博客系统。</br>
>包含一套个人博客（宝宝成长博客）应有的基本功能，可直接运行、部署、使用。</br>
> 后期能很方便的进行UI个性化修改和功能扩展。

#### 软件架构
* Linux/Windows7
* Python 3.6
* db.sqlite3/Mysql

#### 部署和运行方式
1.db.sqlite3下方式

```
	Step1. gitclone https://gitee.com/joelingwei/baby_blog.git</br>
	Step2. cd baby_blog
           pip install -r requirements.txt
           修改settings.py文件，将81，82行前面#号去掉，并将83到89行注释掉
           python manage.py makemigrations
           python manage.py migrate
           python manage.py compilemessages
           python manege.py createsuperuser
	Step3. python manage.py runserver
```
2.Mysql下方式

```
	Step1. gitclone https://gitee.com/joelingwei/baby_blog.git</br>
	Step2. cd baby_blog
           pip install -r requirements.txt
           python manage.py compilemessages
           导入Mysql文件，修改settings.py文件，将数据库连接参数修改成你自己的
           python manege.py createsuperuser
	Step4. python manage.py runserver
```

#### 访问方式

* 前端页面：ip:8000
* 后台管理：ip:8000/admin

#### 实现功能
* 网站信息设置
* 博客编写
* 友情链接管理
* 留言板管理

#### 更新记录

* 2019.12.18
  * 提交代码
