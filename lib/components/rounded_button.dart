import 'package:flutter/material.dart';
import 'package:chatori_satori_proper/constants.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      required this.colour,
      required this.title,
      required this.onPressed});

  final Color colour;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: kConstantColourPurple,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () => onPressed(),
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: const TextStyle(fontFamily: 'Ubuntu', fontSize: 20),
          ),
        ),
      ),
    );
  }
}
