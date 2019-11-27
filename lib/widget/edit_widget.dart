import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(EditApp());

class EditApp extends StatefulWidget {
  @override
  _EditAppState createState() => _EditAppState();
}

class _EditAppState extends State<EditApp> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EditWidget',
      home: Scaffold(
        appBar: AppBar(
          title: Text('EditWidget'),
        ),
        body: Padding(
            padding: EdgeInsets.all(14),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: EditableText(
                    controller: _textEditingController,
                    focusNode: FocusNode(),
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                    ),
                    cursorColor: Colors.blue,
                    backgroundCursorColor: Colors.green,
                    onChanged: (text) {
                      debugPrint(text);
//                  debugPrint(_controller.text);
                    },
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.perm_identity),
                    prefixIcon: Icon(Icons.filter_1),
                    suffixIcon: Icon(Icons.filter_2),
                    labelText: 'labelText',
                    hintText: 'hintText',
                    counterText: "counterText",
                    helperText: "helperText",
//                    errorText: "errorText",
                    border: InputBorder.none,
                    errorBorder: OutlineInputBorder()
                  ),
                ),
                Divider(),
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.perm_identity),
                      prefixIcon: Icon(Icons.filter_1),
                      suffixIcon: Icon(Icons.filter_2),
                      labelText: 'labelText',
                      hintText: 'hintText',
                      counterText: "counterText",
                      helperText: "helperText",
//                    errorText: "errorText",
                      border: InputBorder.none,
                      errorBorder: UnderlineInputBorder()
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
