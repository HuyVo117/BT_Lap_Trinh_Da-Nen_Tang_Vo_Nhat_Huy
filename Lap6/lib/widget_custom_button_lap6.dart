import 'package:flutter/material.dart';

class WidgetCustomButtonLap6 extends StatefulWidget {
  final Color color;
  final String text;
  final Function() handle;

  const WidgetCustomButtonLap6(
      {super.key,
      required this.color,
      required this.text,
      required this.handle});

  @override
  State<WidgetCustomButtonLap6> createState() => _WidgetCustomButtonLap6State();
}

class _WidgetCustomButtonLap6State extends State<WidgetCustomButtonLap6> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(widget.color),
            padding: const WidgetStatePropertyAll(EdgeInsets.all(20)),
            shape: const WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))))),
        onPressed: () {
          widget.handle();
        },
        child: Text(
          widget.text,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ));
  }
}
