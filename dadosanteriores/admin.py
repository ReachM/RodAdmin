from django.contrib import admin
from .models import Arquivo

class ArquivoAdmin(admin.ModelAdmin):
    list_display = ('nome','arquivos1','arquivos2','arquivos3',)
    search_fields = ['nome','data']
 
admin.site.register(Arquivo,ArquivoAdmin)