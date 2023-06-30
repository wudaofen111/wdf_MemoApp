import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wdf_software/pages/enter/login.dart';
import 'package:wdf_software/pages/home/home.dart';
import 'package:wdf_software/pages/home/help.dart';

import '../../pages/chart/graph_show.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                "assets/images/logo.png",
                width: 100,
                height: 100,
              ),
            ),
            DrawerListTile(
              title: "主页",
              iconSrc: "assets/icons/menu_dashbord.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            DrawerListTile(
              title: "个人中心",
              iconSrc: "assets/icons/menu_profile.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "我的任务",
              iconSrc: "assets/icons/menu_doc.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "图表展示",
              iconSrc: "assets/icons/menu_task.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GraphShowPage()),
                );
              },
            ),
            DrawerListTile(
              title: "帮助手册",
              iconSrc: "assets/icons/menu_notification.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHelpPage()),
                );
              },
            ),
            DrawerListTile(
              title: "设置",
              iconSrc: "assets/icons/menu_setting.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "退出登录",
              iconSrc: "assets/icons/menu_store.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,

    required this.title,
    required this.iconSrc,
    required this.press,
  }) : super(key: key);

  final String title, iconSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        iconSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
