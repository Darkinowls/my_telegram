import 'package:flutter/material.dart';

class PopBackArrowButton extends StatelessWidget {
  const PopBackArrowButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        // setState(){} -- NO STATES
        Navigator.of(context).popUntil(
            (route) => route.isFirst); // pops off until the first screen
      },
    );
  }
}
