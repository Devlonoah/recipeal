import 'package:flutter/material.dart';

Future<void> showFailedAuthDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Error Occured'),
          content: const Text('Error Signing in'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            )
          ],
        );
      });

  // ScaffoldMessenger.of(context)
  //     .showSnackBar(SnackBar(content: Text('occured')));
}
