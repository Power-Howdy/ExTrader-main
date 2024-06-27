import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomDotPainter extends FlDotPainter {
  // @override
  // void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas, Paint paint, Size size) {
  //   final textStyle = TextStyle(
  //     color: paint.color,
  //     fontWeight: FontWeight.bold,
  //     fontSize: 12,
  //   );
  //   final textSpan = TextSpan(
  //     text: '${spot.y.toStringAsFixed(2)}', // Text to display, the Y value of the spot
  //     style: textStyle,
  //   );
  //   final textPainter = TextPainter(
  //     text: textSpan,
  //     textDirection: TextDirection.ltr,
  //   );
  //   textPainter.layout(
  //     minWidth: 0,
  //     maxWidth: size.width,
  //   );
  //   // Calculate the text position (you might need to adjust this)
  //   final x = offsetInCanvas.dx - (textPainter.width / 2);
  //   final y = offsetInCanvas.dy - (textPainter.height + 10); // Adjust the Y position as needed

  //   // Draw a rectangle around the text
  //   final rectPaint = Paint()..color = Colors.white;
  //   final rect = Rect.fromLTWH(x - 5, y - 5, textPainter.width + 10, textPainter.height + 10);
  //   canvas.drawRect(rect, rectPaint);

  //   // Draw the text
  //   textPainter.paint(canvas, Offset(x, y));
  // }
  
  @override
  Size getSize(FlSpot spot) {
    // TODO: implement getSize
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
  
  @override
  void draw(Canvas canvas, FlSpot spot, Offset offsetInCanvas) {
    // TODO: implement draw
  }
}