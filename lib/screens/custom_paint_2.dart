import 'package:custom_paint/screens/custom_paint_3.dart';
import 'package:flutter/material.dart';

class CustomPaint2 extends StatelessWidget {
  const CustomPaint2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        children: [
          Center(
              child: Container(
            height: 400,
            width: 400,
            color: const Color.fromARGB(255, 210, 205, 189),
            child: Center(
              child: CustomPaint(
                painter: MasterPainter(),
              ),
            ),
          )),
           TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomPaint3()));
                  },
                  child: Container(height: 50,width: 150,color: Colors.amber,
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
    canvas.drawCircle(Offset(size.width, size.height), 40, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
