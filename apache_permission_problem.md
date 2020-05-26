
[apache2权限管理](http://stackoverflow.com/questions/10873295/error-message-forbidden-you-dont-have-permission-to-access-on-this-server)

路径上所有文件夹权限需要x权限 文件需要r权限

```php
<?php
echo exec('whoami');
?>
```

我这里显示是`www-data` 所以把`www-data`加入个人的组咯？ 

我的最后解决方案是把个人的`Documents`设为 751(rwxr-x--x)权限，没有把`www-data`加到组里
 
