from django.db import models

class Serviço(models.Model) :
    assistencia2 = models.CharField('Assistência', max_length=100,help_text='Informe Assistência')
    valoros = models.CharField('Valor OS', max_length=100, default='',blank=True)
    valorterceirizado = models.CharField('Valor Terceirizado', max_length=100, default='',blank= True)
    clientesegurado = models.CharField('Cliente/Segurado', max_length=100, default='')
    endereco = models.TextField('Endereço', max_length=1000, default='')
    servico= models.CharField('Serviço', max_length=100)
    data = models.DateField(('Data'), auto_now=False, auto_now_add=False)
    senha = models.CharField('Senha', max_length=100, default='',blank= True)
    cidadeestado = models.CharField('Cidade/Estado', max_length=100, default='')
    telefone = models.CharField('Telefone', max_length=100, default='',blank= True)
    material = models.CharField('Material', max_length=100, default='',blank= True)
    empresa = models.CharField('Empresa/Seguro', max_length=1000, default='',blank= False)
    decricao = models.TextField('Descrição', max_length=1000, default='',blank= True)
    foto = models.FileField(('Anexar Imagem'), upload_to='media', max_length=100, default='',blank= True,help_text='Coloque Assinatura/Checklist')
    foto2 = models.FileField(('Anexar Imagem'), upload_to='media', max_length=100, default='',blank= True,help_text='Coloque Assinatura/Checklist')
    foto3 = models.FileField(('Anexar Imagem'), upload_to='media', max_length=100, default='',blank= True,help_text='Coloque Assinatura/Checklist')
    foto4 = models.FileField(('Anexar Imagem'), upload_to='media', max_length=100, default='',blank= True,help_text='Coloque Assinatura/Checklist')
    def __str__(self):
     return f'{self.assistencia2}'

class Assistencia(models.Model):
     assistencia2 = models.CharField('Assistencia', max_length=100)
    



