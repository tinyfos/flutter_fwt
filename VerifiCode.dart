import 'dart:async';

import 'package:flutter/material.dart';

class FwtVerifiCode extends StatefulWidget {
  FwtVerifiCode({Key key
  , this.seconds
  , this.width
  , this.height
  , this.fontColor
  , this.border
  , this.fondStyle
  , this.onTapEvent
  , this.defalutText
  , this.repeatText}) : super(key: key);

  @required final int    seconds;
  @required final double width;
  @required final double height;
  @required final String repeatText;
  @required final        onTapEvent;

  String defalutText = "发送验证码";

  final Border      border;
  final TextStyle   fondStyle;
  final Color       fontColor;

  @override
  _FwtVerifiCodeState createState() => new _FwtVerifiCodeState();
}

class _FwtVerifiCodeState extends State<FwtVerifiCode> {
  // 定时器类
  Timer  _timer;
  // 显示内容
  String _verifyStr = '';
  // 倒计时秒
  int    _seconds   = 0;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new InkWell(
      onTap: (_seconds == 0)
          ? () {
              setState(() {
                _startTimer();
              });
            }
          : null,
      child: new Container(
        alignment: Alignment.center,
        width: widget.width,
        height: widget.height,
        decoration: new BoxDecoration(
          border: widget.border == null ? new Border.all(
            width: 1,
            color: Colors.blue,
          ) : widget.border,
        ),
        child: new Text(
          _verifyStr == '' ? widget.defalutText : _verifyStr,
          style: widget.fondStyle == null ? new TextStyle(fontSize: 14.0) : widget.fondStyle,
        ),
      ),
    ),
    );
  }
    _cancelTimer() {
    _timer?.cancel();
  }

 _startTimer() {
    widget.onTapEvent();
     _seconds = widget.seconds;
    _timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      if (_seconds== 0) {
        _cancelTimer();
        return;
      }

      _seconds--;
      _verifyStr = '$_seconds(s)';
      setState(() {});
      if (_seconds == 0) {
        _verifyStr = widget.repeatText == null? '重新发送' : widget.repeatText;
      }
    });
  }
}