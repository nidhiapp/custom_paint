import 'package:custom_paint/screens/draw_point.dart';
import 'package:flutter/material.dart';

class CustomClippers extends StatefulWidget {
  const CustomClippers({super.key});

  @override
  State<CustomClippers> createState() => _CustomClippersState();
}

class _CustomClippersState extends State<CustomClippers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 600,
          color: Color.fromARGB(255, 202, 93, 93),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  painter: ClipMaster(),
                  size: Size(400, 300),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DrawPointOnCanvas()));
                    },
                    child: Container(
                        height: 50,
                        width: 150,
                        color: Colors.amber,
                        child: Center(child: Text("move to next"))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClipMaster extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset canvasCenter = Offset(size.width / 2, size.height / 2);
    Rect rectCanvasSize = Offset.zero & size;
    Rect halfCanvasSize = Offset.zero & size / 2;
    Paint paintBlack = Paint()..color = Colors.black;
    Paint paintBlue = Paint()..color = Colors.blue;

    //canvas.clipRect(halfCanvasSize);

    canvas.clipRRect(
        RRect.fromRectAndRadius(halfCanvasSize, Radius.circular(18)));
    canvas.drawRect(rectCanvasSize, paintBlack);
    canvas.drawPath(
        Path()
          ..addOval(
              Rect.fromCenter(center: canvasCenter, width: 100, height: 100)),
        paintBlue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
