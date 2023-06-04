from django.contrib import admin
from .models import Serviço, Assistencia


class ServicoAdmin(admin.ModelAdmin):
    list_display = ('assistencia','valoros','valorterceirizado', 'clientesegurado', 'endereco', 'servico','data', 'senha', 'cidadeestado', 'telefone', 'material','empresa','decricao','foto','foto2','foto3','foto4',)
    search_fields = ['assistencia']
 
admin.site.register(Serviço,ServicoAdmin)
admin.site.register(Assistencia)
