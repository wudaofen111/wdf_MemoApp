import 'package:wdf_software/pages/chart/graph_show.dart';
import 'package:wdf_software/pages/enter/loading.dart';
import 'package:wdf_software/pages/home/home.dart';
import 'package:wdf_software/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wdf_software/pages/enter/register.dart';
import 'package:wdf_software/pages/enter/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '吴道芬',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: const LoadingPage(),

      initialRoute: '/',
      routes: <String, WidgetBuilder> {
          'login': (BuildContext context) => const LoginPage(),
          'register': (BuildContext context) => const RegisterPage(),
          'home': (BuildContext context) => const HomePage(),
          'graph': (BuildContext context) => const GraphShowPage(),
      },
    );
  }
}
