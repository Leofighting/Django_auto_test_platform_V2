# Generated by Django 2.0.13 on 2020-04-15 06:40

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('product', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='ApiStep',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('api_name', models.CharField(max_length=100, verbose_name='接口名称')),
                ('api_url', models.CharField(max_length=200, verbose_name='url地址')),
                ('api_step', models.CharField(max_length=100, null=True, verbose_name='测试步骤')),
                ('api_param_value', models.CharField(max_length=800, verbose_name='请求参数和值')),
                ('api_method', models.CharField(choices=[('get', 'get'), ('post', 'post'), ('put', 'put'), ('delete', 'delete'), ('patch', 'patch')], default='get', max_length=200, null=True, verbose_name='请求方法')),
                ('api_result', models.CharField(max_length=200, verbose_name='预期结果')),
                ('api_status', models.BooleanField(verbose_name='是否通过')),
                ('create_time', models.DateTimeField(auto_now=True, verbose_name='创建时间')),
            ],
        ),
        migrations.CreateModel(
            name='ApiTest',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('api_test_name', models.CharField(max_length=64, verbose_name='流程接口名称')),
                ('api_test_desc', models.CharField(max_length=200, null=True, verbose_name='描述')),
                ('api_tester', models.CharField(max_length=64, verbose_name='测试负责人')),
                ('api_test_result', models.BooleanField(verbose_name='测试结果')),
                ('create_time', models.DateTimeField(auto_now=True, verbose_name='创建时间')),
                ('product', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='product.Product', verbose_name='产品名称')),
            ],
            options={
                'verbose_name': '流程场景接口',
                'verbose_name_plural': '流程场景接口',
                'ordering': ['id'],
            },
        ),
        migrations.AddField(
            model_name='apistep',
            name='api_test',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='api_test.ApiTest'),
        ),
    ]
