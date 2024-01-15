import 'package:custom_paint/screens/arc.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SavelayerToBlendLayer extends StatelessWidget {
  const SavelayerToBlendLayer({super.key});

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
              painter: BlendLyerPainter(),
              size: const Size(400, 300),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DrawArc()));
                },
                child: Container(
                    height: 50,
                    width: 150,
                    color: Colors.amber,
                    child: const Center(child: Text("move to next"))))
          ],
        ),
      ),
    );
  }
}

class BlendLyerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.purple;
    // ..strokeWidth = 5;
    //  ..style = PaintingStyle.stroke;
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(size.width/4, size.height),
            width: 120,
            height: 120),
        paint);
    canvas.drawRect(
        Rect.fromLTWH(50, 20, 140, 150), paint..color = Colors.green);
    canvas.drawRect(
      Rect.fromLTWH(50, 100, 200, 200), paint..color = Colors.yellow, );

    //     ..shader = ui.Gradient.linear(Offset(size.width / 2, 200),
    //         Offset(size.width / 2, 80), [Colors.pinkAccent, Colors.amberAccent]);
    //   Rect rect = Rect.fromLTRB(20, 20, 180, 180);

    //   // Draw the filled rectangle on the canvas
    //   canvas.drawRect(rect, paint);
    //   canvas.drawRect(
    //       Rect.fromCenter(
    //           center: Offset(size.width / 2, size.height / 2),
    //           width: size.width,
    //           height: size.height),
    //       paint);
    //   canvas.drawRect(
    //       Rect.fromCenter(
    //           center: Offset(size.width / 2, size.height / 2),
    //           width: 200,
    //           height: 200),
    //       paint);
    //   canvas.drawRect(Rect.fromLTRB(0, 0, 20, 30), paint);
    //   canvas.drawRect(
    //       Rect.fromCenter(
    //           center: Offset(size.width / 2, size.height / 2),
    //           width: 100,
    //           height: 100),
    //       paint..color = Colors.green);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
