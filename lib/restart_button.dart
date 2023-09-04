import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  const RestartButton({
    super.key,
    required this.text,
    required this.ontap,
  });
  final void Function() ontap;
  final String text;
  @override
  Widget build(context) {
    return OutlinedButton.icon(
      onPressed: ontap,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        padding: const EdgeInsets.only(top: 20, bottom: 20, right: 10),
        side: const BorderSide(color: Color.fromARGB(255, 167, 151, 194)),
      ),
      icon: const Icon(Icons.restart_alt_rounded),
      label: Text(text),
    );
  }
}
