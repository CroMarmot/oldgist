```
find /pathtodir -type f -print0 | xargs -0 sed -i 's/origional text/destination text/g'
```
