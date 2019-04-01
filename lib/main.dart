import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/services.dart';
import 'package:flutter_create/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Create',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: TopWidget()),
          Expanded(child: BottomWidget())
        ],
      ),
    );
  }
}

class TopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        fadeInImageWidget(
            "https://images.pexels.com/photos/1552108/pexels-photo-1552108.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
        Container(
          decoration: BoxDecoration(
            color: blue,
          ),
        ),
        Positioned(
          top: 30,
          left: 2,
          right: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Hero(
                  tag: "Menu",
                  child: Icon(
                    Icons.menu,
                    color: turquoise,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "TRAINER CENTRE",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Container(
                  height: 40,
                  child: Hero(
                    tag: "Workout",
                    child: Icon(
                      Icons.star_border,
                      color: turquoise,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 170,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    color: turquoise,
                    height: 3,
                    width: 30,
                  ),
                  Text(
                    "Most popular",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Text(
                "SPARTAN\nWORKOUT\nPROGRAM",
                maxLines: 3,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}

Widget fadeInImageWidget(String url) {
  return FadeInImage.assetNetwork(
    placeholder: "assets/blank.jpg",
    fit: BoxFit.cover,
    image: url,
    fadeInDuration: Duration(milliseconds: 300),
    fadeInCurve: Curves.ease,
  );
}

class BottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              cell(
                  Colors.white,
                  turquoise,
                  IconItem(
                    icon: Icons.map,
                    title: "MY STATS",
                    color: darkBlue,
                  ),
                  context),
              cell(
                  darkBlue,
                  Colors.white,
                  IconItem(
                    icon: Icons.star,
                    title: "COMPETITION",
                    color: Colors.white,
                  ),
                  context)
            ],
          ),
        ),
        cell(
            turquoise,
            darkBlue,
            IconItem(
              icon: Icons.note,
              title: "WORKOUT",
              color: blue,
            ),
            context)
      ],
    );
  }
}

Widget cell(Color primaryColor, Color splashColor, IconItem iconItem,
    BuildContext ctx) {
  return Expanded(
    child: Hero(
      transitionOnUserGestures: true,
      tag: primaryColor.toString(),
      child: Material(
        color: primaryColor,
        child: InkWell(
          splashColor: splashColor,
          onTap: () {
            if (primaryColor == turquoise) {
              Navigator.push(ctx,
                  MaterialPageRoute(builder: (context) => WorkoutDetails()));
            }
          },
          child: iconItem,
        ),
      ),
    ),
  );
}

class IconItem extends StatelessWidget {
  IconData icon;
  String title;
  Color color = Colors.black;

  IconItem({this.icon, this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: color,
            size: 40,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(color: color, fontSize: 20),
          )
        ],
      ),
    );
  }
}

class WorkoutDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(child: WorkoutSummary()),
          Expanded(child: RepCounter())
        ],
      ),
    );
  }
}

class WorkoutSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        fadeInImageWidget(
            "https://images.pexels.com/photos/1229356/pexels-photo-1229356.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
        Container(
          decoration: BoxDecoration(
            color: blue,
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: FlareActor("assets/create.flr",
              alignment: Alignment.center,
              fit: BoxFit.contain,
              animation: "idle"),
        ),
        Positioned(
          child: Text(
            "DUMBBELL CURLS",
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          left: 15,
          right: 75,
          bottom: 10,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {},
              splashColor: darkBlue,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Hero(
                  tag: "Workout",
                  child: Icon(
                    Icons.star_border,
                    color: turquoise,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 2,
          right: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: turquoise,
                      ),
                      onPressed: () => Navigator.pop(context))),
              Expanded(
                child: Text(
                  "", //took out the title because it didnt look nice but kept the expanded because it puts the icons on either ends
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Hero(
                  tag: "Menu",
                  child: Icon(
                    Icons.menu,
                    color: turquoise,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class RepCounter extends StatefulWidget {
  @override
  _RepCounterState createState() => _RepCounterState();
}

class _RepCounterState extends State<RepCounter> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    );
    _animation = _controller;

    _animation = new Tween<double>(
      begin: _animation.value,
      end: 8,
    ).animate(new CurvedAnimation(
      curve: Curves.easeInOut,
      parent: _controller,
    ));

    _controller.forward(from: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height * 0.3;

    return Center(
      child: Container(
        color: Colors.white,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: turquoise.toString(),
              child: ClipPath(
                clipper: DialogonalClipper(),
                clipBehavior: Clip.antiAlias,
                child: Container(
                  color: turquoise,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _animation,
                builder: (BuildContext context, Widget child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _animation.value.toStringAsFixed(1).substring(0, 1),
                        style: TextStyle(
                            color: darkBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: size),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "REPS",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: darkBlue),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Text(
                            "AT 30 lb",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: darkBlue),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DialogonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
