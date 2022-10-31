import 'package:flutter/material.dart';
import 'package:planets/home/planet_row.dart';
import 'package:planets/model/planets.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xFF736AB7),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              sliver: SliverFixedExtentList(
                itemExtent: 152.0,
                delegate: SliverChildBuilderDelegate(
                  (context, index) => PlanetRow(planets[index], index),
                  childCount: planets.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
