import 'dart:ui' as ui;
import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree


//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.6014333, size.height * 0.2649573);
    path_0.lineTo(size.width * 1.011111, size.height * 0.2649573);
    path_0.lineTo(size.width * 1.011111, size.height);
    path_0.lineTo(size.width * -0.01111111, size.height);
    path_0.lineTo(size.width * -0.01111111, size.height * 0.2649573);
    path_0.lineTo(size.width * 0.3985667, size.height * 0.2649573);
    path_0.cubicTo(size.width * 0.4065306, size.height * 0.1146906,
        size.width * 0.4489111, 0, size.width * 0.5000000, 0);
    path_0.cubicTo(
        size.width * 0.5510889,
        0,
        size.width * 0.5934694,
        size.height * 0.1146906,
        size.width * 0.6014333,
        size.height * 0.2649573);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.6014333, size.height * 0.2649573);
    path_1.lineTo(size.width * 1.011111, size.height * 0.2649573);
    path_1.lineTo(size.width * 1.011111, size.height);
    path_1.lineTo(size.width * -0.01111111, size.height);
    path_1.lineTo(size.width * -0.01111111, size.height * 0.2649573);
    path_1.lineTo(size.width * 0.3985667, size.height * 0.2649573);
    path_1.cubicTo(size.width * 0.4065306, size.height * 0.1146906,
        size.width * 0.4489111, 0, size.width * 0.5000000, 0);
    path_1.cubicTo(
        size.width * 0.5510889,
        0,
        size.width * 0.5934694,
        size.height * 0.1146906,
        size.width * 0.6014333,
        size.height * 0.2649573);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.6014333, size.height * 0.2649573);
    path_2.lineTo(size.width * 0.5986917, size.height * 0.2663325);
    path_2.lineTo(size.width * 0.5990722, size.height * 0.2735043);
    path_2.lineTo(size.width * 0.6014333, size.height * 0.2735043);
    path_2.lineTo(size.width * 0.6014333, size.height * 0.2649573);
    path_2.close();
    path_2.moveTo(size.width * 1.011111, size.height * 0.2649573);
    path_2.lineTo(size.width * 1.013889, size.height * 0.2649573);
    path_2.lineTo(size.width * 1.013889, size.height * 0.2564103);
    path_2.lineTo(size.width * 1.011111, size.height * 0.2564103);
    path_2.lineTo(size.width * 1.011111, size.height * 0.2649573);
    path_2.close();
    path_2.moveTo(size.width * 1.011111, size.height);
    path_2.lineTo(size.width * 1.011111, size.height * 1.008547);
    path_2.lineTo(size.width * 1.013889, size.height * 1.008547);
    path_2.lineTo(size.width * 1.013889, size.height);
    path_2.lineTo(size.width * 1.011111, size.height);
    path_2.close();
    path_2.moveTo(size.width * -0.01111111, size.height);
    path_2.lineTo(size.width * -0.01388889, size.height);
    path_2.lineTo(size.width * -0.01388889, size.height * 1.008547);
    path_2.lineTo(size.width * -0.01111111, size.height * 1.008547);
    path_2.lineTo(size.width * -0.01111111, size.height);
    path_2.close();
    path_2.moveTo(size.width * -0.01111111, size.height * 0.2649573);
    path_2.lineTo(size.width * -0.01111111, size.height * 0.2564103);
    path_2.lineTo(size.width * -0.01388889, size.height * 0.2564103);
    path_2.lineTo(size.width * -0.01388889, size.height * 0.2649573);
    path_2.lineTo(size.width * -0.01111111, size.height * 0.2649573);
    path_2.close();
    path_2.moveTo(size.width * 0.3985667, size.height * 0.2649573);
    path_2.lineTo(size.width * 0.3985667, size.height * 0.2735043);
    path_2.lineTo(size.width * 0.4009278, size.height * 0.2735043);
    path_2.lineTo(size.width * 0.4013083, size.height * 0.2663325);
    path_2.lineTo(size.width * 0.3985667, size.height * 0.2649573);
    path_2.close();
    path_2.moveTo(size.width * 0.6014333, size.height * 0.2735043);
    path_2.lineTo(size.width * 1.011111, size.height * 0.2735043);
    path_2.lineTo(size.width * 1.011111, size.height * 0.2564103);
    path_2.lineTo(size.width * 0.6014333, size.height * 0.2564103);
    path_2.lineTo(size.width * 0.6014333, size.height * 0.2735043);
    path_2.close();
    path_2.moveTo(size.width * 1.008333, size.height * 0.2649573);
    path_2.lineTo(size.width * 1.008333, size.height);
    path_2.lineTo(size.width * 1.013889, size.height);
    path_2.lineTo(size.width * 1.013889, size.height * 0.2649573);
    path_2.lineTo(size.width * 1.008333, size.height * 0.2649573);
    path_2.close();
    path_2.moveTo(size.width * 1.011111, size.height * 0.9914530);
    path_2.lineTo(size.width * -0.01111111, size.height * 0.9914530);
    path_2.lineTo(size.width * -0.01111111, size.height * 1.008547);
    path_2.lineTo(size.width * 1.011111, size.height * 1.008547);
    path_2.lineTo(size.width * 1.011111, size.height * 0.9914530);
    path_2.close();
    path_2.moveTo(size.width * -0.008333333, size.height);
    path_2.lineTo(size.width * -0.008333333, size.height * 0.2649573);
    path_2.lineTo(size.width * -0.01388889, size.height * 0.2649573);
    path_2.lineTo(size.width * -0.01388889, size.height);
    path_2.lineTo(size.width * -0.008333333, size.height);
    path_2.close();
    path_2.moveTo(size.width * -0.01111111, size.height * 0.2735043);
    path_2.lineTo(size.width * 0.3985667, size.height * 0.2735043);
    path_2.lineTo(size.width * 0.3985667, size.height * 0.2564103);
    path_2.lineTo(size.width * -0.01111111, size.height * 0.2564103);
    path_2.lineTo(size.width * -0.01111111, size.height * 0.2735043);
    path_2.close();
    path_2.moveTo(size.width * 0.4013083, size.height * 0.2663325);
    path_2.cubicTo(
        size.width * 0.4090556,
        size.height * 0.1201342,
        size.width * 0.4502944,
        size.height * 0.008547009,
        size.width * 0.5000000,
        size.height * 0.008547009);
    path_2.lineTo(size.width * 0.5000000, size.height * -0.008547009);
    path_2.cubicTo(
        size.width * 0.4475278,
        size.height * -0.008547009,
        size.width * 0.4040056,
        size.height * 0.1092470,
        size.width * 0.3958250,
        size.height * 0.2635821);
    path_2.lineTo(size.width * 0.4013083, size.height * 0.2663325);
    path_2.close();
    path_2.moveTo(size.width * 0.5000000, size.height * 0.008547009);
    path_2.cubicTo(
        size.width * 0.5497056,
        size.height * 0.008547009,
        size.width * 0.5909444,
        size.height * 0.1201342,
        size.width * 0.5986917,
        size.height * 0.2663325);
    path_2.lineTo(size.width * 0.6041750, size.height * 0.2635821);
    path_2.cubicTo(
        size.width * 0.5959944,
        size.height * 0.1092470,
        size.width * 0.5524722,
        size.height * -0.008547009,
        size.width * 0.5000000,
        size.height * -0.008547009);
    path_2.lineTo(size.width * 0.5000000, size.height * 0.008547009);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xffF1F2F5).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
