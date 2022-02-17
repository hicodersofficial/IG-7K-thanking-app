import 'package:flutter/material.dart';
import 'package:seven_k/home.dart';

void main(List<String> args) {
  return runApp(const HicodersCelebration());
}

class HicodersCelebration extends StatelessWidget {
  const HicodersCelebration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1A1A1A),
      ),
      home: const Home(),
    );
  }
}
