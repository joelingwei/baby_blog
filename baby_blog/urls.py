"""baby_blog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,include,re_path
from django.conf.urls import url
from blog import views
from django.views import static
from django.conf import settings
urlpatterns = [
    path('admin/', admin.site.urls),
    re_path(r'^', include('blog.urls')),

    url(r'^$', views.index),
    url(r'^static/(?P<path>.*)$',static.serve,
        {'document_root':settings.STATIC_ROOT},name='static'),
]

handler403 = views.permission_denied
handler404 = views.page_not_found
handler500 = views.page_error
