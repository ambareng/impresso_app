import 'package:flutter/material.dart';

double height(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.height * ratio;
}

double width(BuildContext context, double ratio) {
  return MediaQuery.of(context).size.width * ratio;
}
