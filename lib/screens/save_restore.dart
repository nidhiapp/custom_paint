import 'package:custom_paint/screens/save_layer_to_blendlayer.dart';
import 'package:flutter/material.dart';

class SaveAndRestore extends StatefulWidget {
  const SaveAndRestore({super.key});

  @override
  State<SaveAndRestore> createState() => _SaveAndRestoreState();
}

class _SaveAndRestoreState extends State<SaveAndRestore> {
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
          color: const Color.fromARGB(255, 245, 240, 240),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  painter: SaveAndRestorePainter(),
                  size: const Size(400, 300),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SavelayerToBlendLayer()));
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

class SaveAndRestorePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 2;
    canvas.save();
    canvas.translate(20, 0);
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: 200,
            height: 200),
        paint);

   canvas.restore();

    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: 100,
            height: 100),
        paint..color = Colors.yellow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
