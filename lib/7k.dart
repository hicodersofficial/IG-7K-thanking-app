// ignore_for_file: file_names
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SevenK extends StatefulWidget {
  const SevenK({Key? key}) : super(key: key);

  @override
  _SevenKState createState() => _SevenKState();
}

class _SevenKState extends State<SevenK> with TickerProviderStateMixin {
  AnimationController? _controller;
  bool _skyShot = false;
  double _bottom = -150;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller!.addListener(() {
      if (_controller!.isCompleted) {
        setState(() {
          _skyShot = true;
          _bottom = MediaQuery.of(context).size.height * 10 / 100;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          if (!_skyShot)
            Lottie.asset(
              "assets/animations/2.json",
              fit: BoxFit.fitHeight,
              controller: _controller,
              repeat: false,
              onLoaded: (composition) {
                _controller!
                  ..duration =
                      composition.duration - const Duration(milliseconds: 1000)
                  ..forward();
              },
            ),
          if (_skyShot) Lottie.asset("assets/animations/3.json"),

          //   if (_skyShot) Lottie.asset("assets/animations/3.json"),
          // Image.asset(
          //   "assets/images/7k.png",
          //   height: 800,
          // ),

          ZoomIn(
            duration: const Duration(milliseconds: 2000),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Thank You!",
                    style: TextStyle(
                      color: Color(0xFFFF8C09),
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "7K",
                    style: TextStyle(
                      color: Color(0xFFFF8C09),
                      fontSize: 200,
                      fontWeight: FontWeight.bold,
                      height: .95,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_skyShot)
            Positioned(
              left: -width * 33 / 100,
              width: width,
              bottom: height * 13 / 100,
              child: FadeInLeft(
                child: SizedBox(
                  height: 300,
                  child: Lottie.asset(
                    "assets/animations/4.json",
                  ),
                ),
              ),
            ),

          AnimatedPositioned(
            duration: const Duration(milliseconds: 800),
            bottom: _bottom,
            width: width,
            child: Column(
              children: const [
                Text(
                  "Followers",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "@hi.coders",
                  style: TextStyle(
                    color: Color(0xFF727272),
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Lottie.asset("assets/animations/4.json"),
          // Center(child: Lottie.asset("assets/animations/1.json")),
        ],
      ),
    );
  }
}
