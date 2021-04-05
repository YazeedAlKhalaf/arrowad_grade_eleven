import 'package:arrowad_grade_eleven/src/app/app.dart';
import 'package:arrowad_grade_eleven/src/app/locator/locator.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(App());
}
