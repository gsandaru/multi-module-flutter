import 'package:flutter/material.dart';

class PlaceHolderPage extends StatefulWidget {
  const PlaceHolderPage({super.key, this.child});
  final Widget? child;

  @override
  State<PlaceHolderPage> createState() => _PlaceHolderPageState();
}

class _PlaceHolderPageState extends State<PlaceHolderPage> {
  @override
  Widget build(BuildContext context) {
    return widget.child ?? const Placeholder();
  }
}
