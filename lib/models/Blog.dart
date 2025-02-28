/**
 * 博客数据模型
 * 
 * 此文件定义了博客文章的数据结构和示例数据。
 * 
 * @author 坚果派(NutPi)
 * @email jianguo@nutpi.net
 * @website https://www.nutpi.com
 * @version 1.0.0
 * @date 2023-01-01
 * @copyright Copyright © 2023 坚果派(NutPi). All rights reserved.
 */

class Blog {
  final String? date, title, description, image;

  Blog({this.date, this.title, this.description, this.image});
}

List<Blog> blogPosts = [
  Blog(
    date: "2021年10月11日",
    image: "assets/images/0.png",
    title:
        "Flutter是一个开源软件开发工具包 (SDK)，用于“帮助开发者通过一套代码库高效构建多平台精美应用，支持移动、Web、桌面和嵌入式平台”。允许跨平台开发。这样可以使您的公司和团队节省大量时间和精力。",
    description:
        "Flutter是一个开源软件开发工具包 (SDK)，用于“帮助开发者通过一套代码库高效构建多平台精美应用，支持移动、Web、桌面和嵌入式平台”。允许跨平台开发。这样可以使您的公司和团队节省大量时间和精力。",
  ),
  Blog(
    date: "2021年12月11日",
    image: "assets/images/1.png",
    title: "是什么让 Flutter 与众不同？",
    description:
        "lutter 与其他框架不同，因为它既不使用WebView，也不使用设备附带的OEM小部件。相反，它使用自己的高性能渲染引擎来绘制小部件。它还使用 Dart 编程语言实现了大部分系统，例如动画、手势和小部件，允许开发人员轻松阅读、更改、替换或删除内容。它为开发人员提供了对系统的出色控制。",
  ),
  Blog(
    date: "2022年10月14日",
    image: "assets/images/2.png",
    title: "鸿蒙系统是什么",
    description:
        "鸿蒙OS分布式操作系统简介鸿蒙系统（HarmonyOS)，是第一款基于微内核的全场景分布式OS，是华为自主研发的操作系统。现被华为捐献给开放原子基金会管理，为开放原子基金会下的一个项目。",
  ),
];
