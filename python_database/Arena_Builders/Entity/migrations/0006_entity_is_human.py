# Generated by Django 4.2.4 on 2023-09-03 13:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Entity', '0005_remove_entity_items_inventory'),
    ]

    operations = [
        migrations.AddField(
            model_name='entity',
            name='is_human',
            field=models.BooleanField(default=False),
        ),
    ]