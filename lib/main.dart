import 'package:flutter/material.dart';
import 'home_page.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: FlutterAppTryTwo(),
));

class FlutterAppTryTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
