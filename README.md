# Responsive Blog Theme using Flutter | Web, macOS, Android, iOS




Flutter recently announced Flutter V2.0, after that on stable branch it supports Web, macOS, Android, and iOS. That's why today we create a responsive blog theme using flutter that runs on Web, macOS app, Android, and iOS app. Also, we create an animated web menu that has custom hover animation. In the end, you learn how to make a responsive app using flutter.

### Responsive Blog Theme using Flutter Final UI

![Preview](/gif.gif)

![App UI](/ui.png)
全局激活

pub global activate fvm
打印已安装的 fvm 列表fvm list，

通过运行fvm use 1.22.0（在我的例子中是 1.22.0，它可能会根据您所需的版本而有所不同）命令选择要使用的 Flutter SDK 版本，如果尚未安装，它将下载 SDK；
现在，您可以通过运行来检查项目中是否正在运行 flutter flutter；
此外，您还可以通过再次调用来检查 Flutter SDK 版本是否设置fvm list。

勾号表示该版本正在您的项目中运行。
fvm use beta --force 
给旧项目添加 fvm
对于就项目我们如果想切到 fvm 的 flutter 环境，这个步骤还是非常简单的。
在项目根路径下执行：
$ fvm use beta --force 
复制代码
完成上面的命令，会有个 .fvm 文件夹生成，然后配置 IDE，方法同上。
可以愉快的玩耍 flutter 了。


