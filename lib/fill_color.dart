import 'package:custom_paint/draw_point.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class FillColorInCanvas extends StatefulWidget {
  const FillColorInCanvas({
    super.key,
  });

  @override
  State<FillColorInCanvas> createState() => _FillColorInCanvasState();
}

class _FillColorInCanvasState extends State<FillColorInCanvas>
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
          child: Column(
            children: [
              CustomPaint(
                painter: CustomPainterUserGuide(
               //   animationController: _animationController,
                ),
                size: Size(100, 300),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DrawPointOnCanvas()));
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

class CustomPainterUserGuide extends CustomPainter {
  // CustomPainterUserGuide({
  //   //AnimationController? animationController
  //   })
     // : _animationController = animationController,
     //   super(repaint: animationController);

  //final AnimationController? _animationController;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.fill
      ..shader = ui.Gradient.linear(Offset(size.width / 2, 200),
          Offset(size.width / 2, 80), [Colors.pinkAccent, Colors.amberAccent]);

    //canvas.drawColor(const Color.fromARGB(255, 214, 195, 201), BlendMode.src);
    canvas.clipRect(Offset.zero & size);
    canvas.drawPaint(paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
