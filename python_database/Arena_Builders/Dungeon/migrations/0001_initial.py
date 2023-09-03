# Generated by Django 4.2.4 on 2023-09-03 12:55

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('Entity', '0005_remove_entity_items_inventory'),
    ]

    operations = [
        migrations.CreateModel(
            name='Dungeon',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=30)),
                ('theme', models.CharField(max_length=10)),
                ('description', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Room',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rank', models.IntegerField(default=0)),
                ('width', models.IntegerField(default=30)),
                ('height', models.IntegerField(default=30)),
                ('dungeon', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Dungeon.dungeon')),
            ],
        ),
        migrations.CreateModel(
            name='Enemy',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('level', models.IntegerField()),
                ('xstart', models.IntegerField()),
                ('ystart', models.IntegerField()),
                ('enemy', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Entity.entity')),
                ('room', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Dungeon.room')),
            ],
        ),
    ]