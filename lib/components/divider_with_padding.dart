import 'package:flutter/material.dart';

class DividerWithPadding extends StatelessWidget {
  const DividerWithPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Divider(),
    );
  }
}
