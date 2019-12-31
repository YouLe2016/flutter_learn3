import 'package:flutter/material.dart';

class RegisterDemo extends StatefulWidget {
  @override
  _RegisterDemoState createState() => _RegisterDemoState();
}

class _RegisterDemoState extends State<RegisterDemo> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;

  void submitRegisterForm() {
    registerFormKey.currentState.save();
    if (registerFormKey.currentState.validate()) {

    }
  }

  String validateUsername(String value) {
    if (value.isEmpty) {
      return "用户名为空";
    } else {
      return null;
    }
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "密码为空";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Demo'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        // todo: 不知道这个东西有什么用?
        child: Form(
          key: registerFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                onSaved: (value) {
                  debugPrint("onSaved: username=$value");
                  username = value;
                },
                validator: validateUsername,
                decoration: InputDecoration(
                  labelText: 'Username',
                  errorText: "",
                ),
              ),
              TextFormField(
                obscureText: true,
                //当Form表单调用保存方法save时回调
                onSaved: (value) {
                  debugPrint("onSaved: password=$value");
                  password = value;
                },
                validator: validatePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: "",
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "注册",
                    style: TextStyle(color: Colors.white),
                  ),
                  elevation: 0,
                  onPressed: () {
                    submitRegisterForm();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
