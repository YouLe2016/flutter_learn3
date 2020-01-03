import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditWidget extends StatefulWidget {
  @override
  _EditWidgetState createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  //使用 TextEditingController 监听文本字段变化
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.text = "默认值";
    _textEditingController.addListener(() {
      debugPrint('textEditingController: value=${_textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _textEditingController,
            // 监视文本字段的值的变化与提交
            /*onChanged: (value) {
              debugPrint('onChanged: value=$value');
            },
            onEditingComplete: (){
              debugPrint('onEditingComplete');
            },*/
            onSubmitted: (value) {
              debugPrint('onSubmitted: value=$value');
            },
            // 设置文本框样式
            decoration: InputDecoration(
              icon: Icon(Icons.perm_identity),
              prefixIcon: Icon(Icons.filter_1),
              suffixIcon: Icon(Icons.filter_2),
              labelText: 'labelText',
              hintText: 'hintText',
              counterText: "counterText",
              helperText: "helperText",
//              errorText: "errorText",
              border: InputBorder.none,
              errorBorder: OutlineInputBorder(),
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
                errorBorder: UnderlineInputBorder()),
          ),
        ],
      ),
    );
  }
}
