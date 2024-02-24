import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/get_all_post/get_all_notifire.dart';
import 'provider/get_complete_post/get_complete_post_notifire.dart';
import 'ui/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // 1
        ChangeNotifierProvider(
          create: (_) => GetAllNotifier(),
        ),
        // 2
        ChangeNotifierProvider(
          create: (_) => GetCompletePostNotifer(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blog App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
