import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impresso_app/core/dependency_injector.dart'
    as dependency_injector;
import 'package:impresso_app/impresso_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
  ));
  await dependency_injector.init();
  runApp(const ImpressoApp());
}
