# Generated by Django 2.0.13 on 2020-04-16 02:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('product', '0001_initial'),
        ('api_test', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Apis',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('api_name', models.CharField(max_length=100, verbose_name='接口名称')),
                ('api_url', models.CharField(max_length=200, verbose_name='url 地址')),
                ('api_param_value', models.CharField(max_length=800, verbose_name='请求参数和值')),
                ('api_method', models.CharField(choices=[('0', 'get'), ('1', 'post'), ('2', 'put'), ('3', 'delete'), ('4', 'patch')], default='0', max_length=10, verbose_name='请求方法')),
                ('api_result', models.CharField(max_length=200, verbose_name='预期结果')),
                ('api_status', models.BooleanField(verbose_name='是否通过')),
                ('create_time', models.DateTimeField(auto_now=True, verbose_name='创建时间')),
                ('product', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='product.Product')),
            ],
            options={
                'verbose_name': '单一场景接口',
                'verbose_name_plural': '单一场景接口',
            },
        ),
    ]
