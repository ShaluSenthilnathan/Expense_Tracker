# Generated by Django 4.1.4 on 2022-12-11 10:17

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Userinfo',
            fields=[
                ('user_id', models.CharField(db_column='USER_ID', max_length=6, primary_key=True, serialize=False)),
                ('username', models.CharField(blank=True, db_column='USERNAME', max_length=10, null=True)),
                ('gender', models.CharField(blank=True, db_column='GENDER', max_length=1, null=True)),
                ('age', models.IntegerField(blank=True, db_column='AGE', null=True)),
                ('email', models.CharField(blank=True, db_column='EMAIL', max_length=30, null=True)),
                ('phone_no', models.BigIntegerField(blank=True, db_column='PHONE_NO', null=True)),
                ('working_or_not', models.CharField(blank=True, db_column='WORKING_OR_NOT', max_length=2, null=True)),
            ],
            options={
                'db_table': 'userinfo',
                'managed': False,
            },
        ),
    ]