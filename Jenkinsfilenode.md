```
pipeline {
    agent {
        docker {
            image 'node:8.12'
        }
    }
    environment {
        NPM_CONFIG_PREFIX="/home/node/.npm-global"
        PATH = "/home/node/.npm-global/bin:$PATH"
    }
    stages {
        stage('fuck') {
            steps {
                sh 'npm install -g cnpm --registry=https://registry.npm.taobao.org'
                echo "PATH is: $PATH"
                sh './log.sh'
                sh 'printenv'
                sh 'cnpm -v'
            }
        }
    }
}
```

求带 如上

`npm install -g cnpm`执行成功

`echo "PATH is: $PATH"` 输出

`/home/node/.npm-global/bin: .................:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:...............`

`./log.sh` 文件里代码也是`echo $PATH`,但是输出

`/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin`

`sh 'printenv'`的输出 能看到`NPM_CONFIG_PREFIX="/home/node/.npm-global"`，但是`PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin`

`cnpm install`执行失败 报错找不到`cnpm`

我也尝试 在下面加过 `sh 'export PATH=...'`这样的，但是也没用 

# 所以jenkinsfiles要怎么写 才能设置docker里的path
