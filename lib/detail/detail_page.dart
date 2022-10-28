import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:planets/common/plannet_summary.dart';
import 'package:planets/common/separator.dart';
import 'package:planets/model/planets.dart';
import 'package:planets/common/text_style.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  const DetailPage(this.planet, {Key? key}) : super(key: key);

  Container _getImageNotFound() {
    return Container(
      constraints: BoxConstraints.expand(height: 300.0),
      child: Image.asset(
        "assets/img/space.png",
        fit: BoxFit.cover,
        height: 300.0,
      ),
    );
  }

  Container _getBackground() {
    return Container(
      constraints: BoxConstraints.expand(height: 300.0),
      child: CachedNetworkImage(
        imageUrl: planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
        progressIndicatorBuilder: (context, url, progress) {
          return Center(
            child: Align(
              alignment: Alignment(0.0, -0.7),
              child: CircularProgressIndicator(),
            ),
          );
        },
        errorWidget: (context, url, error) => _getImageNotFound(),
      ),
    );
  }

  Container _getGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 110.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [Color(0x00736AB7), Color(0xFF736AB7)],
          stops: const [0.0, 0.9],
          begin: FractionalOffset(0.0, 0.0),
          end: FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Widget _getContent() {
    // print(planets[1].id);
    // print(planets
    //     .where((element) => element.id == int.parse(planet.id) + int.parse("1"))
    //     .first
    //     .id);
    // print(int.parse(planet.id) + int.parse("1"));

    final overviewTitle = "Overview".toUpperCase();
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: [
        PlanetSummary(
          planet,
          horizontal: false,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                overviewTitle,
                style: Style.headerTextStyle,
              ),
              Separator(),
              Text(planet.description, style: Style.commonTextStyle),
            ],
          ),
        ),
      ],
    );
  }

  Container _getToolbar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xFF736AB7),
        child: Stack(
          children: [
            _getBackground(),
            _getGradient(),
            _getContent(),
            _getToolbar(context),
          ],
        ),
      ),
      floatingActionButton: Stack(children: <Widget>[
        Positioned(
          bottom: 0,
          right: 0,
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Container(
                  width: 100,
                  height: 60,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    label: Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/img/mercury.png",
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
                child: Container(
                  width: 100,
                  height: 60,
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      // Add your onPressed code here!
                    },
                    label: Row(
                      children: <Widget>[
                        Icon(Icons.arrow_back_ios),
                        Image.asset(
                          "assets/img/mercury.png",
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
      ]),
    );
  }
}
