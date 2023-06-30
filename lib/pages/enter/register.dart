import 'dart:async';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterForm(),
    );
  }
}

//定义一个注册表单界面
class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}
class _RegisterFormState extends State<RegisterForm> {
  //TextEditingController用于监听文本框
  late TextEditingController _phoneEditController;  //手机号
  late TextEditingController _codeEditController;  //验证码
  late TextEditingController _pwdEditController;   //密码
  late TextEditingController _pwdConfirmController;  //确认密码

  //初始化验证码按钮的文本内容
  var _autoCodeText = '获取验证码';
  var _phoneNum = '';
  var _phoneCode = '';
  var _password = '';
  var _pwdConfirm = '';

  late Timer _timer;  //计时器
  int _timeCount = 60;  //计时器的秒数(用于实现倒计时60秒)


  //FocusNode 主要提供焦点控制功能，实现控制焦点内容，实现键盘回收
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _codeFocusNode = FocusNode();
  final FocusNode _pwdConfirmFocusNode = FocusNode();
  final FocusNode _pwdFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _isShowPwd = false;  //是否显示密码
  bool _isShowConfirmPwd = false;  //是否显示确认密码
  bool _isShowClear = false;  //是否显示清楚按钮

  @override
  void initState() {
    super.initState();
    _pwdEditController = TextEditingController();
    _phoneEditController = TextEditingController();
    _codeEditController = TextEditingController();
    _pwdConfirmController = TextEditingController();

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
    _codeEditController.addListener(() => setState(() {}));
    _pwdConfirmController.addListener(() => setState(() {}));

    //设置监听焦点
    _phoneFocusNode.addListener(_focusNodeListener);
    _codeFocusNode.addListener(_focusNodeListener);
    _pwdFocusNode.addListener(_focusNodeListener);
    _pwdConfirmFocusNode.addListener(_focusNodeListener);
  }

  //监听焦点
  Future<void> _focusNodeListener() async {
    if(_phoneFocusNode.hasFocus) {
      print('手机号框获取焦点');
      _codeFocusNode.unfocus();  //取消验证码框的焦点状态
      _pwdFocusNode.unfocus();  //取消密码框的焦点状态
      _pwdConfirmFocusNode.unfocus();  //取消确认密码框的焦点状态
    }
    if(_codeFocusNode.hasFocus) {
      print('验证码框获取焦点');
      _phoneFocusNode.unfocus();  //取消手机号框的焦点状态
      _pwdFocusNode.unfocus();  //取消密码框的焦点状态
      _pwdConfirmFocusNode.unfocus();  //取消确认密码框的焦点状态
    }
    if( _pwdFocusNode.hasFocus) {
      print('密码框获取焦点');
      _phoneFocusNode.unfocus();  //取消手机号框的焦点状态
      _codeFocusNode.unfocus();  //取消验证码框的焦点状态
      _pwdConfirmFocusNode.unfocus();  //取消确认密码框的焦点状态
    }
    if( _pwdConfirmFocusNode.hasFocus) {
      print('确认密码框获取焦点');
      _phoneFocusNode.unfocus();  //取消手机号框的焦点状态
      _codeFocusNode.unfocus();  //取消验证码框的焦点状态
      _pwdFocusNode.unfocus();  //取消密码框的焦点状态
    }
  }

  @override
  void dispose() {
    super.dispose();
    //移除焦点监听
    _phoneFocusNode.removeListener(_focusNodeListener);
    _codeFocusNode.removeListener(_focusNodeListener);
    _pwdFocusNode.removeListener(_focusNodeListener);
    _pwdConfirmFocusNode.removeListener(_focusNodeListener);
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

  //验证手机验证码
  String? _validateCode(value) {
    if (value == null || value.isEmpty) {
      return '请输入验证码';
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

  //验证确认密码
  String? _validateConfirmPwd(value) {
    if (value == null || value.isEmpty) {
      return '请再次输入密码!';
    }
    else if (value.length < 6 || value.length > 12) {
      return '密码必须在6-12位数之间!';
    }
    // else if(value != _password) {
    //   return '两次输入的密码不一致!';
    // }
    return null;
  }

  //验证码计时器
  _startTimer() {
    _timer = Timer.periodic(
      //设置为按秒计数
        const Duration(seconds: 1),
            (Timer timer) => {
          setState(() {
            if (_timeCount <= 0) {
              _autoCodeText = '获取验证码';
              _timer.cancel();
              _timeCount = 60;
            } else {
              _timeCount -= 1;
              _autoCodeText = "$_timeCount" 's 后重新获取';
              _CancelTimer();
            }
          })
        }
    );
  }

  //取消验证码倒计时的计时器
  _CancelTimer() {
    _timer.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _buildTopBannerWidget(),
          _buildRegisterInfo(),
          _buildEditWidget(),
          _buildGoToLogin(),
          _buildRegisterButton(),
        ],
      ),
    );
  }

  _buildTopBannerWidget() {
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10, top: 50),
        child: Row(
          children: [
            Image.asset("assets/images/logo.png", height: 60, width: 60, fit: BoxFit.cover),
            const Text(
              ' 注册',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: '黑体',
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                  decoration: TextDecoration.none),
            ),
          ],
        )
    );
  }
  _buildRegisterInfo() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
      child: Text(
        "手机号注册",
        maxLines: 1,
        textAlign: TextAlign.start,
        style: TextStyle(fontSize: 16, color: Colors.white60),
      ),
    );
  }
  //编辑区(包括手机号、验证码、密码、确认密码)区域
  _buildEditWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _editRegisterPhone(),
            const Divider(height: 2.0, color: Colors.blueGrey),
            const SizedBox(height: 25),
            _editRegisterCode(),
            const Divider(height: 2.0, color: Colors.blueGrey),
            const SizedBox(height: 25),
            _editRegisterPwd(),
            const Divider(height: 2.0, color: Colors.blueGrey),
            const SizedBox(height: 25),
            _editConfirmPwd(),
            const Divider(height: 2.0, color: Colors.blueGrey),
          ],
        ),
      ),
    );
  }
  //手机号区域
  _editRegisterPhone() {
    return TextFormField(
      controller: _phoneEditController,
      focusNode: _phoneFocusNode,
      keyboardType: TextInputType.number,  //设置键盘类型
      decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
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

      //验证手机号
      validator: _validatePhone,

      //保存数据
      onSaved: (value) {_phoneNum = value!;},
    );
  }
  //验证码区域
  _editRegisterCode() {
    return TextFormField(
      controller: _codeEditController,
      focusNode: _codeFocusNode,
      keyboardType: TextInputType.number,  //设置键盘类型
      decoration: InputDecoration(
        hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
        hintText: "请输入验证码",
        border: InputBorder.none,
        prefixIcon: const Icon(Icons.send_time_extension,),
        suffixIcon: SizedBox(
          child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.black12,),
            onPressed: () {
              _startTimer();  //验证码60s倒计时器
              setState(() {});
            },
            child: Text(_autoCodeText),
          ),
        ),
      ),
      validator: _validateCode,  //验证验证码
      onSaved: (value) {_phoneCode = value!;},
    );
  }
  //密码区域
  _editRegisterPwd() {
    return TextFormField(
      controller: _pwdEditController,
      focusNode: _pwdFocusNode,
      decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
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

      //验证密码
      validator: _validatePwd,

      //保存数据
      onSaved: (value) {_password = value!;},
    );
  }
  //确认密码区域
  _editConfirmPwd() {
    return TextFormField(
      // controller: _pwdConfirmController,
      focusNode: _pwdConfirmFocusNode,
      decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
          hintText: "请再次输入密码",
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(_isShowConfirmPwd ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _isShowConfirmPwd = !_isShowConfirmPwd;
              });
            },
          )
      ),
      obscureText: !_isShowConfirmPwd,
      validator: _validateConfirmPwd,   //验证确认密码
      onSaved: (value) {_pwdConfirm = value!;}, //保存数据
    );
  }
  //去登录区域
  _buildGoToLogin() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            child: const Text('已有账号，去登录',
                style: TextStyle(color: Colors.lightBlue)),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('login');
            },
          ),
        ],
      ),
    );
  }
  //注册按钮
  _buildRegisterButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 44,
              child: ElevatedButton(
                  onPressed: () {
                    //点击注册按钮，解除焦点，回收键盘
                    _phoneFocusNode.unfocus();
                    _codeFocusNode.unfocus();
                    _pwdFocusNode.unfocus();
                    _pwdConfirmFocusNode.unfocus();

                    if (_formKey.currentState!.validate()) {  //只有通过验证，才能执行该步骤
                      _formKey.currentState?.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('注册成功!为您跳转到登录界面...')));
                      print("$_phoneNum +$_phoneCode + $_password + $_pwdConfirm");  //控制台打印注册内容
                      Navigator.of(context).pushReplacementNamed('login');  //路由跳转到登录界面
                    }
                  },
                  child: const Text("注册", style: TextStyle(color: Colors.white),)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
