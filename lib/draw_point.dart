import 'dart:typed_data';

import 'package:custom_paint/draw_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DrawPointOnCanvas extends StatefulWidget {
  const DrawPointOnCanvas({
    super.key,
  });

  @override
  State<DrawPointOnCanvas> createState() => _DrawPointOnCanvasState();
}

class _DrawPointOnCanvasState extends State<DrawPointOnCanvas>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 600,
          color: const Color.fromARGB(255, 245, 240, 240),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  painter: CustomPainterCanvas(
                    animationController: _animationController,
                  ),
                  size: Size(400, 300),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DrawImage()));
                  },
                  child: Container(height: 50,width: 150,color: Colors.amber,
                    child: Center(child: Text("move to next"))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomPainterCanvas extends CustomPainter {
  CustomPainterCanvas({AnimationController? animationController})
      : _animationController = animationController,
        super(repaint: animationController);

  final AnimationController? _animationController;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;
    final Float32List points = Float32List.fromList(
        [0, 0, size.width, 0, size.width / 2, size.height / 2, 0, 0]);
    // final List<Offset> points = <Offset>[
    //   Offset.zero,
    //   Offset(size.width, 0),
    //   Offset(size.width , size.height/2 ),
    //   Offset.zero
    // ];
    //canvas.drawPoints(ui.PointMode.polygon, points, paint);

    canvas.drawRawPoints(ui.PointMode.polygon, points, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
