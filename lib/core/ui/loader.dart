import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}
