

# Flutter  Blog Theme using Flutter | Web, macOS, Android, iOS,Windows

大家可以关注一下我的公众号，支持一下

![](https://luckly007.oss-cn-beijing.aliyuncs.com/image/%E5%85%AC%E4%BC%97%E5%8F%B7%E4%BA%8C%E7%BB%B4%E7%A0%81.jpg)

Flutter 最近发布了 Flutter V2.5.1，其性能得到了很大提升，支持 Web、macOS、Android 和 iOS。 这就是为什么今天我们使用在 Web、macOS 应用、Android 和 iOS 应用上运行的 flutter 创建响应式博客主题。 此外，我们创建了一个具有自定义悬停动画的动画网络菜单。 最后，您将学习如何使用 Flutter 制作响应式应用程序。

目前已新增桌面支持

预览地址：http://47.117.1.68:251/#/

![chip](https://luckly007.oss-cn-beijing.aliyuncs.com/image/chip.gif)

![](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20220210135434106.png)





哔哩哔哩

https://www.bilibili.com/video/bv1uy4y1t7LX

https://www.bilibili.com/video/bv1uy4y1t7LX

项目地址

github

https://github.com/ITmxs/flutter_bloc_super

gitee

https://gitee.com/itmxs/flutter_bloc_super

主分支默认空安全

![image-20210928112956758](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210928112956758.png)



# 使用fvm版本控制

## 全局激活

pub global activate fvm
打印已安装的 fvm 列表fvm list，

通过运行fvm use 2.5.1（在我的例子中是 12.5.1，它可能会根据您所需的版本而有所不同）命令选择要使用的 Flutter SDK 版本，如果尚未安装，它将下载 SDK；
现在，您可以通过运行来检查项目中是否正在运行 flutter flutter；
此外，您还可以通过再次调用来检查 Flutter SDK 版本是否设置fvm list。

## 勾号表示该版本正在您的项目中运行。

fvm use 2.5.1--force 

## 如果你的是旧项目添加 fvm

对于就项目我们如果想切到 fvm 的 flutter 环境，这个步骤还是非常简单的。
在项目根路径下执行：
$ fvm use  2.5.1--force 

完成上面的命令，会有个 .fvm 文件夹生成，然后配置 IDE，方法同上。
可以愉快的玩耍 flutter 了。

# 博客项目迁移空安全教程



 

#  1. 创建分支命名为

`flutter2.5.1_null-safety`，并切换到新分支。

# 2.执行flutter doctor

![image-20210926165055424](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210926165055424.png)

# 3.查看`dart`版本，是否为`2.12`或更高

![image-20210926165140064](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210926165140064.png)

# 4. 检查所有依赖的迁移状态

通过以下命令检查你的 package 的迁移状态

```
dart pub outdated --mode=null-safety
```

![image-20210926165313327](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210926165313327.png)

上面的输出说明了所有依赖的 package 都有可使用的已支持空安全的预发布版本。

# 5.升级依赖

在迁移你的 package 的代码之前，请将它的依赖项升级至空安全版本。

1. 运行 `dart pub upgrade --null-safety` 将依赖升级至支持空安全的最新版本。 **注意：** 该命令会更改你的 `pubspec.yaml` 文件。

   

2. 运行 `dart pub upgrade`。

# 6. 迁移

你的代码里大部分需要更改的代码，都是可以轻易推导的。例如，如果一个变量可以为空，它的类型需要 `?` 后缀。一个不可以为空的命名参数，需要使用 `required` 标记。

针对迁移，你有两个选项可以选择：

- [使用迁移工具](https://dart.cn/null-safety/migration-guide#migration-tool)，它可以帮你处理大多数可推导的变更。
- [自己动手，丰衣足食。](https://dart.cn/null-safety/migration-guide#migrating-by-hand)

## 6.1使用迁移工具

迁移工具会带上一个非空安全的 package ，将它转换至空安全。你可以先在代码中添加 提示标记

开始转换前，请做好如下的准备：

- 使用最新的 Dart SDK 稳定版本。
- 运行 `dart pub outdated --mode=null-safety` 以确保所有依赖为最新且空安全。

在包含 `pubspec.yaml` 的目录下，执行 `dart migrate` 命令，启动迁移工具。

如果你的 package 可以进行迁移，工具会输出类似以下的内容：

![image-20210926165733812](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210926165733812.png)

使用 Chrome 浏览器访问 URL，你可以看到一个交互式的界面，引导你进行迁移：

![image-20210926165802333](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210926165802333.png)

#### 理解迁移的结果

若要了解每个变化（或者未变化）的原因，点击 **Proposed Edits** 窗口中的行数，原因会出现在 **Edit Details** 窗口中。

点击 **line 3** 链接，你可以看到迁移工具添加 `!` 的原因。而因为你知道 `zero` 不会为空，所以你可以改进迁移结果。

#### 改进迁移的结果

当分析结果推导了错误的可空性时，你可以添加临时的提示标记来改变建议的编辑：

- 在迁移工具的 **Edit Details** 窗格中，你可以通过 **Add `/\*?\*/` hint** 和 **Add `/\*!\*/` hint** 按钮来添加提示标记。

  按下这些按钮，相应的标记会立刻添加到代码中，并且 **无法撤销**。如果你想删除标记，可以和平常一样使用代码编辑器删除它。

- 就算迁移工具正在运行，你也可以使用编辑器添加提示标记。由于你的代码还未迁移到空安全，所以无法使用空安全的新特性。但是你可以进行与空安全无关的改动，例如重构。

  当你完成编辑后，点击 **Rerun from sources** 进行更改。

#### 只迁移部分文件

尽管我们希望你能一次性完成迁移工作，但对于大体量的应用或 package 而言并不是简单的事。如果你想只迁移部分文件，请将暂时不迁移的文件前方的绿色勾选框取消勾选。

### 6.2手动迁移

如果你不想使用迁移工具，你也可以手动进行迁移。

我们推荐你 **优先迁移最下层的库** —— 指的是没有导入其他 package 的库。接着迁移直接依赖了下层库的依赖库。最后再迁移依赖项最多的库。

举个例子，假设你的 `lib/src/util.dart` 导入了其他（空安全）的 package 和核心库，但它没有包含任何 `import '<本地路径>'` 的引用。那么你应当优先考虑迁移 `util.dart`，然后迁移依赖了 `util.dart` 的文件。如果有一些循环引用的库（例如 A 引用了 B，B 引用了 C，C 引用了 A），建议同时对它们进行迁移。

手动对 package 进行迁移时，请参考以下步骤：

1. 编辑 package 的 `pubspec.yaml` 文件，将最低 SDK 版本设置到至少为 `2.12.0`：

   ```
   environment:
     sdk: '>=2.12.0 <3.0.0'
   ```

2. 重新生成 [package 的配置文件](https://github.com/dart-lang/language/blob/master/accepted/future-releases/language-versioning/package-config-file-v2.md)：

   ```
   $ dart pub get
   ```

   在版本最低是 `2.12.0` 的 SDK 上运行 `dart pub get` 时，会将每个 package 的默认 SDK 最低版本设定为 2.12，并且默认它们已经迁移至空安全。

3. 在你的 IDE 上打开package 。
   你也许会看到很多错误，没关系，让我们继续。

4. 利用分析器来辨析静态错误，逐个迁移 Dart 文件。
   按需添加 `?`、`!`、`required` 以及 `late` 来消除静态错误。

## 6.3.分析

更新你的 package（在 IDE 或命令行工具中使用 `dart pub get`）后在 IDE 或命令行工具中对你的代码进行 [静态分析](https://dart.cn/guides/language/analysis-options)：

```
$ dart pub get
$ dart analyze     # or `flutter analyze`
```

![image-20210926170316920](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210926170316920.png)

## 6.4测试

如果你的代码通过了分析，接下来可以开始测试：

```
$ dart test       # or `flutter test`
```

你可能需要更新使用了空值作为预期用例的测试代码。

如果你需要对代码作出大量的更改，那么你可能需要重新对代码进行迁移。这时请先回滚代码更改，再运行迁移工具进行迁移。

# 7发布web版

我们希望你完成迁移后尽快将其发布，可以作为预览版：

 参考文章：
 https://dart.cn/null-safety/migration-guide

细心的小伙伴可能会发现,安卓有android文件夹, iOS 有ios的文件夹,但目前目录结构是没有web文件夹的,

## 1. 创建web文件夹

输入下面的命令创建web文件



```undefined
flutter create .
```

然后就会创建一系列web相关的文件 ,如下图, 目录结构也会多一个web的文件夹. 如下图

![image-20210927103240783](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210927103240783.png)

## 2. 打包web版本

我们知道要给android手机用,需要打包apk出来, 要给iPhone手机用,需要打包ipa出来;同样的道理要给浏览器用,也需要打包web相关代码.

```undefined
flutter build web --web-renderer html

flutter build web 

flutter build web --web-renderer canvaskit
```

这将生成包括资源的应用程序，并将文件放入项目的 `/build/web` 目录中。

一般的应用程序的 release 版本具有以下结构：

*content_copy*

```none
/build/web
  assets
    AssetManifest.json
    FontManifest.json
    NOTICES
    fonts
      MaterialIcons-Regular.ttf
      <other font files>
    <image files>
  index.html
  main.dart.js
  main.dart.js.map
```

启动 Web 服务器（例如，`python -m SimpleHTTPServer 8000`，或使用 [dhttpd](https://pub.flutter-io.cn/packages/dhttpd) package），然后打开 /build/web 目录。在浏览器中访问 `localhost:8000`（前文用 Python 启动的服务器）以查看应用程序的 release 版本。



经过测试,上面三种方式都可以打包web版本, 其中第一种是针对移动端的打包方式, 第二种是一般的打包方式, 第三种是针对pc端的打包方式.

那这3种方式打包出来,运行起来有什么不同呢

flutter build web --web-renderer html 打开速度最快,兼容性好(是指ie,chrome,safari等浏览器兼容)

![image-20210927103940311](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210927103940311.png)

flutter build web 打开速度一般,兼容性好

![image-20210927104021552](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210927104021552.png)

flutter build web --web-renderer canvaskit 打开速度最慢,兼容性好

## 3**结论**

 就是使用第一种打包方式会比较好



```undefined
flutter build web --web-renderer html
```



### 坑1:  找到了index.html,用浏览器打开一片空白

这个属于正常的, 这个不像前端web ,html css js那套,点击index.html就能访问的.  在flutter里面是不能直接访问的,一定要放到容器里面去才能访问,如:tomcat等

### 坑2:  已经用nginx代理,用浏览器打开还是一片空白

那是因为文件路径引用不对.解决办法有2种
 方法1:
 用编辑器打开index.html,能看到源文件,把<base href="/">,改成<base href="">

方法2:
 用编辑器打开index.html,能看到源文件,把<base href="/">,改成你服务器的路径比喻说:<base href="http://你的服务器ip:0-65536/web/">

然后nginx代理


```undefined
  #flutter
    server {
       listen       251 ;
       server_name  flutterblog;
       location / {
           root   /root/study/flutter/web/;
           index  index.html index.htm;
        #    proxy_pass   http://127.0.0.1:12345;
        #    access_log  /usr/local/nginx/logs/go.101.log ;

       }
    }
​```undefined
```

撒花

# 8发布windows版

![image-20210928095003619](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210928095003619.png)

我们希望你完成迁移后尽快将其发布，可以作为预览版：

 参考文章：
 https://dart.cn/null-safety/migration-guide

 迁移桌面
 flutter config --enable-<platform>-desktop

 ![image-20210927100236887](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210927100236887.png)



## 1.为现有的 Flutter 应用程序添加桌面支持

要将桌面支持添加到现有 Flutter 项目，请从项目根目录在终端中运行以下命令：



```
$ flutter create --platforms=windows,macos,linux .
```

这会将必要的桌面文件和目录添加到您现有的 Flutter 项目中。要仅添加特定桌面平台，请将`platforms`列表更改为仅包含您要添加的平台。

![image-20210927100948120](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210927100948120.png)



必须下载vs

https://visualstudio.microsoft.com/zh-hans/thank-you-downloading-visual-studio/?sku=Community&rel=16

可以看到build目录下已经有windows

![image-20210928082949206](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210928082949206.png)



## 2..创建main_desktop.dart文件

比如我的main.dart文件是这样的



```dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/screens/main/main_screen.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //取消debug图标
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
          bodyText2: TextStyle(color: kBodyTextColor),
          headline5: TextStyle(color: kDarkBlackColor),
        ),
      ),
      home: MainScreen(),
    );
  }
}

```







那么我的main_desktop.dart文件就是这样的

```
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/screens/main/main_screen.dart';
import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'constants.dart';

void main() {
debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;//这句话很关键
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, //取消debug图标
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBgColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: TextButton.styleFrom(backgroundColor: kPrimaryColor),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: kBodyTextColor),
          bodyText2: TextStyle(color: kBodyTextColor),
          headline5: TextStyle(color: kDarkBlackColor),
        ),
      ),
      home: MainScreen(),
    );
  }
}

```





flutter和go都是google出品，如何安装做一下不做介绍

## 3.hover安装和环境配置



```go
go get -u github.com/go-flutter-desktop/hover
```

稍等会hover就会出现在go语言的SDK下面的bin文件夹下





![image-20210928084124073](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210928084124073.png)



你又会发现报错：**exec: "gcc": executable file not found in %PATH%**这是缺少一个环境变量，别急，补上去，
 [https://sourceforge.net/projects/mingw-w64/files/mingw-w64/](https://sourceforge.net/projects/mingw-w64/)

![image-20210928084641518](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210928084641518.png)





![img](https:////upload-images.jianshu.io/upload_images/16428535-b7dac57c19c30e55.png?imageMogr2/auto-orient/strip|imageView2/2/w/561/format/webp)

![](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210928085519691.png)





![img](https:////upload-images.jianshu.io/upload_images/16428535-b2b7d701a6690d4f.png?imageMogr2/auto-orient/strip|imageView2/2/w/561/format/webp)



![image-20210928084842376](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210928084842376.png)





![img](https:////upload-images.jianshu.io/upload_images/16428535-d2ab630b0dee3abe.png?imageMogr2/auto-orient/strip|imageView2/2/w/561/format/webp)


 安装过程会下载很多东西，都到这一步了，不要放弃，接下来配置环境变量



> C:\Program Files (x86)\mingw-w64\i686-6.2.0-posix-sjlj-rt_v5-rev1\mingw32\bin

![img](https:////upload-images.jianshu.io/upload_images/16428535-734878fc0379e939.png?imageMogr2/auto-orient/strip|imageView2/2/w/526/format/webp)

## 4.初始化，并打包

接下来，我们到你的flutter项目的目录下面



```bash
hover init github.com/my-organization/flutter_bloc_super #前面的地址固定，后面写你项目的名字
```

就会出现一个go文件夹

![image-20210928091320860](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210928091320860.png)

生成这个文件之后再执行，



```undefined
hover run
```

**最后一步大功告成**

变身！！！！！
如图的路径就是打包后生成的exe文件，双击执行，就好了。

![image-20210928091457350](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210928091457350.png)

## 坑1

如果报错goland编译报错cc1.exe: sorry, unimplemented: 64-bit mode not compiled in

主要原因是本地的cc1.exe版本不是64位的，在64位环境下无法编译

请下载这个、https://sourceforge.net/projects/mingw-w64/



![image-20210928090948605](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210928090948605.png)
