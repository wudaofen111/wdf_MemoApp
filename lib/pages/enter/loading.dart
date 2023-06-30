import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), (){
      Navigator.of(context).pushReplacementNamed("login");
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoadingForm(),
    );
  }
}

class LoadingForm extends StatelessWidget {
  const LoadingForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/loading.png'), fit: BoxFit.contain),
        ),
        child: ListView(
          children: [
            _buildWelcomeWidget(),
          ],
        ),
      ),
    );
  }
}

_buildWelcomeWidget() {
  return Container(
    margin: const EdgeInsets.only(left: 10, right: 10, top: 60),
    child: const Text(' 欢迎来到wdf的个性化备忘录APP~',style: TextStyle(
      fontSize: 25,
      fontFamily: '黑体',
      fontWeight: FontWeight.bold,
      color: Colors.white70,
    ),
    ),
  );
}
