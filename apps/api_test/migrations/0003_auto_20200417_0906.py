# Generated by Django 2.0.13 on 2020-04-17 01:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api_test', '0002_apis'),
    ]

    operations = [
        migrations.AlterField(
            model_name='apistep',
            name='api_test',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='api_step', to='api_test.ApiTest'),
        ),
    ]
