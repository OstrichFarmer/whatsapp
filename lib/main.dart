import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp/screens/camera_screen.dart';
import 'package:whatsapp/screens/homescreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "OpenSans",
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0XFF128C7E),
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0XFF128C7E),
          primary: const Color(0XFF075E54),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
