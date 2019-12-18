from django.contrib import admin

# Register your models here.
from . import models

admin.site.register(models.System)
admin.site.register(models.Article)
admin.site.register(models.Message)
admin.site.register(models.Link)