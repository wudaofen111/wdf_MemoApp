import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginForm(),
    );
  }
}

//定义一个登录表单界面
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}
class _LoginFormState extends State<LoginForm> {

  //TextEditingController用于监听文本框
  late TextEditingController _phoneEditController;  //输入用户名
  late TextEditingController _pwdEditController;  //输入密码

  var _phoneNum = '';
  var _password = '';

  bool _isShowPwd = false;  //是否显示密码
  bool _isShowClear = false;   //是否显示清除按钮

  //FocusNode 主要提供焦点控制功能，实现控制焦点内容，实现键盘回收
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _pwdEditController = TextEditingController();
    _phoneEditController = TextEditingController();

    //监听手机号框输入的改变
    _phoneEditController.addListener(() {
      if(_phoneEditController.text.isNotEmpty) {
        _isShowClear = true;
      } else {
        _isShowClear = false;
      }
      setState(() {});
    });
    _pwdEditController.addListener(() => setState(() => {}));

    //设置监听焦点
    _phoneFocusNode.addListener(_focusNodeListener);
    _pwdFocusNode.addListener(_focusNodeListener);
  }

  //监听焦点
  Future<void> _focusNodeListener() async {
    if(_phoneFocusNode.hasFocus) {
      print('手机号框获取焦点');
      _pwdFocusNode.unfocus();  //取消密码框的焦点状态
    }

    if( _pwdFocusNode.hasFocus) {
      print('密码框获取焦点');
      _phoneFocusNode.unfocus();  //取消手机号框的焦点状态
    }
  }

  @override
  void dispose() {
    super.dispose();
    //移除焦点监听
    _phoneFocusNode.removeListener(_focusNodeListener);
    _pwdFocusNode.removeListener(_focusNodeListener);
  }

  //验证手机号
  String? _validatePhone(value) {
    RegExp regExp = RegExp(r'^1\d{10}$');
    if (value!.isEmpty) {
      return '请输入手机号!';
    }
    else if (!regExp.hasMatch(value)) {
      return '请输入正确的手机号!';
    }
    return null;
  }

  //验证密码
  String? _validatePwd(value) {
    if (value == null || value.isEmpty) {
      return '请输入密码!';
    }
    else if (value.length < 6 || value.length > 12) {
      return '密码必须在6-12位数之间!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/images/background.png'), fit: BoxFit.cover),
        // ),
        child: ListView(
          children: [
            _buildTopBannerWidget(),
            _buildLoginInfo(),
            _buildEditWidget(),
            _buildForgetPwd(),
            _buildLoginButton(),
            _otherLoginWay()
          ],
        ),
      ),
    );
  }

  //顶部信息区域
  _buildTopBannerWidget() {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 50),
        child: Row(
          children: [
            Image.asset("assets/images/logo.png", height: 60, width: 60, fit: BoxFit.cover),
            const Text(' 登录',style: TextStyle(
                fontSize: 25,
                fontFamily: '黑体',
                fontWeight: FontWeight.bold,
                color: Colors.white70,
                decoration: TextDecoration.none
            )),
          ],
        )
    );
  }
  //显示登录方式(手机号登录)
  _buildLoginInfo() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
      child: Text(
        "手机号登录",
        maxLines: 1,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16, color: Colors.white60),
      ),
    );
  }
  //编辑区域(包括手机号、密码)区域
  _buildEditWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _editLoginPhone(),
            const Divider(height: 2.0, color: Colors.blueGrey,),
            const SizedBox(height: 25,),
            _editLoginPwd(),
            const Divider(height: 2.0,  color: Colors.blueGrey,),
          ],
        ),
      ),
    );
  }
  //手机号区域
  _editLoginPhone() {
    return TextFormField(
      controller: _phoneEditController,
      focusNode: _phoneFocusNode,
      keyboardType: TextInputType.number,  //设置键盘类型
      decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14, color: Colors.white38),
          hintText: "请输入手机号",
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.phone_android,),
          suffixIcon: (_isShowClear)
              ? IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: (){
              _phoneEditController.clear();  //清空输入框内容
              _phoneFocusNode.unfocus();  //取消焦点
            },
          )
              : null
      ),
      validator: _validatePhone,  //验证手机号
      onSaved: (value) {_phoneNum = value!;},  //保存数据
    );
  }
  //密码区域
  _editLoginPwd() {
    return TextFormField(
      controller: _pwdEditController,
      focusNode: _pwdFocusNode,
      decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14, color: Colors.white38),
          hintText: "请输入密码",
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(_isShowPwd ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isShowPwd = !_isShowPwd;
              });
            },
          )
      ),
      obscureText: !_isShowPwd,
      validator: _validatePwd,  //验证密码
      onSaved: (value) { _password = value!;},  //保存数据
    );
  }
  //忘记密码区域
  _buildForgetPwd() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('忘记密码?', style: TextStyle(color: Colors.white38)),
          TextButton(
            child: const Text('没有账号? 点击注册',style: TextStyle(color: Colors.lightBlue,decoration: TextDecoration.underline),),
            onPressed: () { Navigator.of(context).pushReplacementNamed('register'); },
          ),
        ],
      ),
    );
  }
  //登录按钮区域
  _buildLoginButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 44,
              child: ElevatedButton(
                  onPressed: () {  //点击登录按钮，解除焦点，回收键盘
                    _phoneFocusNode.unfocus();
                    _pwdFocusNode.unfocus();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();

                      Navigator.of(context).pushReplacementNamed('home');
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('登录成功！')));
                      print("$_phoneNum + $_password ");  //控制台打印登录内容
                    }
                  },
                  child: const Text("登录", style: TextStyle(color: Colors.white),)
              ),
            ),
          ),
        ],
      ),
    );
  }
  //其它登录方式
  _otherLoginWay() {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Text('其它账号登录', style: TextStyle(color: Colors.white60)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/img.png', height: 25, width: 25),
                Image.asset('assets/images/img_1.png', height: 25, width: 25,),
                Image.asset('assets/images/img_2.png', height: 25, width: 25,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
