from django.db import models
from django.contrib.auth.models import User
from ckeditor_uploader.fields import RichTextUploadingField

# Create your models here.
#网站信息表
class System(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100,verbose_name='网站名称')
    url = models.CharField(max_length=100,verbose_name='网址')
    title = models.CharField(max_length=200,verbose_name='标题')
    key = models.CharField(max_length=200,verbose_name='关键字')
    des = models.CharField(max_length=200,verbose_name='描述')
    bah = models.CharField(max_length=100,verbose_name='备案号')
    copyright = models.CharField(max_length=200,verbose_name='copyright')
    address = models.CharField(max_length=120,verbose_name='地址')
    contacts = models.CharField(max_length=255,verbose_name='联系人')
    mobile_phone = models.CharField(max_length=100,verbose_name='联系手机')
    qq = models.CharField(max_length=255,verbose_name='qq')
    birthday = models.CharField(max_length=100,verbose_name='生日')
    logo = models.ImageField(upload_to='static/upload/system',null=True,verbose_name='logo')
    qrcode = models.ImageField(upload_to='static/upload/system',null=True,verbose_name='二维码')

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'system'
        verbose_name = '网站信息'
        verbose_name_plural = verbose_name
#栏目表模型
class cate(models.Model):
    id = models.AutoField(primary_key=True)
    catname = models.CharField(max_length=100,verbose_name="栏目名称")
    status = models.PositiveIntegerField(default=1,verbose_name="状态，1-正常，2-删除")

    def __str__(self):
        return self.catname
    class Meta:
        db_table = 'cate'
        verbose_name = '栏目表'
        verbose_name_plural = verbose_name
#文章列表
class Article(models.Model):
    id = models.AutoField(primary_key=True)
    cat = models.ForeignKey('cate',on_delete=models.CASCADE,verbose_name='文章栏目')
    title = models.CharField(max_length=128,verbose_name='标题')
    author = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name='作者')
    thumb = models.ImageField (upload_to='static/upload/article_thumb',null=True,verbose_name='缩略图',blank=True)
    keywords = models.CharField(max_length=80,verbose_name='关键词',blank=True)
    description = models.TextField(verbose_name='seo简介',blank=True)
    summary = models.TextField(verbose_name='摘要',blank=True)
    content = RichTextUploadingField(verbose_name='内容')
    photos = models.TextField(verbose_name='相册',blank=True)
    sort = models.PositiveIntegerField(default=100,verbose_name='排序')
    hits = models.PositiveIntegerField(default=0,verbose_name='点击量')
    create_time = models.DateTimeField(auto_now_add=True,verbose_name='发布时间')
    update_time = models.DateTimeField(auto_now=True,verbose_name='更新时间')
    is_top = models.PositiveIntegerField(choices=[(1,'否'),(2,'是')],default=1,verbose_name='是否推荐，1-不推荐，2-推荐')
    is_index = models.PositiveIntegerField(choices=[(1,'否'),(2,'是')],default=1,verbose_name='是否首页头条，1-不是，2-是')
    praise = models.PositiveIntegerField(default=0,verbose_name='点赞数')
    status = models.SmallIntegerField(choices=[(1,'显示'),(2,'删除')],default=1,verbose_name='状态，1-正常，2-删除')

    def __str__(self):
        return self.title

    class Meta:
        db_table = 'article'
        verbose_name = '内容列表'
        verbose_name_plural = verbose_name
        ordering = ['-create_time']
#点赞记录表
class ArticlePraiseLog(models.Model):
    id = models.AutoField(primary_key=True)
    article = models.ForeignKey('Article',on_delete=models.CASCADE,verbose_name='文章id')
    session_id = models.CharField(max_length=255,verbose_name='')
    ip = models.CharField(max_length=15,verbose_name='当前ip')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='点赞时间')

    class Meta:
        db_table = 'article_praise_log'
        verbose_name = '点赞记录表'
        verbose_name_plural = verbose_name
#友情链接
class Link(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255,verbose_name='网站名称')
    url = models.CharField(max_length=255,verbose_name='网站地址')
    logo = models.ImageField(upload_to='static/upload/link_logo',null=True,verbose_name='网站logo')
    description = models.CharField(max_length=255,verbose_name='描述')
    sort = models.SmallIntegerField(default=50,verbose_name='排序')
    status = models.PositiveIntegerField(choices=[(1,'正常'),(0,'锁定')],default=0,verbose_name='状态，0-锁定，1-正常')
    create_time = models.DateTimeField(auto_now_add=True,verbose_name='添加时间')
    update_time = models.DateTimeField(auto_now=True,verbose_name='更新时间')

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'link'
        verbose_name ='友情链接'
        verbose_name_plural = verbose_name
        ordering = ['sort']
#留言板
class Message(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, verbose_name='姓名')
    email = models.CharField(max_length=100, verbose_name='邮箱')
    mycall = models.CharField(max_length=255, verbose_name='头像')
    content = models.TextField(verbose_name='内容')
    status = models.PositiveIntegerField(choices=[(0,'正常'),(1,'待审')],default=0, verbose_name='状态，0-正常，1-待审')
    create_time = models.DateTimeField(auto_now_add=True, verbose_name='添加时间')
    update_time = models.DateTimeField(auto_now=True, verbose_name='更新时间')
    replay_content = models.TextField(verbose_name='回复内容')
    replay_time = models.DateTimeField(auto_now=True,verbose_name='回复时间')

    def __str__(self):
        return self.content

    class Meta:
        db_table ='message'
        verbose_name = '留言表'
        verbose_name_plural = verbose_name
        ordering = ['-create_time']