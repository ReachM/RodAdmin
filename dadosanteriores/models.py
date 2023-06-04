from django.db import models

class Arquivo(models.Model) :
 nome = models.CharField('Nome', max_length=100)
 data = models.DateField(('Data'), auto_now=False, auto_now_add=False)
 arquivos1 = models.FileField(('Anexar Arquivo'), upload_to='Arquivo', max_length=100, default='',blank= True)
 arquivos2 = models.FileField(('Anexar Arquivo'), upload_to='Arquivo', max_length=100, default='',blank= True)
 arquivos3 = models.FileField(('Anexar Arquivo'), upload_to='Arquivo', max_length=100, default='',blank= True)
 
 def __str__(self):
     return f'{self.nome}{self.data}'
 
