import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './VerifiCode.dart';

class FwtVerifiCodeForm extends StatefulWidget {
  FwtVerifiCodeForm({Key key
  , this.seconds
  , this.width
  , this.height
  , this.fontColor
  , this.border
  , this.fondStyle
  , this.onTapEvent
  , this.defalutText
  , this.repeatText
  , this.textFormField
  , this.verifiRightPading}) : super(key: key);

  @required final int           seconds;
  @required final double        width;
  @required final double        height;
  @required final String        repeatText;
  @required final               onTapEvent;
  @required final TextFormField textFormField;
  @required final double           verifiRightPading;

  String defalutText = "发送验证码";

  final Border      border;
  final TextStyle   fondStyle;
  final Color       fontColor;

  @override
  _FwtVerifiCodeFormState createState() => new _FwtVerifiCodeFormState();
}

class _FwtVerifiCodeFormState extends State<FwtVerifiCodeForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: <Widget>[
          widget.textFormField == null ? TextFormField(
            decoration: InputDecoration(
              hintText: '请输入',
            ),
          ) : this.widget,
          Padding(
            padding: EdgeInsets.only(right: widget.verifiRightPading == null ? 20 : widget.verifiRightPading),
            //padding: EdgeInsets.only(left: 100),
            child: FwtVerifiCode(
              width: widget.width,
              height: widget.height,
              seconds: widget.seconds,
              repeatText: widget.repeatText,
              onTapEvent: widget.onTapEvent,
              defalutText: widget.defalutText,
            ),
          )
        ],
      ),
    );
  }
}
