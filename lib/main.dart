import 'package:flutter/material.dart';
import 'package:study/login/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        builder: (context, child) =>
            Directionality(textDirection: TextDirection.rtl, child: child!),
        home: const MySplashscreen()),
  );
}
