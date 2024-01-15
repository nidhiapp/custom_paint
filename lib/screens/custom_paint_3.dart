import 'package:custom_paint/screens/custom_paint_4.dart';
import 'package:flutter/material.dart';

class CustomPaint3 extends StatelessWidget {
  const CustomPaint3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // height: 400,
            // width: 400,
            color: const Color.fromARGB(255, 210, 205, 189),
            child: Center(
              child: Column(
                children: [
                  CustomPaint(
                    painter: MasterPainter(),
                    size: Size(300, 300),
                  ),
                  CustomPaint(
                    painter: MasterPainter2(),
                    size: Size(300, 50),
                  ),
                    CustomPaint(
                    painter: MasterPainter3(),
                    size: Size(200, 200),
                  )
                ],
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CustomPaint4()));
              },
              child: Container(
                  height: 50,
                  width: 150,
                  color: Colors.amber,
                  child: Center(child: Text("move to next"))))
        ],
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
    paint.style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawRect(
        Rect.fromCenter(center: center, width: 100, height: 100), paint);
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
    Offset center = Offset(size.width / 4, size.height / 5);
    canvas.drawRect(Rect.fromCircle(center: center, radius: 20), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MasterPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 4, size.height / 5);
    canvas.drawRect(Rect.fromLTRB(10, 10, 200, 100), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MasterPainter4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;
   // Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawRect(Rect.fromLTWH(10, 10, 200, 50), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
