import 'package:custom_paint/screens/write_text.dart';
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
      List<RSTransform> transforms = [
        RSTransform.fromComponents(
            rotation: 0,
            scale: 1.5,
            anchorX: 10,
            anchorY: 0,
            translateX: 0,
            translateY: 0),
        RSTransform.fromComponents(
            rotation: 0,
            scale: 1,
            anchorX: 0,
            anchorY: 0,
            translateX: 100,
            translateY: 100),
        RSTransform.fromComponents(
            rotation: 0.3,
            scale: 1,
            anchorX: 0,
            anchorY: 0,
            translateX: 200,
            translateY: 300)
      ];
      List<Rect> rects = [
        Rect.fromLTWH(0, 0, 100, 100),
        Rect.fromLTWH(100, 100, 100, 100),
        Rect.fromLTWH(200, 300, 100, 100)
      ];

      List<Color> colors = [
        Colors.white.withOpacity(0.2),
        Colors.red.withOpacity(0.5),
        Colors.blue.withOpacity(0.5)
      ];

      canvas.drawAtlas(image, transforms, rects, colors, BlendMode.plus, null, paint);
      // Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
      // Rect imageRect = Offset.zero & imageSize;
      // Rect canvasRect = Offset.zero & size;
      // canvas.drawImageRect(image,imageRect,canvasRect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
