用[`imports-loader`](https://github.com/webpack-contrib/imports-loader)

例如在代码中`import NIMSDK from 'imports-loader?this=>window!./3rd/NIM_Web_SDK_v4.0.0'`

在webpack的配置里module 的 rules

```js
      {
        test: /3rd\/(\?.*)\.js$/,
        loader: 'imports-loader?this=>window',
        options: {
          name: utils.assetsPath('3rd/[name].[ext]')
        }
      }
```

**需要注意**的是要把其它的loader加上`exclude: resolve('src/3rd')`

也许`scripts-loader`也可以，有可能是我之前没有exclude才有的错
