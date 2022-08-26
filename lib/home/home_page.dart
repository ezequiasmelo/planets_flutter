import 'package:flutter/material.dart';
import 'package:planets/home/gradient_app_bar.dart';
import 'package:planets/home/home_page_body.dart';

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
