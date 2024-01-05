import 'package:custom_paint/write_text.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class DrawImage extends StatefulWidget {
  const DrawImage({
    super.key,
  });

  @override
  State<DrawImage> createState() => _DrawImageState();
}

class _DrawImageState extends State<DrawImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  ValueNotifier<ui.Image?> imageNotifier = ValueNotifier<ui.Image?>(null);

  getImage() {
    NetworkImage networkImage = NetworkImage(
        "https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png");
    ImageStream imageStream = networkImage.resolve(ImageConfiguration.empty);
    ImageStreamListener imageStreamListener =
        ImageStreamListener((imageInfo, synchronousCall) {
      imageNotifier.value = imageInfo.image;
    });
    imageStream.addListener(imageStreamListener);
  }

  @override
  void initState() {
    super.initState();
    getImage();
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
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WriteTextOnCanvas()));
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

class ImagePainter extends CustomPainter {
  const ImagePainter({required this.imageInfoNotifier});

  final ValueNotifier<ui.Image?> imageInfoNotifier;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 5
      ..style = PaintingStyle.fill;
    ui.Image? image = imageInfoNotifier.value;
    if (image != null) {
      Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
      Rect imageRect = Offset.zero & imageSize;
      Rect canvasRect = Offset.zero & size;
      canvas.drawImageRect(image,imageRect,canvasRect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
