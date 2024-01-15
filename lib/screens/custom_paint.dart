import 'package:custom_paint/screens/custom_paint_2.dart';
import 'package:flutter/material.dart';

class CustomPaint1 extends StatelessWidget {
  const CustomPaint1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(automaticallyImplyLeading: true,),
      body: Center(
        child: Container(
          height: 500,
          width: 400,
          color: const Color.fromARGB(255, 235, 232, 223),
          child: Column(
            children: [
              CustomPaint(
                painter: MasterPainter(),
                size: Size(300, 400),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomPaint2()));
                  },
                  child: Container(height: 50,width: 150,color: Colors.amber,
                    child: Center(child: Text("move to next"))))
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
    paint.strokeWidth = 2;
    paint.color = Colors.black;
    canvas.drawLine(Offset.zero, Offset(size.width, 0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
