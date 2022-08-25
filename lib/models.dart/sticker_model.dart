import 'package:flutter/material.dart';

import '../constants/sizes.dart';

class StickerModel {
  String imgpath;
  StickerModel(this.imgpath);
  double fulw = 200;
  double fulh = 200;
  double iconsize = 30;
  Offset offset = Offset(w * 0.5, h * 0.5 * 0.5);
  double finalAngle = 0.0;
  double oldAngle = 0.0;
  double upsetAngle = 0.0;
  Offset start = Offset.zero;
  Offset end = Offset.zero;
  double startDistance = 0;
  double newDistance = 0;
  double scale = 1.0;
  bool isMirror = false;
  bool isVisible = true;
}
