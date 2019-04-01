import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(A());

Color blue = Color.fromRGBO(17, 63, 103, 0.7),
    dBlue = Color.fromRGBO(17, 63, 103, 1),
    turq = Color.fromRGBO(68, 239, 223, 1);

class A extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create',
      home: H(true),
    );
  }
}

class H extends StatelessWidget {
  bool m;

  H(this.m);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(child: T(m)),
            Expanded(child: B(m, context))
          ],
        ),
      );
}

Widget T(bool m) => Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(
          m ? "assets/s.jpeg" : "assets/p.jpeg",
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            color: blue,
          ),
        ),
        Positioned(
          top: 40,
          left: 20,
          child: m
              ? Hero(
                  tag: "menu",
                  child: Icon(
                    Icons.menu,
                    color: turq,
                  ),
                )
              : Icon(
                  Icons.arrow_back_ios,
                  color: turq,
                ),
        ),
        Positioned(
          top: 40,
          right: 20,
          child: m
              ? Icon(
                  Icons.star_border,
                  color: turq,
                )
              : Hero(
                  tag: "menu",
                  child: Icon(
                    Icons.menu,
                    color: turq,
                  )),
        ),
        m
            ? Container()
            : Align(
                alignment: Alignment.center,
                child: FlareActor("assets/create.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: "idle"),
              ),
        Positioned(
          bottom: 10,
          left: 30,
          right: 30,
          child: Text(
            m ? "SPARTAN WORKOUT" : "BICEP CURLS",
            style: TextStyle(
                fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );

Widget B(bool m, BuildContext c) {
  var size = MediaQuery.of(c).size.height * 0.3;

  Widget first = Row(
    children: <Widget>[
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            cell(
                Colors.white,
                turq,
                I(
                  Icons.map,
                  "MY STATS",
                  dBlue,
                ),
                c),
            cell(
                dBlue,
                Colors.white,
                I(
                  Icons.star,
                  "COMPETITION",
                  Colors.white,
                ),
                c)
          ],
        ),
      ),
      cell(
          turq,
          dBlue,
          I(
            Icons.note,
            "WORKOUT",
            blue,
          ),
          c)
    ],
  );

  Widget second = Container(
    color: Colors.white,
    child: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Hero(
          tag: turq.toString(),
          child: ClipPath(
            clipper: C(),
            child: Container(
              color: turq,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            "8",
            style: TextStyle(
                color: dBlue, fontWeight: FontWeight.bold, fontSize: size),
          ),
        )
      ],
    ),
  );

  return m ? first : second;
}

Widget cell(Color prim, Color spl, I iconItem, BuildContext c) => Expanded(
      child: Hero(
        transitionOnUserGestures: true,
        tag: prim.toString(),
        child: Material(
          color: prim,
          child: InkWell(
            splashColor: spl,
            onTap: () {
              if (prim == turq) {
                Navigator.push(c, MaterialPageRoute(builder: (c) => H(false)));
              }
            },
            child: iconItem,
          ),
        ),
      ),
    );

class I extends StatelessWidget {
  IconData i;
  String t;
  Color c = Colors.black;

  I(this.i, this.t, this.c);

  @override
  Widget build(BuildContext context) => Center(
        child: Icon(
          i,
          color: c,
          size: 40,
        ),
      );
}

class C extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => Path()
    ..lineTo(0, size.height)
    ..lineTo(size.width, size.height)
    ..close();

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
