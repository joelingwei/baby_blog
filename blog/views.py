from django.shortcuts import render
# Create your views here.
from . import models
from django.http import JsonResponse
from django.core.paginator import Paginator
from django.conf import settings
from django.views.decorators.csrf import csrf_exempt
from hashlib import md5
from django.db.models import F
#首页 我的日记 时光机 关于我
def index(request):
    # 翻页
    page = request.GET.get('page')
    if page:
        page = int(page)
    else:
        page = 1
    page_num = 0
    page_nums = None #总共多少页
    page_count = None #数据总数
    next_page = None #下一页
    previous_page = None #上一页

    about = None
    # 所有内容
    article_all = None
    article_top = None
    type = request.get_full_path().split('/')[1]
    if type == 'growth':
        article_all = models.Article.objects.filter(cat_id=2, status=1)
        page_counts = 6
    elif type == 'time':
        article_all = models.Article.objects.filter(cat_id__in=[2,3], status=1)
        page_counts = 12
    elif type == 'about':
        about = models.Article.objects.get(id=23)
    else:
        article_top = models.Article.objects.get(cat_id=3,status=1, is_index=2)
        photos = article_top.photos.split(',')
        if len(photos)>5:
            article_top.photos = photos[:5]
        article_all = models.Article.objects.filter(is_top=2, status=1,cat_id__in=[2,3],is_index=1)[:5]
    if type == 'growth' or type == 'time':
        # 主体内容列表
        paginator = Paginator(article_all,page_counts)
        page_num = paginator.num_pages
        page_nums = article_all.count()
        article_list = paginator.page(page)
        article_all = article_list
        if article_list.has_next():
            next_page = page+1
        else:
            next_page = page

        if article_list.has_previous():
            previous_page = page-1
        else:
            previous_page = page

    return render(request, 'blogs/index.html', {
        'web_info': models.System.objects.all()[0],
        'BASE_URL': settings.BASE_URL,
        'article_list': article_all,
        'about':about,
        'type':type,
        'article_top': article_top,
        'article_num': models.Article.objects.filter(cat_id=2, status=1).count(),
        'photo_num': models.Article.objects.filter(cat_id=3, status=1).count(),
        'link': models.Link.objects.filter(status=1),
        'article_news': models.Article.objects.filter(status=1,cat_id__in=[2,3])[:8],
        'article_click': models.Article.objects.filter(status=1,cat_id__in=[2,3]).order_by('-hits')[:8],
        'photo_list': models.Article.objects.filter(status=1, cat_id=3)[:6],
        'page_num':range(1,page_num+1),
        'page_nums':page_num,
        'page_count':page_nums,
        'curr_page':page,
        'next_page':next_page,
        'previous_page':previous_page
    })
#详情页
def growth_detail(request,id):
    if models.Article.objects.get(id=id):
        article_list = models.Article.objects.filter(cat_id=2,status=1).all()
        article_info = None
        previous_article = None
        next_article = None
        previous_article_index = 0
        next_article_index = 0
        for index, article in enumerate(article_list):
            if index == 0:
                previous_article_index = 0
                next_article_index = index + 1
            elif index == len(article_list) - 1:
                previous_article_index = index - 1
                next_article_index = index
            else:
                previous_article_index = index - 1
                next_article_index = index + 1

            if article.id == id:
                article_info = article
                previous_article = article_list[previous_article_index]
                next_article = article_list[next_article_index]
                break
        return render(request, 'blogs/detail.html', {
            'web_info':models.System.objects.all()[0],
            'BASE_URL': settings.BASE_URL,
            'article_info': article_info,
            'previous_article': previous_article,
            'next_article': next_article,
            'article_num': models.Article.objects.filter(cat_id=2, status=1).count(),
            'photo_num': models.Article.objects.filter(cat_id=3, status=1).count(),
            'link': models.Link.objects.filter(status=1),
            'article_news': models.Article.objects.filter(status=1,cat_id__in=[2,3])[:8],
            'article_click': models.Article.objects.filter(status=1,cat_id__in=[2,3]).order_by('-hits')[:8],
            'photo_list': models.Article.objects.filter(status=1, cat_id=3)[:6],
        })
    else:
        page_not_found(request)
#我的相册
def album(request):
    # 翻页
    page = request.GET.get('page')
    if page:
        page = int(page)
    else:
        page = 1
    page_num = 0
    page_nums = None  # 总共多少页
    page_count = None  # 数据总数
    next_page = None  # 下一页
    previous_page = None  # 上一页
    article_all = None

    article_all = models.Article.objects.filter(cat_id=3, status=1)
    page_counts = 8

    paginator = Paginator(article_all, page_counts)
    page_num = paginator.num_pages
    page_nums = article_all.count()
    article_list = paginator.page(page)
    article_all = article_list
    if article_list.has_next():
        next_page = page + 1
    else:
        next_page = page

    if article_list.has_previous():
        previous_page = page - 1
    else:
        previous_page = page
    return render(request, 'blogs/album.html', {
        'web_info': models.System.objects.all()[0],
        'BASE_URL': settings.BASE_URL,
        'article_list': article_all,
        'page_num': range(1, page_num + 1),
        'page_nums': page_num,
        'page_count': page_nums,
        'curr_page': page,
        'next_page': next_page,
        'previous_page': previous_page
    })
#相册详情
def album_detail(request,id):
    article_info = models.Article.objects.get(id=id)

    article_info.photos = article_info.photos.split(',')
    return render(request, 'blogs/album_detail.html', {
        'web_info': models.System.objects.all()[0],
        'BASE_URL': settings.BASE_URL,
        'article_info': article_info
    })
#留言板
def message(request):
    # 翻页
    page = request.GET.get('page')
    if page:
        page = int(page)
    else:
        page = 1
    page_num = 0
    page_nums = None  # 总共多少页
    page_count = None  # 数据总数
    next_page = None  # 下一页
    previous_page = None  # 上一页

    message_all = models.Message.objects.filter(status=0)
    page_counts = 8
    paginator = Paginator(message_all, page_counts)
    page_num = paginator.num_pages
    page_nums = message_all.count()
    message_list = paginator.page(page)
    message_all = message_list
    if message_list.has_next():
        next_page = page + 1
    else:
        next_page = page

    if message_list.has_previous():
        previous_page = page - 1
    else:
        previous_page = page
    return render(request, 'blogs/message.html', {
        'web_info': models.System.objects.all()[0],
        'BASE_URL':settings.BASE_URL,
        'message_all':message_all,
        'page_num': range(1, page_num + 1),
        'page_nums': page_num,
        'page_count': page_nums,
        'curr_page': page,
        'next_page': next_page,
        'previous_page': previous_page
    })
#点赞操作
@csrf_exempt
def PostPraise(request):
    #文章id
    article_id = request.POST.get('id')
    #唯一身份标识
    session_id = md5_encrpty(get_ip_address(request))
    #必须post请求
    if request.method != 'POST':
        return JsonResponse({"status":'-1',"msg":'must be a post request'})
    #判断是否已经点赞
    if models.ArticlePraiseLog.objects.filter(article_id=article_id,session_id=session_id).first():
        return JsonResponse({"status":"2","msg":"您已点赞过，请勿重复操作"})
    #写入点赞数据
    models.ArticlePraiseLog.objects.create(article_id=article_id,session_id=session_id,ip=get_ip_address(request))
    #增加内容点赞量
    models.Article.objects.filter(id=article_id).update(praise=F('praise')+1)

    return JsonResponse({"status":"0","msg":"感谢您的喜爱"})
#提交留言
@csrf_exempt
def PostMessage(request):
    name = request.POST.get('name')
    email = request.POST.get('email')
    mycall = request.POST.get('mycall')
    content = request.POST.get('content')
    #写入数据
    models.Message.objects.create(name=name,email=email,mycall=mycall,content=content)

    return JsonResponse({"status": "0", "msg": "留言成功"})

def permission_denied(request,template_name='blogs/403.html'):
    return render(request,template_name)

def page_not_found(request,template_name='blogs/404.html'):
    return render(request,template_name)

def page_error(request,template_name='blogs/500.html'):
    return render(request,template_name)
#获取ip
def get_ip_address(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[-1].strip()
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip
#md5加密
def md5_encrpty(request):
    md = md5()
    md.update(request.encode('utf-8'))
    return md.hexdigest()