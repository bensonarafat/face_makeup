import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(
    this.faces,
    this.makeup,
  );

  final List<Face> faces;
  final Map<String, dynamic> makeup;
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;
    print("Paint size ${size.height} ${size.width}");
    final Paint lipspaint = Paint()
      ..style = PaintingStyle.fill
      ..blendMode = BlendMode.color
      ..color = makeup['color'];
    // ..color = Colors.red;

    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..color = Colors.red;

    void paintContourLip(FaceContourType top, FaceContourType bottom) {
      for (final Face face in faces) {
        final topLipContour = face.contours[top];
        final bottomLipContour = face.contours[bottom];
        //create path
        Path path = Path();
        if (topLipContour?.points != null) {
          int c = 0;
          for (final Point point in topLipContour!.points) {
            if (c == 0) {
              path.moveTo(point.x.toDouble(), point.y.toDouble());
            } else {
              path.lineTo(point.x.toDouble(), point.y.toDouble());
            }
            c++;
          }
        }
        if (bottomLipContour?.points != null) {
          for (final Point point in bottomLipContour!.points) {
            path.lineTo(point.x.toDouble(), point.y.toDouble());
          }
        }

        canvas.drawPath(path, lipspaint);
      }
    }

    if (makeup['type'] == "lips") {
      // Top lips
      paintContourLip(
        FaceContourType.upperLipTop,
        FaceContourType.upperLipBottom,
      );

      //bottom lips
      paintContourLip(
        FaceContourType.lowerLipTop,
        FaceContourType.lowerLipBottom,
      );
    }
    for (final Face face in faces) {
      void paintContour(FaceContourType type) {
        final faceContour = face.contours[type];
        if (faceContour?.points != null) {
          for (final Point point in faceContour!.points) {
            canvas.drawCircle(
              Offset(
                point.x.toDouble(),
                point.y.toDouble(),
              ),
              1,
              paint,
            );
          }
        }
      }

      paintContour(FaceContourType.face);
      paintContour(FaceContourType.leftEyebrowTop);
      paintContour(FaceContourType.leftEyebrowBottom);
      paintContour(FaceContourType.rightEyebrowTop);
      paintContour(FaceContourType.rightEyebrowBottom);
      paintContour(FaceContourType.leftEye);
      paintContour(FaceContourType.rightEye);
      paintContour(FaceContourType.upperLipTop);
      paintContour(FaceContourType.upperLipBottom);
      paintContour(FaceContourType.lowerLipTop);
      paintContour(FaceContourType.lowerLipBottom);
      paintContour(FaceContourType.noseBridge);
      paintContour(FaceContourType.noseBottom);
      paintContour(FaceContourType.leftCheek);
      paintContour(FaceContourType.rightCheek);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
