# Generated by Django 4.2.4 on 2023-08-31 20:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('GameData', '0003_alter_skill_effects'),
    ]

    operations = [
        migrations.AlterField(
            model_name='skill',
            name='effects',
            field=models.TextField(max_length=500),
        ),
    ]
