import 'package:flutter/material.dart';
import 'package:planets/model/planets.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF736AB7),
        constraints: BoxConstraints.expand(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(planet.name),
            Hero(
              tag: "planet-hero-${planet.id}",
              child: Image.asset(
                planet.image,
                width: 96.0,
                height: 96.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
