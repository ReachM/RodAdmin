from django.contrib import admin
from .models import Serviço, Assistencia


class ServicoAdmin(admin.ModelAdmin):
    list_display = ('assistencia2','valoros','valorterceirizado', 'clientesegurado', 'endereco', 'servico','data', 'senha', 'cidadeestado', 'telefone', 'material','empresa','decricao','foto','foto2','foto3','foto4',)
    search_fields = ['assistencia2']
    
admin.site.register(Serviço,ServicoAdmin)
admin.site.register(Assistencia)
