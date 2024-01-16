import 'package:custom_paint/custom_designs/display2.dart';
import 'package:custom_paint/custom_designs/display3.dart';
import 'package:flutter/material.dart';

class Display1 extends StatelessWidget {
  const Display1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("NEW DESIGN"),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    color: Colors.deepOrangeAccent,
                    height: 200,
                  ),
                ),
              ),
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: const Color.fromARGB(102, 244, 67, 54),
                  height: 180,
                  alignment: Alignment.center,
                  child: const Text(
                    "Wave Clipper",
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.amber),
                  ),
                ),
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CardListScreen()));
              },
              child: Text("move to next"))
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint("width ${size.width.toString()}");
    var path = Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.5, size.height - 50);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
