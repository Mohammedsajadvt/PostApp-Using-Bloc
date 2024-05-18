import 'package:flutter/material.dart';
import 'package:postblocapp/application/core/services/theme_service.dart';
import 'package:postblocapp/application/features/posts/posts_page.dart';
import 'package:postblocapp/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeServiceProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(builder: (context, themeService, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeService.isDarkModeOn?ThemeMode.dark:ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const PostWrapper(),
       debugShowCheckedModeBanner: false,
      );
    });
  }
}
