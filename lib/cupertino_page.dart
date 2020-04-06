import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoPage extends StatefulWidget {
  @override
  _CupertinoPageState createState() => _CupertinoPageState();
}

class _CupertinoPageState extends State<CupertinoPage> {
  bool _switch = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text('Cupertino UI'),
      ),
      body:Column(
        children: <Widget>[
          CupertinoButton(
            child: Text('쿠퍼티노 button'),
          ),
          CupertinoSwitch(
            value: _switch,
            onChanged: (bool value){
              setState(() {
                _switch = value;
              });
            },
          ),
          RaisedButton(
            child:Text('머터리얼 버튼')
          ),
          Switch(
            value:_switch,
            onChanged: (bool value){
              setState(() {
                _switch = value;
              });
            },
          )
        ],
      )
    );
  }
}