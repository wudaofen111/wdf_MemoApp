import 'package:wdf_software/controllers/MenuController.dart';
import 'package:wdf_software/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wdf_software/widgets/responsive.dart';
import 'package:wdf_software/pages/main_screen.dart';
import 'package:wdf_software/widgets/menu/side_menu.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 定义主页小部件
class AddComplete extends StatelessWidget {
  const AddComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // 设置应用程序的主题
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,  // 设置脚手架的背景颜色
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),  // 设置文本的字体和颜色
        canvasColor: secondaryColor,  // 设置画布的颜色
      ),

      // 使用MultiProvider来提供数据给小部件
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MyMenuController(),  // 创建菜单控制器实例
          ),
        ],
        child: const MainPage(),  // 显示主页面
      ),

    );
  }
}


// 定义主页面小部件
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MyMenuController>().scaffoldKey,  // 设置侧边菜单的键
      drawer: const SideMenu(),  // 添加侧边菜单
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 仅在大屏幕上显示侧边菜单
            if (Responsive.isDesktop(context))
              const Expanded(
                // 默认 flex = 1
                // 占据屏幕的 1/6 部分
                child: SideMenu(),
              ),
            const Expanded(
              // 占据屏幕的 5/6 部分
              flex: 5,
              child: MainScreen(),
            ),
          ],
        ),
      ),
    );
  }
}