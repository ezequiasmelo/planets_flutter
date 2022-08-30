import 'package:flutter/material.dart';
import 'package:planets/common/plannet_summary.dart';
import 'package:planets/common/separator.dart';
import 'package:planets/model/planets.dart';
import 'package:planets/common/text_style.dart';

class DetailPage extends StatelessWidget {
  final Planet planet;

  DetailPage(this.planet);

  Container _getBackground() {
    return Container(
      constraints: BoxConstraints.expand(height: 300.0),
      child: Image.network(
        planet.picture,
        fit: BoxFit.cover,
        height: 300.0,
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: Align(
              alignment: Alignment(0.0, -0.7),
              child: CircularProgressIndicator(),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) =>
            const Text('Some errors occurred!'),
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
    final _overviewTitle = "Overview".toUpperCase();
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
                _overviewTitle,
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
    );
  }
}
