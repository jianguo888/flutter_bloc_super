# Flutter  Blog Theme using Flutter | Web, macOS, Android, iOS

Flutter 最近发布了 Flutter V2.5.1，其性能得到了很大提升，支持 Web、macOS、Android 和 iOS。 这就是为什么今天我们使用在 Web、macOS 应用、Android 和 iOS 应用上运行的 flutter 创建响应式博客主题。 此外，我们创建了一个具有自定义悬停动画的动画网络菜单。 最后，您将学习如何使用 Flutter 制作响应式应用程序。

![](https://luckly007.oss-cn-beijing.aliyuncs.com/image/gif.gif)

![ui](https://luckly007.oss-cn-beijing.aliyuncs.com/image/ui.png)



项目地址

https://github.com/ITmxs/flutter_bloc_super

主分支默认空安全

![image-20210926171758159](https://luckly007.oss-cn-beijing.aliyuncs.com/image/image-20210926171758159.png)



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
复制代码
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

## 6.5发布

我们希望你完成迁移后尽快将其发布，可以作为预览版：

 参考文章：
 https://dart.cn/null-safety/migration-guide