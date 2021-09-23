import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  const Badge({@required this.child, @required this.value});

  final Widget child;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          right: 8,
          top: 8,
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: Theme.of(context).primaryColor),
            constraints: BoxConstraints(minWidth: 16, minHeight: 16),
            child: Text(value, textAlign: TextAlign.center, style: TextStyle(fontSize: 10)),
          ),
        )
      ],
    );
  }
}
