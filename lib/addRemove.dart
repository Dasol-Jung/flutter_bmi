import 'package:flutter/material.dart';

class AddRemove extends StatelessWidget {
  final Function onPressed;
  final int value;
  AddRemove(this.onPressed, this.value);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: IconButton(
                onPressed: () => onPressed('decrease'),
                icon: Icon(Icons.remove))),
        Expanded(
            child: Center(
                child: Text("$value", style: TextStyle(fontSize: 30)))),
        Expanded(
            child: IconButton(
                onPressed: () => onPressed('increase'), icon: Icon(Icons.add))),
      ],
    );
  }
}
