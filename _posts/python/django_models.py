class Publisher(models.Model):
  name    = models.CharField(maxlength=30, help_text='Name', unique=True)
  address = models.TextField(maxlength=50)
  city    = models.CharField(maxlength=60, default='London')

  def __str__(self):
    return self.name

  class Meta:
    ordering = ["name"]

# creating and saving
ringo = Person.objects.create(name="Ringo Starr")
p1 = Publisher(name='Addison-Wesley', address='75 Arlington Street')
p1.save()

##
## getting and filtering
##
publisher_list = Publisher.objects.all()
Publisher.objects.filter(name="Apress Publishing")
Publisher.objects.filter(name__contains="press") # icontains, startswith y, endswith y, range

Publisher.objects.get(name="Apress Publishing") # exception if many objects
Publisher.objects.order_by("name")
Publisher.objects.order_by("-name").count()
Publisher.objects.order_by("state_provice", "address")

Publisher.objects.filter(category="U.S.A.").order_by("-name")
Publisher.objects.all()[5:10]  #OFFSET/LIMIT 10

p = Publisher.objects.get(name="Addison-Wesley")
p.delete()
publishers = Publisher.objects.all()
publishers.delete()


for e in Entry.objects.all():
    print e.headline

# agregar nuevo campo a tabla existente
campo_nuevo = models.IntegerField(blank=True, null=True)
manage.py sqlall [yourapp] para ver la nueva sentencia CREATE TABLE
ALTER TABLE que agregue tu nueva columna.
en produccion Ejecuta la sentencia ALTER TABLE que se uso antes
Agrega el campo a tu modelo.

# Execute custom SQL
from django.db import transaction, connection
cursor = connection.cursor()
cursor.execute("DELETE FROM cms_cmsplugin WHERE id=%s", [str(plugin.id)])
transaction.commit_unless_managed()

