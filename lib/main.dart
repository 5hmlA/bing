import 'package:bing/snowman.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgprovider;

import 'bing_dundun.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '贇 DunDun',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue.shade200, Colors.white],
                  stops: [0.85, 0.90],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // const Positioned(
          //   bottom: 10,
          //   child: Image(
          //     image: svgprovider.Svg('images/bingdundun.svg'),
          //   ),
          // ),
          // Positioned(
          //   right: 10,
          //   bottom: 120,
          //   child: SvgPicture.asset(
          //     'images/bingdundun.svg',
          //   ),
          // ),
          Align(
            alignment: Alignment.bottomCenter,
            child: BingDunDun(),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints.expand(),
            child: SnowMain(),
          ),
        ],
      ),
    );
  }
}
