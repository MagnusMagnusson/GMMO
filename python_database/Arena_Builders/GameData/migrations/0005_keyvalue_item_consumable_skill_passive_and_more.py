# Generated by Django 4.2.4 on 2023-09-01 23:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('GameData', '0004_alter_skill_effects'),
    ]

    operations = [
        migrations.CreateModel(
            name='KeyValue',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('key', models.CharField(max_length=20)),
                ('value', models.CharField(max_length=20)),
            ],
        ),
        migrations.AddField(
            model_name='item',
            name='consumable',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='skill',
            name='passive',
            field=models.BooleanField(default=False),
        ),
        migrations.RemoveField(
            model_name='skill',
            name='effects',
        ),
        migrations.AddField(
            model_name='item',
            name='restrictions',
            field=models.ManyToManyField(to='GameData.keyvalue'),
        ),
        migrations.AddField(
            model_name='skill',
            name='effects',
            field=models.ManyToManyField(to='GameData.keyvalue'),
        ),
    ]
