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
              TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const CustomPaint2()));
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
    paint.strokeWidth = 2;
    paint.color = Colors.black;
    paint.style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    Rect rect =  Rect.fromLTRB(10, 20, 100, 200);
    canvas.drawRRect( RRect.fromRectXY( rect,
     // y-radius for the top-left corner
      30,  // x-radius for the bottom-right corner
      25,), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
