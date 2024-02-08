import 'package:flutter/material.dart';

class Translate extends StatelessWidget {
  const Translate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: const Center(
        child: Text(
          "We are adding translate feature soon!",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
