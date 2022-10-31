import 'package:flutter/material.dart';
import '../model/planets.dart';
import 'detail_page.dart';

class ButtonsNavigationPlanets extends StatelessWidget {
  final int index;

  const ButtonsNavigationPlanets(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final int indexPreviousPlanet = index == 0 ? planets.length - 1 : index - 1;
    final Planet previousPlanet = planets[indexPreviousPlanet];

    final int indexNextPlanet = index == planets.length - 1 ? 0 : index + 1;
    final Planet nextPlanet = planets[indexNextPlanet];

    return Stack(children: <Widget>[
      Positioned(
        bottom: 0,
        right: 0,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: SizedBox(
                width: 100,
                height: 60,
                child: FloatingActionButton.extended(
                  heroTag: 'btn-next-planet',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            DetailPage(nextPlanet, indexNextPlanet),
                        transitionsBuilder: (context, animation,
                                secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                      ),
                    );
                  },
                  label: Row(
                    children: <Widget>[
                      Image.asset(
                        nextPlanet.image,
                        fit: BoxFit.fitWidth,
                        width: 45,
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),
                  backgroundColor: Color.fromARGB(153, 70, 70, 142),
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 0,
        left: 30,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: SizedBox(
                width: 100,
                height: 60,
                child: FloatingActionButton.extended(
                  heroTag: 'btn-previous-planet',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        pageBuilder: (_, __, ___) =>
                            DetailPage(previousPlanet, indexPreviousPlanet),
                        transitionsBuilder: (context, animation,
                                secondaryAnimation, child) =>
                            FadeTransition(opacity: animation, child: child),
                      ),
                    );
                  },
                  label: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_back_ios),
                      Image.asset(
                        previousPlanet.image,
                        fit: BoxFit.fitWidth,
                        width: 45,
                      ),
                    ],
                  ),
                  backgroundColor: Color.fromARGB(153, 70, 70, 142),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
