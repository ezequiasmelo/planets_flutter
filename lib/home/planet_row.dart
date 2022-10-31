import 'package:flutter/material.dart';
import 'package:planets/common/text_style.dart';
import 'package:planets/detail/detail_page.dart';
import 'package:planets/model/planets.dart';

class PlanetRow extends StatelessWidget {
  late final Planet? planet;
  late final int index;

  PlanetRow(this.planet, this.index, {super.key});

  late final planetThumbnail = Container(
    margin: EdgeInsets.symmetric(
      vertical: 16.0,
    ),
    alignment: FractionalOffset.centerLeft,
    child: Hero(
      tag: "planet-hero-${planet!.id}",
      child: Image(
        image: AssetImage(
          planet!.image,
        ),
        width: 92.0,
        height: 92.0,
      ),
    ),
  );

  late final headerTextStyle = Style.baseTextStyle.copyWith(
    color: Colors.white,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  );

  late final regularTextStyle = Style.baseTextStyle.copyWith(
    color: const Color(0xffb6b2df),
    fontSize: 7.0, // fontSize: 9.0,
    fontWeight: FontWeight.w400,
  );

  late final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);

  Widget _planetValue({String? value, String? image}) {
    return Row(children: <Widget>[
      Image.asset(
        image!,
        height: 11.0, // height: 12.0,
      ),
      Container(
        width: 8.02,
      ),
      Text(
        value!,
        style: regularTextStyle,
      ),
    ]);
  }

  late final planetCardContent = Container(
    margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
    constraints: BoxConstraints.expand(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: 4.0),
        Text(
          planet!.name,
          style: headerTextStyle,
        ),
        Container(height: 10.0),
        Text(
          planet!.location,
          style: subHeaderTextStyle,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 2.0,
          width: 18.0,
          color: Color(0xff00c6ff),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: _planetValue(
                value: planet!.distance,
                image: 'assets/img/ic_distance.png',
              ),
            ),
            Expanded(
              child: _planetValue(
                value: planet!.distance,
                image: 'assets/img/ic_gravity.png',
              ),
            ),
          ],
        ),
      ],
    ),
  );

  late final planetCard = Container(
    height: 124.0,
    margin: EdgeInsets.only(
      left: 46.0,
    ),
    decoration: BoxDecoration(
      color: Color(0xFF333366),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: Offset(0.0, 10.0),
        )
      ],
    ),
    child: planetCardContent,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => DetailPage(planet!, index),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: Stack(children: [
          planetCard,
          planetThumbnail,
        ]),
      ),
    );
  }
}
