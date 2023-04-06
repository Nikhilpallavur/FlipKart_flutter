
import 'package:flutter/material.dart';

class SimpleCard extends StatefulWidget {
  final onClick;
  final Widget? child;
  const SimpleCard({super.key, required this.onClick, this.child});

  @override
  State<SimpleCard> createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onClick,
        child: Card(
          color: Colors.white,
          child: widget.child,
        ));
  }
}
