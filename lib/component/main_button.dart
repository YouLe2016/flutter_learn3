import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String text;
  final String routeName;

  const MainButton({Key key, this.text, this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue,
      textColor: Colors.white,
      onPressed: () {
        if (routeName != null) {
          Navigator.pushNamed(context, routeName);
        }
      },
      child: Text(text),
    );
  }
}
