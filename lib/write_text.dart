import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class WriteTextOnCanvas extends StatefulWidget {
  const WriteTextOnCanvas({
    super.key,
  });

  @override
  State<WriteTextOnCanvas> createState() => _WriteTextOnCanvasState();
}

class _WriteTextOnCanvasState extends State<WriteTextOnCanvas>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  ValueNotifier<ui.Image?> imageNotifier = ValueNotifier<ui.Image?>(null);

  @override
  void initState() {
    super.initState();
  }

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
                  painter: ImagePainter(imageInfoNotifier: imageNotifier),
                  size: Size(400, 300),
                ),
                // TextButton(
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => CustomPaint3()));
                //   },
                //   child: Container(height: 50,width: 150,color: Colors.amber,
                //     child: Center(child: Text("move to next"))))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImagePainter extends CustomPainter {
  const ImagePainter({required this.imageInfoNotifier});

  final ValueNotifier<ui.Image?> imageInfoNotifier;

  @override
  void paint(Canvas canvas, Size size) {
    ui.ParagraphStyle paragraphStyle = ui.ParagraphStyle(
      fontSize: 30,
      fontWeight: FontWeight.w400,
    );
    ui.TextStyle textStyle = ui.TextStyle(color: Colors.red);
    ui.ParagraphBuilder paragraphBuilder = ui.ParagraphBuilder(paragraphStyle);

    paragraphBuilder.pushStyle(textStyle);
    paragraphBuilder.addText("hello folks, welcome to the custom paint");
    ui.Paragraph paragraph = paragraphBuilder.build();
    paragraph.layout(ui.ParagraphConstraints(width: size.width));
    canvas.drawParagraph(paragraph, Offset.zero);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
