import 'package:custom_paint/fill_color.dart';
import 'package:flutter/material.dart';

class CustomPaint4 extends StatelessWidget {
  const CustomPaint4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Container(
          // height: 500,
          // width: 400,
          color: const Color.fromARGB(255, 235, 232, 223),
          child: Column(
            children: [
              CustomPaint(
                painter: MasterPainter(),
                size: const Size(300, 400),
              ),
              CustomPaint(
                painter: MasterPainter2(),
                size: const Size(300, 200),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  FillColorInCanvas()));
                  },
                  child: Container(
                      height: 50,
                      width: 150,
                      color: Colors.amber,
                      child: const Center(child: Text("move to next"))))
            ],
          ),
        ),
      ),
    );
  }
}

class MasterPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.fill;
    Rect bigRect = Rect.fromLTRB(10, 20,100, 200);
    Rect smallRect = Rect.fromLTRB(20, 30, 100, 180);

    RRect bigRRect = RRect.fromRectXY(bigRect, 75, 25);
    RRect smallRRect = RRect.fromRectXY(smallRect, 75, 25);
    canvas.drawDRRect(bigRRect, smallRRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MasterPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;
    Rect bigRect = Rect.fromLTRB(10, 20, 100, 200);
   // Rect smallRect = Rect.fromLTRB(20, 30, 100, 180);

    RRect bigRRect = RRect.fromRectXY(bigRect, 75, 25);
    //RRect smallRRect = RRect.fromRectXY(smallRect, 75, 25);
    canvas.drawRRect(bigRRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
