import 'package:flutter/material.dart';
import '../theme/colors.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({
    Key? key,
    required this.color,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final String label;

  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        onSurface: kkSkyBlue,
        shadowColor: kkBlack,
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .button
              ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
