import 'package:flutter/material.dart';

// 定义一个响应式小部件，它可以根据屏幕宽度返回不同的小部件
class Responsive extends StatelessWidget {
  final Widget mobile;   // 移动设备上要显示的小部件
  final Widget tablet;   // 平板设备上要显示的小部件
  final Widget desktop;  // 台式机上要显示的小部件

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  // 判断当前上下文所在的设备是否是移动设备
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  // 判断当前上下文所在的设备是否是平板设备
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
          MediaQuery.of(context).size.width >= 850;

  // 判断当前上下文所在的设备是否是台式机
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // 如果屏幕宽度大于等于1100，返回台式机上要显示的小部件
    if (size.width >= 1100) {
      return desktop;
    }
    // 如果屏幕宽度在850和1100之间，并且平板设备上要显示的小部件非空，返回平板设备上要显示的小部件
    else if (size.width >= 850) {
      return tablet;
    }
    // 否则返回移动设备上要显示的小部件
    else {
      return mobile;
    }
  }
}