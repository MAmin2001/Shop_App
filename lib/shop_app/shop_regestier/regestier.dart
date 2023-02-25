import 'package:flutter/material.dart';

class RegestierScreen extends StatelessWidget {
  const RegestierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Regestier',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0
          ),
        ),
      ),
    );
  }
}
