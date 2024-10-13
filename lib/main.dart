import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/Home_screen_controller.dart';
import 'package:flutter_application_1/view/home_screen/Home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await HomeScreenController.initDp();
  runApp(MyApp());
}