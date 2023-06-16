from django.contrib import admin
from .models import Item
from django.contrib.auth.models import Permission
# Register your models here.

admin.site.register(Item)
admin.site.register(Permission)