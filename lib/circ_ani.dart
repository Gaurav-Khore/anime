import 'package:flutter/material.dart';

class CircAni extends StatefulWidget {
  @override
  _CircAniState createState() => _CircAniState();
}

class _CircAniState extends State<CircAni> with SingleTickerProviderStateMixin {
  AnimationController xconto;
  AnimationController yconto;
  var x;
  var xanime;
  var car, caranime;
  var i = 0;

  @override
  void initState() {
    super.initState();
    xconto = AnimationController(vsync: this, duration: Duration(seconds: 7));

    xconto.forward();
    xconto.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          i = i + 1;
          print("i = $i");
        });
        print("z = $i");
        if (i == 4) {
          Navigator.pushNamed(context, 'home');
        } else {
          xconto.reset();
        }
      } else if (status == AnimationStatus.dismissed) {
        xconto.forward();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    xconto.dispose();
  }

  @override
  Widget build(BuildContext context) {
    xanime = Tween(begin: 0.0, end: 50.0).animate(xconto)
      ..addListener(() {
        setState(() {
          x = xanime.value;
        });
      });
    caranime = Tween(begin: 300.0, end: -300.0).animate(xconto)
      ..addListener(() {
        setState(() {
          car = caranime.value;
        });
      });
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.4,
          left: 10.0,
          right: 10.0,
          bottom: MediaQuery.of(context).size.height * 0.3,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5.0,
                spreadRadius: 5.0,
              ),
            ],
            image: DecorationImage(
                image: ExactAssetImage("images/bg1.jpg"), fit: BoxFit.fill),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: 135.0),
            child: Transform.translate(
              offset: Offset(car == null ? 0.0 : car, 110.0),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                      height: 100.0,
                      child: Image.asset(
                        "images/car.png",
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.045,
                        bottom: 5.0),
                    child: Transform.rotate(
                      angle: x == null ? 6.25 : x,
                      child: Container(
                        child: Image.asset("images/wheel.png"),
                        width: 42.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.256,
                        bottom: 5.0),
                    child: Transform.rotate(
                      angle: x == null ? 6.25 : x,
                      child: Container(
                        child: Image.asset("images/wheel.png"),
                        width: 42.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
