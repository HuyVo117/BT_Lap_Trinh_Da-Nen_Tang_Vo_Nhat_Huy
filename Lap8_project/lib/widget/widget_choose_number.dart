import 'package:flutter/material.dart';

class WidgetChooseNumber extends StatefulWidget {
  final int number;
  final String title;
  final Function() add;
  final Function() mul;

  const WidgetChooseNumber(
      {super.key,
      required this.title,
      required this.number,
      required this.add,
      required this.mul});

  @override
  State<WidgetChooseNumber> createState() => _WidgetChooseNumberState();
}

class _WidgetChooseNumberState extends State<WidgetChooseNumber> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.indigo,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            Text(
              widget.number.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    iconSize: WidgetStatePropertyAll(30),
                    iconColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    widget.mul();
                  },
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(width: 20),
                IconButton(
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blue),
                    iconSize: WidgetStatePropertyAll(30),
                    iconColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {
                    widget.add();
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
