import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CustomPaint(
                // size: Size(50, 50), // Set the size of the icon
                painter: LeafShapePainter(),
                child: Center(
                  child: Icon(
                    Icons.close, // Cross symbol
                    color: Colors.white, // Color of the icon
                    size: 30, // Size of the cross icon
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class LeafShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF3B5998) // Blue color
      ..style = PaintingStyle.fill;
    Path path = Path();
    double width = 60;
    double height = 60;
    // Create the rounded leaf-like shape
    path.moveTo(width * 0.5, 0); // Top center
    path.quadraticBezierTo(width, 0, width, height * 0.5); // Right curve
    path.quadraticBezierTo(width, height, width * 0.5, height); // Bottom curve
    path.quadraticBezierTo(0, height, -10, height * 0.8); // Left curve
    path.quadraticBezierTo(0, 0, width * 0.8, -10); // Top curve
    path.close();
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: CustomIconButton(),
//   ));
// }