import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final Object error;
  const ErrorTextWidget(this.error, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error.toString()),
    );
  }
}
