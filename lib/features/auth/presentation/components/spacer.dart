import 'package:flutter/material.dart';

class AddSpace extends StatelessWidget {
  final double? height;
  final double? width;

  const AddSpace({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
