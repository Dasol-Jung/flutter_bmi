import 'package:flutter/material.dart';

class DSCard extends StatelessWidget {
  static const defaultColor = Color(0xFEEEEEE);
  final Color color;
  final Widget child;
  DSCard({this.color : defaultColor, key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child : child,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    );
  }
}
