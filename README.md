

# Flutter Bloc Super - 全平台博客项目

[![Flutter Version](https://img.shields.io/badge/Flutter-3.0+-blue.svg)](https://flutter.dev/)
[![Dart Version](https://img.shields.io/badge/Dart-3.0+-blue.svg)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](LICENSE)

## 📋 项目概述

一个基于Flutter 3构建的全平台博客项目，支持Android、iOS、macOS、Web、Linux和HarmonyOS Next等多个平台。本项目采用响应式设计，完美适配各种屏幕尺寸，为用户提供一致且流畅的体验。

## 📱 在线预览

- **Android版本**：[https://www.pgyer.com/bVWB](https://www.pgyer.com/bVWB)

## 🌟 核心特性

- **全平台支持**：完美运行于Android、iOS、macOS、Web、Linux和HarmonyOS Next
- **响应式设计**：智能适配手机、平板和桌面等各种屏幕尺寸
- **Bloc状态管理**：采用Bloc模式进行高效的状态管理
- **空安全支持**：完全兼容Dart空安全特性
- **桌面平台优化**：针对桌面环境进行了专门的UI/UX优化
- **现代化UI设计**：遵循Material Design设计规范

## 🔧 技术栈

- **Flutter 3.0+**：最新的Flutter框架
- **Dart 3.0+**：采用Dart语言最新特性
- **GetX**：轻量级且强大的状态管理库
- **Flutter SVG**：高效渲染SVG图标和图形
- **自适应布局**：针对不同平台的响应式UI组件

## 📂 项目结构

```
- lib/
  - controllers/     # 控制器层 - 处理业务逻辑
  - models/          # 数据模型层 - 定义数据结构
  - screens/         # 页面层 - 用户界面
  - main.dart        # 应用入口文件
  - constants.dart   # 全局常量定义
  - responsive.dart  # 响应式布局工具
- assets/
  - images/         # 图片资源
  - icons/          # SVG图标资源
  - fonts/          # Raleway字体资源
```

## 🚀 快速开始

### 环境要求

- Flutter SDK 3.0或更高版本
- Dart SDK 3.0或更高版本

### 安装步骤

1. **克隆仓库**

```bash
git clone https://github.com/jianguo888/flutter_bloc_super.git
```

或

```bash
git clone https://gitcode.com/nutpi/flutter_bloc_super.git
```

2. **安装依赖**

```bash
flutter pub get
```

3. **运行应用**

```bash
flutter run
```

## 📱 多平台开发指南

### Flutter版本管理 (FVM)

#### 全局激活FVM

```bash
pub global activate fvm
```

#### 查看已安装的Flutter版本

```bash
fvm list
```

#### 选择特定Flutter版本

```bash
fvm use 3.0.0
```

#### 强制使用指定版本

```bash
fvm use 3.0.0 --force
```

### Web平台构建与部署

#### 创建Web支持

```bash
flutter create .
```

#### Web打包选项

针对移动端优化（加载速度快，兼容性好）：
```bash
flutter build web --web-renderer html
```

标准打包方式：
```bash
flutter build web
```

针对PC端优化（视觉效果好）：
```bash
flutter build web --web-renderer canvaskit
```

#### Web部署配置

使用Nginx部署时，可能需要修改`index.html`中的base href：

```html
<!-- 修改前 -->
<base href="/">

<!-- 修改后方法1 -->
<base href="">

<!-- 修改后方法2 -->
<base href="http://你的服务器ip:端口/web/">
```

Nginx配置示例：

```nginx
server {
   listen       251;
   server_name  flutterblog;
   location / {
       root   /root/study/flutter/web/;
       index  index.html index.htm;
   }
}
```

### 桌面平台支持

#### 添加桌面平台支持

```bash
flutter create --platforms=windows,macos,linux .
```

#### 启用特定桌面平台

```bash
flutter config --enable-<platform>-desktop
```

#### Windows平台打包

使用hover工具构建Windows应用：

```bash
go get -u github.com/go-flutter-desktop/hover
hover init github.com/my-organization/flutter_bloc_super
hover run
```

## 🔄 空安全迁移指南

本项目已完全支持Dart空安全特性，迁移步骤如下：

1. 创建并切换到空安全分支
2. 确认Dart版本 ≥ 2.12
3. 检查依赖迁移状态：`dart pub outdated --mode=null-safety`
4. 升级依赖：`dart pub upgrade --null-safety`
5. 使用迁移工具或手动迁移代码
6. 代码分析：`dart analyze`
7. 运行测试：`flutter test`

更多空安全迁移详情：[https://dart.cn/null-safety/migration-guide](https://dart.cn/null-safety/migration-guide)

## 📺 学习资源

- [Flutter博客项目视频教程](https://www.bilibili.com/video/bv1uy4y1t7LX)

## 👨‍💻 关于作者

### 主要作者
- **坚果派(NutPi)**
  - 个人网站：[https://www.nutpi.com](https://www.nutpi.com)
  - 联系邮箱：jianguo@nutpi.net
  - 代码仓库：[https://gitcode.com/nutpi](https://gitcode.com/nutpi)

欢迎关注我的公众号获取更多Flutter开发资源和教程：

![公众号二维码](https://luckly007.oss-cn-beijing.aliyuncs.com/image/%E5%85%AC%E4%BC%97%E5%8F%B7%E4%BA%8C%E7%BB%B4%E7%A0%81.jpg)

## 📄 许可证

本项目基于Apache License 2.0许可证开源 - 详见[LICENSE](LICENSE)文件
