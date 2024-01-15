import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DrawArc extends StatelessWidget {
  const DrawArc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        //height: 400,
        // width: 600,
        color: const Color.fromARGB(255, 245, 240, 240),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              painter: DrawArcPainter(),
              size: const Size(400, 300),
            ),
            // TextButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => const SavelayerToBlendLayer()));
            //     },
            //     child: Container(
            //         height: 50,
            //         width: 150,
            //         color: Colors.amber,
            //         child: const Center(child: Text("move to next"))))
          ],
        ),
      ),
    );
  }
}

class DrawArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = Colors.black;
    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);
    Path path = Path()
      ..moveTo(10, size.height/8 )
      ..relativeConicTo(
          size.width/4, size.height, size.width, size.height / 2, 0.5);
    canvas.drawPath(path, paint);
    // Rect rect = Rect.fromCircle(
    //     center: Offset(size.width / 2, size.height / 2), radius: 100);
    // Path path = Path();

    // // canvas.drawArc(rect, 90, 270, true, paint);
    // path.addArc(
    //   rect,
    //   0,
    //   math.pi / 2,
    // );
    // path.arcToPoint(Offset(100, 300),radius: Radius.circular(32), largeArc: true,clockwise: true,rotation: 45);
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
