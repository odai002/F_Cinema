import 'package:flutter/material.dart';

class Responsive {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // 🔹 لتسهيل استخدام النسب — يمكنك أيضاً إضافة:
  static double heightRatio(BuildContext context, double value) {
    return getHeight(context) * value;
  }

  static double widthRatio(BuildContext context, double value) {
    return getWidth(context) * value;
  }

  static double textRatio(BuildContext context, double value) {
    // مقياس نص متناسب مع العرض عادةً
    return getWidth(context) * value;
  }
}
