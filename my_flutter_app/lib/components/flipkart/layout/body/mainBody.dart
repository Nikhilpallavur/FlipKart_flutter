import 'package:flutter/material.dart';
import 'package:my_flutter_app/utils/flipkart/variables/styleVariables.dart';

class MainBody extends StatelessWidget {
  final Widget? child;

  const MainBody({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MAIN_PADDING_HORIZONTAL, right: MAIN_PADDING_HORIZONTAL),
      child: child,
    );
  }
}
