import 'package:flutter/material.dart';
import 'package:planets/home/GradientAppBar.dart';
import 'package:planets/home/HomePageBody.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GradientAppBar("treva"),
          HomePageBody(),
        ],
      ),
    );
  }
}
